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

@property(nonatomic, retain) NSNumber *lat;
@property(nonatomic, retain) NSNumber *lng;
@property(nonatomic, retain) NSNumber *distance;

@end
