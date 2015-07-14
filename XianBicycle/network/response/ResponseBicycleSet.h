//
//  ResponseBicycleSet.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseResponse.h"

/**
 {
 distance = "1994.700471542416";
 emptynum = 9;
 latitude = "34.218435";
 location = "\U79d1\U6280\U516d\U8def\U4e0e\U6ca3\U60e0\U5357\U8def\U5341\U5b57\U897f\U5357\U89d2";
 locknum = 20;
 longitude = "108.894431";
 siteid = 5514;
 sitename = "\U6a61\U6811\U8857\U533a";
 }
 */
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
