//
//  ResponseBicycleSet.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseResponse.h"

@interface BicycleSetItem : NSObject

@property(nonatomic) NSNumber *distance;
@property(nonatomic) NSNumber *latitude;
@property(nonatomic) NSNumber *longitude;
@property(nonatomic) NSNumber *emptynum;
@property(nonatomic) NSNumber *locknum;
@property(nonatomic) NSNumber *siteid;
@property(nonatomic, copy) NSString *sitename;
@property(nonatomic, copy) NSString *location;

@end

@interface ResponseBicycleSet : BaseResponse

@property(nonatomic, strong) NSArray *siteList;

@end
