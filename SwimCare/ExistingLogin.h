//
//  ExistingLogin.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExistingLogin : UIViewController
@property (weak, nonatomic) IBOutlet UIView *trans_view;
- (IBAction)login:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tx_userid;
@property (weak, nonatomic) IBOutlet UITextField *tx_pwd;
@end
