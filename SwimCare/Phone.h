//
//  Phone.h
//  SwimCare
//
//  Created by SixthSenseIT on 1/4/17.
//  Copyright © 2017 SixthSenseIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Phone : UIViewController
@property(nonatomic,retain) NSString * phone;
@property(nonatomic,retain) NSString * place;

@property (strong, nonatomic) IBOutlet UILabel *plc_lbl;
@property (strong, nonatomic) IBOutlet UILabel *phone_lbl;

@end
