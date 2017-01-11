//
//  NewCustomer.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "NewCustomer.h"
#import "Dashboard.h"

@interface NewCustomer ()
{
    NSArray*gender;
    NSArray*day;
    NSArray*shift;
}

@end

@implementation NewCustomer

- (void)viewDidLoad {
    [super viewDidLoad];
    gender = [[NSArray alloc]initWithObjects:@"Boy",@"Girl", nil];
    shift = [[NSArray alloc]initWithObjects:@"Morning",@"After-noon",@"Evening", nil];
    day = [[NSArray alloc]initWithObjects:@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday", nil];
    // Do any additional setup after loading the view.
    [_gender_table.layer setBorderWidth: 1.0];
    [_gender_table.layer setCornerRadius:8.0f];
    [_gender_table.layer setMasksToBounds:YES];
    [_gender_table.layer setBorderColor:[[UIColor blackColor] CGColor]];
    _gender_table.hidden=YES;
    
    [_day_table.layer setBorderWidth: 1.0];
    [_day_table.layer setCornerRadius:8.0f];
    [_day_table.layer setMasksToBounds:YES];
    [_day_table.layer setBorderColor:[[UIColor blackColor] CGColor]];
    _day_table.hidden=YES;

    
    [_shift_table.layer setBorderWidth: 1.0];
    [_shift_table.layer setCornerRadius:8.0f];
    [_shift_table.layer setMasksToBounds:YES];
    [_shift_table.layer setBorderColor:[[UIColor blackColor] CGColor]];
    _shift_table.hidden=YES;

    
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [_tx_dob setInputView:datePicker];
    
    UIDatePicker *timepicker = [[UIDatePicker alloc]init];
    [timepicker setDate:[NSDate date]];
    timepicker.datePickerMode = UIDatePickerModeTime;
    [timepicker addTarget:self action:@selector(TimeTextField:) forControlEvents:UIControlEventValueChanged];
    [_tx_time setInputView:timepicker];
}
-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)_tx_dob.inputView;
    //[picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    _tx_dob.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void) TimeTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)_tx_time.inputView;
    //[picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"hh:mm a"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    _tx_time.text = [NSString stringWithFormat:@"%@",dateString];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView==self.gender_table){
        return 1;
    }
    else if (tableView==self.day_table){
        return 1;
    }else
        return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView==self.gender_table){
        return [gender count];
    }else if (tableView==self.day_table){
        return [day count];
    }else
        return [shift count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //*******************************************************************************************************************
    static  NSString *simpaletableidentifier=@"SimpaleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpaletableidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpaletableidentifier];
    }
    if(tableView == self.gender_table)
        cell.textLabel.text=[gender objectAtIndex:indexPath.row];
    else if (tableView==self.day_table)
        cell.textLabel.text=[day objectAtIndex:indexPath.row];
    else if (tableView==self.shift_table)
        cell.textLabel.text=[shift objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.gender_table) {
        UITableViewCell *cell =[self.gender_table cellForRowAtIndexPath:indexPath];
        //[self.btnoutlet setTitle:cell.textLabel.text forState:UIControlStateNormal];
        self.gender_table.hidden=YES;
        self.tx_gender.text= cell.textLabel.text;
    }else if (tableView==self.day_table){
        UITableViewCell *cell =[self.day_table cellForRowAtIndexPath:indexPath];
        self.tx_day.text= cell.textLabel.text;
        self.day_table.hidden=YES;
        
    }else if (tableView==self.shift_table){
        UITableViewCell *cell =[self.shift_table cellForRowAtIndexPath:indexPath];
        self.tx_shift.text= cell.textLabel.text;
        self.shift_table.hidden=YES;
        
    }
}



- (IBAction)gender_btn:(id)sender {
    if (self.gender_table.hidden==YES) {
        self.gender_table.hidden=NO;
    }else{
        self.gender_table.hidden=YES;
    }
}
- (IBAction)day_button:(id)sender {
    if (self.day_table.hidden==YES) {
        self.day_table.hidden=NO;
    }else{
        self.day_table.hidden=YES;
    }
}
- (IBAction)shift_btn:(id)sender {
    if (self.shift_table.hidden==YES) {
        self.shift_table.hidden=NO;
    }else{
        self.shift_table.hidden=YES;
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
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/new_customer.php"]];
        
        
        //create the Method "GET" or "POST"
        [request setHTTPMethod:@"POST"];
        
        //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
        NSString *userUpdate =[NSString stringWithFormat:@"name=%@&gender=%@&dob=%@&p_name=%@&contact=%@&address=%@&question=%@&day=%@&time=%@&period=%@&content=%@&policy_status=%@&location=%@&",_tx_childname.text,_tx_gender.text,_tx_dob.text,_tx_parentname.text,_tx_contactno.text,_tx_address.text,_tx_about_us.text,_tx_day.text,_tx_time.text,_tx_shift.text,_tx_comment.text,@"policy",[[NSUserDefaults standardUserDefaults]stringForKey:@"LocationId"], nil];
        
        
        
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
    
    NSString *emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegEx];
    
    
    if (_tx_childname.text && _tx_childname.text.length==0)
    {
        [self showErrorMessage:@"Please enter Child name"];
        return NO;
    }
    
    else if (_tx_parentname.text && _tx_parentname.text.length==0)
    {
        [self showErrorMessage:@"Please enter parent name"];
        return NO;
    }
    else if (_tx_contactno.text && _tx_contactno.text.length==0)
    {
        [self showErrorMessage:@"Please contact number"];
        return NO;
    }
    else if (_tx_address.text && _tx_address.text.length==0)
    {
        [self showErrorMessage:@"Please enter address"];
        return NO;
    }
    else if (_tx_about_us.text && _tx_about_us.text.length==0)
    {
        [self showErrorMessage:@"Please enter how did you here about us?"];
        return NO;
    }
    else if (_tx_gender.text && _tx_gender.text.length==0)
    {
        [self showErrorMessage:@"Please choose Girl/Boy "];
        return NO;
    }

    else if (_tx_dob.text && _tx_dob.text.length==0)
    {
        [self showErrorMessage:@"Please enter DOB"];
        return NO;
    }
    else if (_tx_day.text && _tx_day.text.length==0)
    {
        [self showErrorMessage:@"Please select day"];
        return NO;
    }
    else if (_tx_time.text && _tx_time.text.length==0)
    {
        [self showErrorMessage:@"Please enter time"];
        return NO;
    }
    else if (_tx_shift.text && _tx_shift.text.length==0)
    {
        [self showErrorMessage:@"Please select shift "];
        return NO;
    }
    else if (_tx_comment.text && _tx_comment.text.length==0)
    {
        [self showErrorMessage:@"Please enter comment "];
        return NO;
    }




return YES;
}


-(void)showErrorMessage:(NSString *)message
{
    
    UIAlertView *alertmessage = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertmessage show];
    
}

@end
