//
//  NewCustomer.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "NewCustomer.h"

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
    if (self.day_table.hidden==YES) {
        self.day_table.hidden=NO;
    }else{
        self.day_table.hidden=YES;
    }
}
@end
