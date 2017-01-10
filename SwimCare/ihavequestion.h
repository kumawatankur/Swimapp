//
//  ihavequestion.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/5/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ihavequestion : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *tx_name;
- (IBAction)btn_action:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *table_view;
@property (strong, nonatomic) IBOutlet UITextView *comment;
@end
