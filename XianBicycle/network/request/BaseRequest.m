//
//  BaseRequest.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

- (NSString *) getJSONRequest
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
