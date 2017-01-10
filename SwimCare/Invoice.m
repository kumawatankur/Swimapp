//
//  Invoice.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "Invoice.h"
#import "Dashboard.h"
#import "InvoiceCell.h"
#import <QuartzCore/QuartzCore.h>
#define kPayPalEnvironment PayPalEnvironmentNoNetwork
@interface Invoice ()
{
    NSArray*names;
    NSArray*fees;
}
@property(nonatomic, strong, readwrite) PayPalConfiguration *payPalConfig;


@end

@implementation Invoice
- (BOOL)acceptCreditCards {
    return self.payPalConfig.acceptCreditCards;
}

- (void)setAcceptCreditCards:(BOOL)acceptCreditCards {
    self.payPalConfig.acceptCreditCards = acceptCreditCards;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    names = [[NSArray alloc]initWithObjects:@"ankur",@"kumawat", nil];
    fees = [[NSArray alloc]initWithObjects:@"250",@"250", nil];
    NSInteger sum = 0;
    for (NSNumber *num in fees)
    {
        sum += [num intValue];
    }
    NSLog(@"== %ld",(long)sum);
    NSString *someString = [NSString stringWithFormat:@"%ld", (long)sum];

    NSString *combined = [NSString stringWithFormat: @"%@%@",
                          @"$", someString];
       _total.text = combined ;
    // Do any additional setup after loading the view.
    
    // Set up payPalConfig
    _payPalConfig = [[PayPalConfiguration alloc] init];
#if HAS_CARDIO
    // You should use the PayPal-iOS-SDK+card-Sample-App target to enable this setting.
    // For your apps, you will need to link to the libCardIO and dependent libraries. Please read the README.md
    // for more details.
    _payPalConfig.acceptCreditCards = YES;
#else
    _payPalConfig.acceptCreditCards = NO;
#endif
    _payPalConfig.merchantName = @"Awesome Shirts, Inc.";
    _payPalConfig.merchantPrivacyPolicyURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
    _payPalConfig.merchantUserAgreementURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];
    
    // Setting the languageOrLocale property is optional.
    //
    // If you do not set languageOrLocale, then the PayPalPaymentViewController will present
    // its user interface according to the device's current language setting.
    //
    // Setting languageOrLocale to a particular language (e.g., @"es" for Spanish) or
    // locale (e.g., @"es_MX" for Mexican Spanish) forces the PayPalPaymentViewController
    // to use that language/locale.
    //
    // For full details, including a list of available languages and locales, see PayPalPaymentViewController.h.
    
    _payPalConfig.languageOrLocale = [NSLocale preferredLanguages][0];
    
    
    // Setting the payPalShippingAddressOption property is optional.
    //
    // See PayPalConfiguration.h for details.
    
    _payPalConfig.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.successView.hidden = YES;
    
    // use default environment, should be Production in real life
    self.environment = kPayPalEnvironment;
    
    NSLog(@"PayPal iOS SDK version: %@", [PayPalMobile libraryVersion]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return names .count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    InvoiceCell *cell = [_table_view dequeueReusableCellWithIdentifier:@"htrcell"];
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.name.text=[NSString stringWithFormat:@"%@",[names objectAtIndex:indexPath.row]];
    
   
    
    cell.fees.text = [NSString stringWithFormat:@"%@%@",@"$",[fees objectAtIndex:indexPath.row]];
    
    cell.backgroundColor=[UIColor clearColor];
    
    
    
    return cell;
    
}
- (IBAction)payment:(id)sender {
    
    
    
    NSError *error;
    
    
    if (!error)
    {
        // call webservice for succes
        
        // Remove our last completed payment, just for demo purposes.
        self.resultText = nil;
        
        // Note: For purposes of illustration, this example shows a payment that includes
        //       both payment details (subtotal, shipping, tax) and multiple items.
        //       You would only specify these if appropriate to your situation.
        //       Otherwise, you can leave payment.items and/or payment.paymentDetails nil,
        //       and simply set payment.amount to your total charge.
        
        // Optional: include multiple items
        PayPalItem *item1 = [PayPalItem itemWithName:@"Old jeans with holes"
                                        withQuantity:1
                                           withPrice:[NSDecimalNumber decimalNumberWithString:@"500"]
                                        withCurrency:@"USD"
                                             withSku:@"Hip-00037"];
        
        NSArray *items = @[item1];
        NSDecimalNumber *subtotal = [PayPalItem totalPriceForItems:items];
        
        
        PayPalPayment *payment = [[PayPalPayment alloc] init];
        payment.amount = subtotal;
        payment.currencyCode = @"USD";
        payment.shortDescription = @"SwimCare";
        payment.items = items;  // if not including multiple items, then leave payment.items as nil
        
        
        if (!payment.processable) {
            // This particular payment will always be processable. If, for
            // example, the amount was negative or the shortDescription was
            // empty, this payment wouldn't be processable, and you'd want
            // to handle that here.
        }
        
        // Update payPalConfig re accepting credit cards.
        self.payPalConfig.acceptCreditCards = self.acceptCreditCards;
        
        PayPalPaymentViewController *paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                                                    configuration:self.payPalConfig
                                                                                                         delegate:self];
        [self presentViewController:paymentViewController animated:YES completion:nil];
    }
}
#pragma mark PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController didCompletePayment:(PayPalPayment *)completedPayment {
    NSLog(@"PayPal Payment Success!");
    self.resultText = [completedPayment description];
    //[self showSuccess];
    
    [self sendCompletedPaymentToServer:completedPayment]; // Payment was processed successfully; send to server for verification and fulfillment
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    NSLog(@"PayPal Payment Canceled");
    self.resultText = nil;
    // self.successView.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Proof of payment validation

- (void)sendCompletedPaymentToServer:(PayPalPayment *)completedPayment {
    // TODO: Send completedPayment.confirmation to server
    NSLog(@"Here is your proof of payment:\n\n%@\n\nSend this to your server for confirmation and fulfillment.", completedPayment.confirmation);
}


#pragma mark - Flipside View Controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"pushSettings"]) {
        [[segue destinationViewController] setDelegate:(id)self];
    }
}



- (IBAction)Back:(id)sender {
    Dashboard *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"dash"];
    [self.navigationController pushViewController:wc animated:YES];
}
@end
