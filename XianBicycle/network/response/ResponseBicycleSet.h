//
//  ResponseBicycleSet.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseResponse.h"

@interface BicycleSetItem : NSObject

@property(nonatomic, retain) NSNumber *distance;
@property(nonatomic, retain) NSNumber *latitude;
@property(nonatomic, retain) NSNumber *longitude;
@property(nonatomic, retain) NSNumber *emptynum;
@property(nonatomic, retain) NSNumber *locknum;
@property(nonatomic, retain) NSNumber *siteid;
@property(nonatomic, copy) NSString *sitename;
@property(nonatomic, copy) NSString *location;

@end

@interface ResponseBicycleSet : BaseResponse

@property(nonatomic, strong) NSArray *siteList;

@end
