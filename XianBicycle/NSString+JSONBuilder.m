//
//  NSString+JSONBuilder.m
//  CarNurse
//
//  Created by delay on 14-8-2.
//  Copyright (c) 2014年 studio. All rights reserved.
//

#import "NSString+JSONBuilder.h"

@implementation NSString (JSONBuilder)

+(void)jsonTest{
    //test
    NSDictionary *dictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"阿三",@"name",
                                 @"18",@"age",
                                 nil];
    NSDictionary *dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"阿四",@"name",
                                 @"20",@"age",
                                 nil];
    
    NSArray *array = [NSArray arrayWithObjects:dictionary1,dictionary2, nil];
    
    
    NSDictionary *dictionary3 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"李\na",@"name",
                                 @"29",@"age",
                                 nil];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"string",@"string",
                                array,@"array",
                                dictionary3,@"dictionary",
                                nil];
    NSLog(@"dictionary:%@",dictionary);
    NSString *jsonString = [NSString jsonStringWithObject:dictionary];
    NSLog(@"dictionary jsonString:%@",jsonString);
    
//    NSLog(@"%@",[NSDictionary dictionaryWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]]);
    
}

+(NSString *) jsonStringWithString:(NSString *) string{
    if ([string hasPrefix:@"{"] && [string hasSuffix:@"}"]) { // json nest
        return [NSString stringWithFormat:@"%@",
                [string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]];
    } else if([string hasPrefix:@"["] && [string hasSuffix:@"]"]) { // json nest
        return [NSString stringWithFormat:@"%@",
                [string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]];
    } else {
        return [NSString stringWithFormat:@"\"%@\"",
                [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]
                ];

    }
}

+(NSString *) jsonStringWithNumber:(NSNumber *) number{
//    NSString *string = [NSString stringWithFormat:@"%d", number.unsignedIntegerValue];
    NSString *string = [number stringValue];
    return [NSString stringWithFormat:@"%@",
                [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]
                ];
}

+(NSString *) jsonStringWithBOOL:(BaseBOOL *) baseBOOL{
    NSString *string = [NSString stringWithFormat:@"%@", [baseBOOL getBOOLJSONValue]];
    return [NSString stringWithFormat:@"%@",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]
            ];
}

+(NSString *) jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+(NSString *) jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [NSString jsonStringWithString:object];
    } else if([object isKindOfClass:[NSDictionary class]]) {
        value = [NSString jsonStringWithDictionary:object];
    } else if([object isKindOfClass:[NSArray class]]) {
        value = [NSString jsonStringWithArray:object];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        value = [NSString jsonStringWithNumber:object];
    } else if ([object isKindOfClass:[BaseBOOL class]]){
        value = [NSString jsonStringWithBOOL:object];
    }
    return value;
}

@end
