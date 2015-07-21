//
//  BaseResponse.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseResponse.h"

@implementation BaseResponse

+(instancetype) getJSONResponse: (id)jsonObject
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
