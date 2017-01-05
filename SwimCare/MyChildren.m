//
//  Mychildren.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/5/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "Mychildren.h"
#import "Dashboard.h"
#import "MychildrenCell.h"
@interface Mychildren ()
{
    NSArray*image;
    NSArray*name;
    NSArray*time;
}

@end

@implementation Mychildren

- (void)viewDidLoad {
    [super viewDidLoad];
    
    name = [[NSArray alloc]initWithObjects:@"ankur",@"kumawat", nil];
     time = [[NSArray alloc]initWithObjects:@"Time : 12:00",@"Time : 01:00", nil];
    image = [[NSArray alloc]initWithObjects:@"user_3_small.png",@"user_3_small.png", nil];
    
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"main_img"]];
    self.tableView.separatorColor = [UIColor colorWithRed:6.0/255 green:60.0/255 blue:95.0/255 alpha:1.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return name.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MychildrenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.name .text=[NSString stringWithFormat:@"%@",[name objectAtIndex:indexPath.row]];
    cell.time.text=[NSString stringWithFormat:@"%@",[time objectAtIndex:indexPath.row]];
    cell.imageView.image= [UIImage imageNamed:image[indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


- (IBAction)Back:(id)sender {
    Dashboard *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"dash"];
    [self.navigationController pushViewController:wc animated:YES];
}

@end
