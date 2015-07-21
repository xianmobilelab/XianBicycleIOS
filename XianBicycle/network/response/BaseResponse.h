//
//  BaseResponse.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponse : NSObject

+(instancetype) getJSONResponse: (id)jsonObject;

@end
