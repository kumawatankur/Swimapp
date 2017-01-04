//
//  Register.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "Register.h"
#import "AddMoreChild.h"
#import "Dashboard.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)showActionSheet:(UIButton *)sender
{
    NSString *alertTitle = NSLocalizedString(@"Do you want to Add More Child", @"Archive or Delete Data");
    NSString *alertMessage = NSLocalizedString(@"Please choose Add More Child", @"Deleted data cannot be undone");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                             message:alertMessage
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    //cancel////////////////////////////////////
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
    style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
    {
    NSLog(@"cancel action");
        

    
}];
   
    //add more child ////////////////////////////
    UIAlertAction *addmorechild = [UIAlertAction actionWithTitle:NSLocalizedString(@"Add More Child", @"Archive action")style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action)
        {
        NSLog(@"add more action");
       AddMoreChild *wc = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"Addmore"];
    [self.navigationController pushViewController:wc animated:YES];
    }];
    //save//////////////////////////////////
    UIAlertAction *saveaction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Save", @"save action")
    style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
    NSLog(@"save action");
        Dashboard *wc = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"dash"];
        [self.navigationController pushViewController:wc animated:YES];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:saveaction];
    [alertController addAction:addmorechild];
    
    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    if (popover)
    {
        popover.sourceView = sender;
        popover.sourceRect = sender.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
