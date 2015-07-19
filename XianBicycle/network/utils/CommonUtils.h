//
//  CommonUtils.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/19/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define UIColorFromRGBA(rgbValue, alphaValue) \
[UIColor \
 colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
 blue:((float)(rgbValue & 0x0000FF))/255.0 \
 alpha:alphaValue]

@interface CommonUtils : NSObject

- (UIColor *)createUIColorFromRGBA:(long)rgbValue withAlpha:(CGFloat) alphaValue;

@end
