//
//  ExistingRegister.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "ExistingRegister.h"
#import "Dashboard.h"
#import "ExistingAddMoreChild.h"
#import "ExistingLogin.h"

@interface ExistingRegister ()
{
    NSArray*gender;
}

@end

@implementation ExistingRegister

- (void)viewDidLoad {
    [super viewDidLoad];
    gender = [[NSArray alloc]initWithObjects:@"Boy",@"Girl", nil];
    // Do any additional setup after loading the view.
    [_gender_table.layer setBorderWidth: 1.0];
    [_gender_table.layer setCornerRadius:8.0f];
    [_gender_table.layer setMasksToBounds:YES];
    [_gender_table.layer setBorderColor:[[UIColor blackColor] CGColor]];
    _gender_table.hidden=YES;
    
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [_tx_childdob setInputView:datePicker];
}
-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)_tx_childdob.inputView;
    //[picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    _tx_childdob.text = [NSString stringWithFormat:@"%@",dateString];
    
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
    
    return [gender count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //*******************************************************************************************************************
    static  NSString *simpaletableidentifier=@"SimpaleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpaletableidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpaletableidentifier];
    }
    
    cell.textLabel.text=[gender objectAtIndex:indexPath.row];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[self.gender_table cellForRowAtIndexPath:indexPath];
    //[self.btnoutlet setTitle:cell.textLabel.text forState:UIControlStateNormal];
    self.gender_table.hidden=YES;
    self.tx_childgender.text= cell.textLabel.text;
    
}


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
            if (![self isFormValid]) {
                
                return;
                
            }
            
            NSError *error;
            
            
            if (!error)
            {
                // call webservice for succes
                
                
                //Here YOUR URL
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/insert_data.php"]];
                
                
                //create the Method "GET" or "POST"
                [request setHTTPMethod:@"POST"];
                
                //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
                NSString *userUpdate =[NSString stringWithFormat:@"db_user=%@&db_pass=%@&p_name=%@&contact=%@&address=%@&c_name=%@&c_dob=%@&c_gender=%@&medical=%@&loc_id=%@&img=%@&",_tx_email.text,_tx_pass.text,_tx_pname.text,_tx_contectno.text,_tx_address.text,_tx_childname.text,_tx_childdob.text,_tx_childgender.text,_tx_anymedicalcond.text,[[NSUserDefaults standardUserDefaults]stringForKey:@"LocationId"],@"img", nil];
                
                
                
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
//        ExistingAddMoreChild *wc = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"exAddmore"];
//        [self.navigationController pushViewController:wc animated:YES];
    [self performSegueWithIdentifier:@"exAddmore" sender:sender];
            }
            
    }];
    //save//////////////////////////////////
    UIAlertAction *saveaction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Save", @"save action")
        style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
        {
        NSLog(@"save action");
        if (![self isFormValid]) {
                                     
        return;
                                     
        }
                                     
        NSError *error;
                                     
                            
    if (!error)
    {
    // call webservice for succes
                                     
                                     
    //Here YOUR URL
   NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/insert_data.php"]];
                                     
                                     
//create the Method "GET" or "POST"
        [request setHTTPMethod:@"POST"];
                                     
//Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
NSString *userUpdate =[NSString stringWithFormat:@"db_user=%@&db_pass=%@&p_name=%@&contact=%@&address=%@&c_name=%@&c_dob=%@&c_gender=%@&medical=%@&loc_id=%@&img=%@&",_tx_email.text,_tx_pass.text,_tx_pname.text,_tx_contectno.text,_tx_address.text,_tx_childname.text,_tx_childdob.text,_tx_childgender.text,_tx_anymedicalcond.text,[[NSUserDefaults standardUserDefaults]stringForKey:@"LocationId"],@"img", nil];
                                     
                                     
                                     
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
        UIAlertView *signupalert = [[UIAlertView alloc]initWithTitle:@"Please Login" message:@"Record Added Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                                     
            [signupalert show];
            }
    Dashboard *wc = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"dash"];
    [self.navigationController pushViewController:wc animated:YES];
    

//    Dashboard *wc = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"dash"];
//        [self.navigationController pushViewController:wc animated:YES];
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



-(BOOL)isFormValid
{
    NSString *emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegEx];
    
    if (_tx_pname.text && _tx_pname.text.length==0)
    {
        [self showErrorMessage:@"Please Enter Parent Name "];
        return NO;
    }
    else if([emailTest evaluateWithObject: _tx_email.text]==NO)
    {
        [self showErrorMessage:@"Please enter recive information Valid Email_id"];
        return NO;
    }
    
    
    else if (_tx_pass.text && _tx_pass.text.length==0)
    {
        [self showErrorMessage:@"Please Enter Password"];
        return NO;
    }
    else if (_tx_contectno.text && _tx_contectno.text.length==0)
    {
        [self showErrorMessage:@"Please Contact Number"];
        return NO;
    }
    else if (_tx_address.text && _tx_address.text.length==0)
    {
        [self showErrorMessage:@"Please Enter Address"];
        return NO;
    }
    else if (_tx_childname.text && _tx_childname.text.length==0)
    {
        [self showErrorMessage:@"Please Enter Child Name"];
        return NO;
    }
    else if (_tx_childdob.text && _tx_childdob.text.length==0)
    {
        [self showErrorMessage:@"Please Enter Child DOB"];
        return NO;
    }
    else if (_tx_childgender.text && _tx_childgender.text.length==0)
    {
        [self showErrorMessage:@"Please Enter Child Gender"];
        return NO;
    }
    else if (_tx_anymedicalcond.text && _tx_anymedicalcond.text.length==0)
    {
        [self showErrorMessage:@"Please Enter Any mediacl conditions"];
        return NO;
    }
    
    return YES;
}


-(void)showErrorMessage:(NSString *)message
{
    
    UIAlertView *alertmessage = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertmessage show];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"exAddmore"]) {
        
        
        ExistingAddMoreChild *destViewController = segue.destinationViewController;
        destViewController.emailId = _tx_email.text;
    }
}


- (IBAction)gender_btn:(id)sender {
    if (self.gender_table.hidden==YES) {
        self.gender_table.hidden=NO;
    }else{
        self.gender_table.hidden=YES;
    }

}

@end
