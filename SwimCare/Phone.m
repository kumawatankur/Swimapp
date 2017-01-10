//
//  Phone.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "Phone.h"

@interface Phone ()

@end

@implementation Phone

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"phone %@",_phone);
    _plc_lbl.text = _place;
    _phone_lbl.text = _phone;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)phone:(id)sender {
    NSString *phoneNumber = [@"tel://" stringByAppendingString:_phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
