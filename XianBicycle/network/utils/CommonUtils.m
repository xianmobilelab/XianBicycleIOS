//
//  CommonUtils.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/19/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils

+ (UIColor *)createUIColorFromRGBA:(NSInteger)rgbValue withAlpha:(CGFloat) alphaValue
{
    CGFloat red = ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0f;
    CGFloat green = ((CGFloat)((rgbValue & 0x00FF00) >> 8)) / 255.0f;
    CGFloat blue = ((CGFloat)(rgbValue & 0x0000FF)) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alphaValue];;
}
@end
