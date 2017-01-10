//
//  mychildnotreturn.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/5/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "mychildnotreturn.h"
#import "Dashboard.h"

@interface mychildnotreturn ()
{
    NSArray*c_name;
}
@end

@implementation mychildnotreturn

- (void)viewDidLoad {
    [super viewDidLoad];
    [_table_view.layer setBorderWidth: 1.0];
    [_table_view.layer setCornerRadius:8.0f];
    [_table_view.layer setMasksToBounds:YES];
    [_table_view.layer setBorderColor:[[UIColor blackColor] CGColor]];
    _table_view.hidden=YES;
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/child_name.php"]];
    
    
    //create the Method "GET" or "POST"
    [request setHTTPMethod:@"POST"];
    
    //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
    NSString *userUpdate =[NSString stringWithFormat:@"db_user=%@&",[[NSUserDefaults standardUserDefaults]stringForKey:@"Loginuser"], nil];
    
    
    
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
        NSArray *results = [json valueForKey:@"c_name"];
        
        NSLog(@"results == %@",results);
        
        if ([ results isKindOfClass:[NSArray class]])
        {
            c_name = results;
            [_table_view reloadData];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [c_name count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //*******************************************************************************************************************
    static  NSString *simpaletableidentifier=@"SimpaleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpaletableidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpaletableidentifier];
    }
    
    cell.textLabel.text=[c_name objectAtIndex:indexPath.row];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[self.table_view cellForRowAtIndexPath:indexPath];
    //[self.btnoutlet setTitle:cell.textLabel.text forState:UIControlStateNormal];
    self.table_view.hidden=YES;
    self.tx_name.text= cell.textLabel.text;
    
}



- (IBAction)btn_action:(id)sender {
    if (self.table_view.hidden==YES) {
        self.table_view.hidden=NO;
    }else{
        self.table_view.hidden=YES;
    }
}

- (IBAction)submit_btn:(id)sender
{
    if (![self isFormValid]) {
        
        return;
        
    }
    
    NSError *error;
    
    
    if (!error)
    {
        // call webservice for succes
        
        
        //Here YOUR URL
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/child_not_return.php"]];
        
        
        //create the Method "GET" or "POST"
        [request setHTTPMethod:@"POST"];
        
        //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
        NSString *userUpdate =[NSString stringWithFormat:@"db_user=%@&c_name=%@&policy=%@&detail=%@&",[[NSUserDefaults standardUserDefaults]stringForKey:@"Loginuser"],_tx_name.text,@"policy acept",_comment.text, nil];
        
        
        
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
        
        NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
        
        //This is for Response
        NSLog(@"got response==%@", resSrt);
        if(resSrt)
        {
            NSLog(@"got response");
            
        }
        else
        {
            NSLog(@"faield to connect");
        }
        UIAlertView *signupalert = [[UIAlertView alloc]initWithTitle:@"Congratulations" message:@"Record Added Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [signupalert show];
    }
    Dashboard *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                instantiateViewControllerWithIdentifier:@"dash"];
    [self.navigationController pushViewController:wc animated:YES];
}

-(BOOL)isFormValid
{
     if (_tx_name.text && _tx_name.text.length==0)
    {
        [self showErrorMessage:@"Please Choose Name "];
        return NO;
    }
    
    
    else if (_comment.text && _comment.text.length==0)
    {
        [self showErrorMessage:@"Please Enter comment"];
        return NO;
    }
//    else if (_txpaymentpicker.text && _txpaymentpicker.text.length==0)
//    {
//        [self showErrorMessage:@"Please select payment"];
//        return NO;
//    }
       return YES;
}


-(void)showErrorMessage:(NSString *)message
{
    
    UIAlertView *alertmessage = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertmessage show];
    
}


@end
