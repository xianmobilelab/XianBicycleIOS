//
//  BaseBOOL.h
//  CarNurse
//
//  Created by delay on 14-8-16.
//  Copyright (c) 2014年 studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseBOOL : NSObject

@property (nonatomic, assign) BOOL boolValue;

- (id)initWithBOOL: (BOOL)value;
- (NSString *)getBOOLJSONValue;

@end
