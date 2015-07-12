//
//  FirstViewController.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface FirstViewController : UIViewController <BMKMapViewDelegate, BMKLocationServiceDelegate> {
    BMKMapView* _mapView;
    BMKLocationService* _locService;
    CLLocationCoordinate2D _loc;
}

- (void)initBaiduMap;

@end

