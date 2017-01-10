//
//  AddMoreChild.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMoreChild : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *tx_childname;
@property (strong, nonatomic) IBOutlet UITextField *tx_grnder;
@property (strong, nonatomic) IBOutlet UITextField *tx_dob;
@property (strong, nonatomic) IBOutlet UITextView *tx_anymedical;
@property(nonatomic,retain) NSString * emailId;
- (IBAction)gender_btn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *gender_table;
@end
