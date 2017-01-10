//
//  mychildaway.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/5/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mychildaway : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *tx_name;
- (IBAction)tx_name_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *table_view;
@property (strong, nonatomic) IBOutlet UITextField *tx_reason;
@property (strong, nonatomic) IBOutlet UITextField *tx_date;
@property (strong, nonatomic) IBOutlet UITextView *tx_comment;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet;
@property (strong, nonatomic) IBOutlet UITableView *reason_table;
@property (strong, nonatomic) IBOutlet UIButton *reason_outlet;
- (IBAction)reason_btn:(id)sender;

@end
