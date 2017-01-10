//
//  LocationCell.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/3/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *phone_lbl;
@property (weak, nonatomic) IBOutlet UIView *bg_view;
@property (weak, nonatomic) IBOutlet UIButton *location_lbl;
@property (weak, nonatomic) IBOutlet UIButton *map;
@property (weak, nonatomic) IBOutlet UIButton *phone;

@end
