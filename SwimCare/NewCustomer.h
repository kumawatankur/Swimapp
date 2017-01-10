


//
//  NewCustomer.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCustomer : UIViewController
- (IBAction)gender_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *tx_gender;
@property (strong, nonatomic) IBOutlet UITableView *gender_table;
@property (strong, nonatomic) IBOutlet UITableView *day_table;
@property (strong, nonatomic) IBOutlet UITextField *tx_day;
- (IBAction)day_button:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *tx_childname;
@property (strong, nonatomic) IBOutlet UITextField *tx_parentname;
@property (strong, nonatomic) IBOutlet UITextField *tx_contactno;
@property (strong, nonatomic) IBOutlet UITextField *tx_address;
@property (strong, nonatomic) IBOutlet UITextField *tx_about_us;
@property (strong, nonatomic) IBOutlet UITextField *tx_dob;
@property (strong, nonatomic) IBOutlet UITextField *tx_time;
@property (strong, nonatomic) IBOutlet UITextField *tx_shift;
@property (strong, nonatomic) IBOutlet UITextView *tx_comment;

@property (strong, nonatomic) IBOutlet UITableView *shift_table;
- (IBAction)shift_btn:(id)sender;


@end
