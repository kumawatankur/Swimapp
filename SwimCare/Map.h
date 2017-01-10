//
//  Map.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Map : UIViewController<MKMapViewDelegate>



@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property(nonatomic,retain) NSString * lat;
@property(nonatomic,retain) NSString * lng;
@property(nonatomic,retain) NSString * place;

@end
