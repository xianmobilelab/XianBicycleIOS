//
//  ResponseBicycleSet.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseResponse.h"
#import <UIKit/UIKit.h>

@interface BicycleSetItem : NSObject

@property(nonatomic) CGFloat distance;
@property(nonatomic) CGFloat latitude;
@property(nonatomic) CGFloat longitude;
@property(nonatomic) NSUInteger emptynum;
@property(nonatomic) NSUInteger locknum;
@property(nonatomic, copy) NSString *siteid;
@property(nonatomic, copy) NSString *sitename;
@property(nonatomic, copy) NSString *location;

@end

@interface ResponseBicycleSet : BaseResponse

@property(nonatomic, strong) NSArray *siteList;

@end
