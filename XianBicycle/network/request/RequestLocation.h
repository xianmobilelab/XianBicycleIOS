//
//  RequestLocation.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseRequest.h"

// Query fmt:
// {"lat":DECIMAL_FLOAT,"lng":DECIMAL_FLOAT,"distance":DECIMAL_FLOAT}
@interface RequestLocation : BaseRequest

@property(nonatomic) NSNumber *lat;
@property(nonatomic) NSNumber *lng;
@property(nonatomic) NSNumber *distance;

-(instancetype)initWithLatitude:(double) lat Longtitude:(double) lon;
-(instancetype)initWithLatitude:(double) lat Longtitude:(double) lon Distance:(double) distance;

@end
