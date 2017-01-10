//
//  MyRegister.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyRegister : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *tx_pname;
@property (strong, nonatomic) IBOutlet UITextField *tx_email;
@property (strong, nonatomic) IBOutlet UITextField *tx_pass;
@property (strong, nonatomic) IBOutlet UITextField *tx_contectno;
@property (strong, nonatomic) IBOutlet UITextField *tx_address;
@property (strong, nonatomic) IBOutlet UITextField *tx_childname;
@property (strong, nonatomic) IBOutlet UITextField *tx_childgender;
@property (strong, nonatomic) IBOutlet UITextField *tx_childdob;
@property (strong, nonatomic) IBOutlet UITextView *tx_anymedicalcond;
- (IBAction)submit_btn:(id)sender;

- (IBAction)gender_btn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *gender_table;
@end
