//
//  MyLogin.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "MyLogin.h"

@interface MyLogin ()

@end

@implementation MyLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    self.trans_view.backgroundColor = [[UIColor colorWithRed:48.0/255 green:127.0/255 blue:169.0/255 alpha:0.7f] colorWithAlphaComponent:0.7f];
    self.trans_view.layer.cornerRadius = 20;
    self.trans_view.layer.masksToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    if([[self.tx_userid text] isEqualToString:@""] || [[self.tx_pwd text] isEqualToString:@""] ) {
        
        
        
    } else {
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/login_service.php"]];
        
        
        //create the Method "GET" or "POST"
        [request setHTTPMethod:@"POST"];
        
        
        //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
        NSString *userUpdate =[NSString stringWithFormat:@"db_user=%@&db_pass=%@",_tx_userid.text,_tx_pwd.text, nil];
        
        
        
        //Check The Value what we passed
        NSLog(@"the data Details is =%@", userUpdate);
        
        //Convert the String to Data
        NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
        
        //Apply the data to the body
        [request setHTTPBody:data1];
        
        //Create the response and Error
        NSError *err;
        NSURLResponse *response;
        
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        
        //  if ([response statusCode] >= 200 && [response statusCode] < 300)
        {
            
            
            NSError *error = nil;
            NSDictionary *jsonData = [NSJSONSerialization
                                      JSONObjectWithData:responseData
                                      options:NSJSONReadingMutableContainers
                                      error:&error];
            NSLog(@"ankur %@",jsonData);
            
            int status = [jsonData[@"status"] integerValue];
            
            
            if(status == 1)
            {
                [[NSUserDefaults standardUserDefaults] setObject:_tx_userid.text forKey:@"Loginuser"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                NSLog(@"Login SUCCESS");
                [self performSegueWithIdentifier:@"MyChildren" sender:self];
            } else {
                
                NSString *error_msg = (NSString *) jsonData[@"error_message"];
                [self alertStatus:error_msg :@"Sign in Failed!" :0];
            }
            
        }
        
    }
    
}
- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    if([segue.identifier isEqualToString:@"login_success"]){
//        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
//        ExistingCustomer *controller = (ExistingCustomer *)navController.topViewController;
//
//       // controller.uid_value = self.tx_id.text;
//
//    }
//}


@end
