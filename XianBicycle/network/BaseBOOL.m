//
//  BaseBOOL.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseBOOL.h"

@implementation BaseBOOL

- (id)initWithBOOL: (BOOL)value
{
    if (self = [super init]) {
        _boolValue = value;
    }
    return self;
}

- (NSString *)getBOOLJSONValue
{
    if (_boolValue) {
        return @"true";
    } else {
        return @"false";
    }
}

@end
