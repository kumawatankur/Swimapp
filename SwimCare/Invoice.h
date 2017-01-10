//
//  Invoice.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"
#import "PayPalConfiguration.h"
#import "PayPalPaymentViewController.h"

@interface Invoice : UIViewController<PayPalPaymentDelegate, PayPalFuturePaymentDelegate, PayPalProfileSharingDelegate, UIPopoverControllerDelegate>
- (IBAction)Back:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *table_view;
@property (weak, nonatomic) IBOutlet UILabel *total;


@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, assign, readwrite) BOOL acceptCreditCards;
@property(nonatomic, strong, readwrite) NSString *resultText;
@end
