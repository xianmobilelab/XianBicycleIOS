//
//  BaseBOOL.m
//  CarNurse
//
//  Created by delay on 14-8-16.
//  Copyright (c) 2014年 studio. All rights reserved.
//

#import "BaseBOOL.h"

@implementation BaseBOOL

@synthesize boolValue;

- (id)initWithBOOL: (BOOL)value
{
    if (self = [super init]) {
        boolValue = value;
    }
    return self;
}

- (NSString *)getBOOLJSONValue
{
    if (boolValue) {
        return @"true";
    } else {
        return @"false";
    }
}

@end
