//
//  NSString+NSStringUtils.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/20/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "NSString+NSStringUtils.h"

@implementation NSString (NSStringUtils)

+ (BOOL) isBlankString: (NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

@end
