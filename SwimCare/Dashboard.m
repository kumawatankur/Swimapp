//
//  Dashboard.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "Dashboard.h"
#import "Invoice.h"
#import "Login.h"
#import "ExistingLogin.h"
#import "ExistingCustomer.h"
#import "MyLogin.h"
#import "Mychildren.h"

@interface Dashboard ()

@end

@implementation Dashboard

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

 
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];   //it hides
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES]; // it shows
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)invoice:(id)sender {
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"Loginuser"]) {
        NSLog(@"Invoice");
    
    Invoice *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Invoices"];
    [self.navigationController pushViewController:wc animated:YES];
    }
    else
    {
        Login *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"InvoiceLogin"];
        [self.navigationController pushViewController:wc animated:YES];
    }
}

- (IBAction)ExistingCustomer:(id)sender {
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"Loginuser"]) {
        NSLog(@"ExistingCustomer");
        
        ExistingCustomer *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"login_success"];
        [self.navigationController pushViewController:wc animated:YES];
    }
    else
    {
        ExistingLogin *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"ExistingLogin"];
        [self.navigationController pushViewController:wc animated:YES];
    }

}

- (IBAction)MyChildren:(id)sender {
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"Loginuser"]) {
        NSLog(@"ankur");
        
        Mychildren *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MyChildren"];
        [self.navigationController pushViewController:wc animated:YES];
    }
    else
    {
        MyLogin *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MyChildrenLogin"];
        [self.navigationController pushViewController:wc animated:YES];
    }

}
@end
