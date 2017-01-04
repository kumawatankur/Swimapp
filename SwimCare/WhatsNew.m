//
//  WhatsNew.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "WhatsNew.h"

@interface WhatsNew ()

@end

@implementation WhatsNew

- (void)viewDidLoad {
    [super viewDidLoad];
    self.facebook.backgroundColor = [[UIColor colorWithRed:20.0/255 green:100.0/255 blue:171.0/255 alpha:0.7f] colorWithAlphaComponent:0.7f];
    self.newslatter.backgroundColor = [[UIColor  redColor]colorWithAlphaComponent:0.7f];
    self.newmessage.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.7f];
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

@end
