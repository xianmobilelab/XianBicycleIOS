//
//  XianBicycleService.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XianBicycleServiceProtocol.h"
#import "RequestLocation.h"
#import "RequestTerm.h"

@interface XianBicycleService : NSObject

- (void)searchByLocation: (RequestLocation *) param withDelegate: (id)delegate;
- (void)searchByTerm: (RequestTerm *) param withDelegate: (id)delegate;

@end
