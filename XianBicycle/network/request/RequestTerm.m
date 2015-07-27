//
//  RequestTerm.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "RequestTerm.h"

NSString *const REQUEST_TERM_KEY = @"term";

@implementation RequestTerm

- (NSString *) getJSONRequest
{
    NSString *jsonString = nil;
    @try {
        NSMutableDictionary *jsonDict = [NSMutableDictionary dictionaryWithCapacity:1];
        [jsonDict setObject:_term forKey:REQUEST_TERM_KEY];
        jsonString = [NSString jsonStringWithObject:jsonDict];
        NSLog(@"RequestTerm JSON string: %@", jsonString);
    }
    @catch (NSException *e) {
        NSLog(@"%@",[e description]);
    }
    return jsonString;
}

-(instancetype)initWithTerm:(NSString *) term
{
    if (self = [super init]) {
        _term = [[NSString alloc] initWithString:term];
    }
    return self;
}

@end
