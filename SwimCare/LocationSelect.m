//
//  LocationSelect.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/3/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "LocationSelect.h"
#import "LocationCell.h"
#import "Map.h"
#import "Phone.h"

@interface LocationSelect ()
{
    NSArray*location_phone;
    NSArray*location;
    NSArray*maplat;
    NSArray*maplong;
    NSArray*location_id;
    
    NSIndexPath* indexPath;
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
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Noteworthy" size:21]}];
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://shantinews.com/toshow/swimcare/ws/app_location.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [response appendData:data];
    NSLog(@"error receving data %@",response);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    
    NSLog(@"Error in receiving data %@",error);
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
   location = [json valueForKey:@"p_address"];
    maplat = [json valueForKey:@"lat"];
     maplong = [json valueForKey:@"lng"];
     location_phone = [json valueForKey:@"phone"];
    location_id = [json valueForKey:@"l_id"];
    [self.table_view reloadData];
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
    return location .count;
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    LocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"htrcell"];
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
//   [ cell.location_lbl setTitle:location forState:UIControlStateNormal [objectAtIndex:indexPath.row];
    [cell.location_lbl setTitle:location[indexPath.row]forState:UIControlStateNormal] ;
    
    cell.backgroundColor=[UIColor clearColor];
    cell.bg_view.layer.cornerRadius = 20;
    cell.bg_view.layer.masksToBounds = YES;
    cell.bg_view.backgroundColor = [[UIColor colorWithRed:20.0/255 green:100.0/255 blue:171.0/255 alpha:0.7f] colorWithAlphaComponent:0.7f];
    
    ////////////////
    [cell.map addTarget:self action:@selector(buttonClickedMap:) forControlEvents:UIControlEventTouchUpInside];
    [cell.map setTag:indexPath.row];
    
    [cell.phone addTarget:self action:@selector(buttonClickedPhone:) forControlEvents:UIControlEventTouchUpInside];
    [cell.phone setTag:indexPath.row];
    
    [cell.location_lbl addTarget:self action:@selector(buttonClickedlocation:) forControlEvents:UIControlEventTouchUpInside];
    [cell.location_lbl setTag:indexPath.row];
    
    
    return cell;
    
}
-(void)buttonClickedMap: (id)sender
{
    NSLog(@"tag number is = %ld",(long)[sender tag]);
    //In this case the tag number of button will be same as your cellIndex.
    // You can make your cell from this.
    
    indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    LocationCell *cell = [_table_view cellForRowAtIndexPath:indexPath];
   [self performSegueWithIdentifier:@"showRecipeDetail" sender:sender];
    
    
}
-(void)buttonClickedPhone: (id)sender
{
    NSLog(@"tag number is = %ld",(long)[sender tag]);
    //In this case the tag number of button will be same as your cellIndex.
    // You can make your cell from this.
    
    indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    LocationCell *cell = [_table_view cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"phone" sender:sender];
    
    
}

-(void)buttonClickedlocation: (id)sender
{
    NSLog(@"tag number is = %ld",(long)[sender tag]);
    //In this case the tag number of button will be same as your cellIndex.
    // You can make your cell from this.
    
    indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    LocationCell *cell = [_table_view cellForRowAtIndexPath:indexPath];
    
    NSString*hgu = [location_id objectAtIndex:indexPath.row];
   [[NSUserDefaults standardUserDefaults] setObject:hgu forKey:@"LocationId"];
    
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {

        
        Map *destViewController = segue.destinationViewController;
        destViewController.lat = [maplat objectAtIndex:indexPath.row];
        destViewController.lng = [maplong objectAtIndex:indexPath.row];
        destViewController.place = [location objectAtIndex:indexPath.row];
    }
   else if ([segue.identifier isEqualToString:@"phone"]) {
        
        
        Phone *destViewController = segue.destinationViewController;
        destViewController.phone = [location_phone objectAtIndex:indexPath.row];
       destViewController.place = [location objectAtIndex:indexPath.row];
       
    }

}

@end
