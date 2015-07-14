//
//  BaseBOOL.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseBOOL : NSObject

@property (nonatomic, assign) BOOL boolValue;

- (id)initWithBOOL: (BOOL)value;
- (NSString *)getBOOLJSONValue;

@end
