//
//  Policy.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "Policy.h"

@interface Policy ()
{
    NSString*policy;
}

@end

@implementation Policy

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) viewWillAppear:(BOOL)animated
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/policy_content.php"]];
    
    
    //create the Method "GET" or "POST"
    [request setHTTPMethod:@"POST"];
    
    //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
    NSString *userUpdate =[NSString stringWithFormat:@"l_id=%@&",[[NSUserDefaults standardUserDefaults]stringForKey:@"LocationId"], nil];
    
    
    
    //Check The Value what we passed
    NSLog(@"the data Details is =%@", userUpdate);
    
    //Convert the String to Data
    NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
    
    //Apply the data to the body
    [request setHTTPBody:data1];
    
    //Create the response and Error
    NSError *err;
    NSURLResponse *response;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&err];
    NSLog(@"json %@",json);
    
    if (json.count>0)
    {
        NSString *results = [json valueForKey:@"policy"];
        
        NSLog(@"results == %@",results);
        
        if ([ results isKindOfClass:[NSArray class]])
        {
            policy = results;
            _tx_policy.text = policy;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        else
        {
            // show the alert and navigate to previous page
            //[self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        // show the alert and navigate to previous page
        //[self.navigationController popViewControllerAnimated:YES];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
