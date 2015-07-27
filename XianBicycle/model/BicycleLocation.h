//
//  BicycleLocation.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/26/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestLocation.h"
#import "RequestTerm.h"

@interface BicycleLocation : NSObject

@property(nonatomic) RequestLocation *reqLoc;
@property(nonatomic) RequestTerm *reqTerm;

@end
