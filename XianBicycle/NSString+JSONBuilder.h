//
//  NSString+JSONBuilder.h
//  CarNurse
//
//  Created by delay on 14-8-2.
//  Copyright (c) 2014年 studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseBOOL.h"

@interface NSString (JSONBuilder)

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;

+(NSString *) jsonStringWithNumber:(NSNumber *) number;

+(NSString *) jsonStringWithBOOL:(BaseBOOL *) baseBOOL;

+(NSString *) jsonStringWithArray:(NSArray *)array;

+(NSString *) jsonStringWithString:(NSString *) string;

+(NSString *) jsonStringWithObject:(id) object;

+(void) jsonTest;

@end
