//
//  LocationSelect.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/3/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "LocationSelect.h"
#import "LocationCell.h"

@interface LocationSelect ()
{
    NSArray*location_phone;
}
@end

@implementation LocationSelect

- (void)viewDidLoad {
    [super viewDidLoad];
    location_phone = [[NSArray alloc]initWithObjects:@"first",@"Second", nil];
    // Do any additional setup after loading the view.
    self.table_view.backgroundColor= [UIColor clearColor];
    self.table_view.separatorColor= [UIColor clearColor];
    self.table_view.allowsSelection = NO;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:6.0/255 green:60.0/255 blue:95.0/255 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Noteworthy" size:21]}];
    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return location_phone .count;
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    LocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"htrcell"];
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.phone_lbl.text=[NSString stringWithFormat:@"%@",[location_phone objectAtIndex:indexPath.row]];
    
    cell.backgroundColor=[UIColor clearColor];
    cell.bg_view.layer.cornerRadius = 20;
    cell.bg_view.layer.masksToBounds = YES;
    cell.bg_view.backgroundColor = [[UIColor colorWithRed:20.0/255 green:100.0/255 blue:171.0/255 alpha:0.7f] colorWithAlphaComponent:0.7f];
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView
                      cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
