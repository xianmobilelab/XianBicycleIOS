//
//  AppDelegate.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;

@end