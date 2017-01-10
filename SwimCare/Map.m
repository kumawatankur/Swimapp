//
//  Map.m
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import "Map.h"

@interface Map ()

@end
#define The_spane 0.01f;

@implementation Map

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"lat%@",_lat);
     NSLog(@"long%@",_lng);
    
    float lat = [_lat floatValue];
    float lng = [_lng floatValue];
    
    
// Do any additional setup after loading the view.
     MKCoordinateRegion myregion;
    
    CLLocationCoordinate2D myCoordinate;
    myCoordinate.latitude = lat;
    myCoordinate.longitude = lng;
    
    MKCoordinateSpan spane;
    spane.latitudeDelta = The_spane;
    spane.longitudeDelta = The_spane;
    
    myregion.center= myCoordinate;
    myregion.span = spane;
   
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(myCoordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = myCoordinate;
    point.title = _place;
    
    
    [self.mapView addAnnotation:point];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
