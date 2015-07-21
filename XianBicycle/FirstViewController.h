//
//  FirstViewController.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
#import "XianBicycleService.h"

@interface FirstViewController : UIViewController <BMKMapViewDelegate, BMKLocationServiceDelegate, XianBicycleServiceProtocol> 

@property (nonatomic) XianBicycleService *service;

- (IBAction)search:(id)sender;

@end

