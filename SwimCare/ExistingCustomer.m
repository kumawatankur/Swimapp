//
//  ExistingCustomer.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "ExistingCustomer.h"
#import "Dashboard.h"

@interface ExistingCustomer ()

@end

@implementation ExistingCustomer

- (void)viewDidLoad {
    [super viewDidLoad];
    _MYCHILDAWAY.layer.cornerRadius = 20;
   _MYCHILDAWAY.layer.masksToBounds = YES;
    _MYCHILDNOTRETURN.layer.cornerRadius = 20;
    _MYCHILDNOTRETURN.layer.masksToBounds = YES;
    _IHAVEQUESTION.layer.cornerRadius = 20;
    _IHAVEQUESTION.layer.masksToBounds = YES;
    _ORGMAKUP.layer.cornerRadius = 20;
    _ORGMAKUP.layer.masksToBounds = YES;
    _CHANGECLASSTIME.layer.cornerRadius = 20;
    _CHANGECLASSTIME.layer.masksToBounds = YES;
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Back:(id)sender {
    Dashboard *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"dash"];
    [self.navigationController pushViewController:wc animated:YES];
}
@end
