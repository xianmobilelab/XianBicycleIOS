//
//  RequestLocation.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "RequestLocation.h"

NSString *const REQUEST_LOCATION_LATITUDE_KEY   = @"lat";
NSString *const REQUEST_LOCATION_LONGITUDE_KEY  = @"lng";
NSString *const REQUEST_LOCATION_DISTANCE_KEY   = @"distance";


@implementation RequestLocation

- (NSString *) getJSONRequest
{
    NSString *jsonString = nil;
    @try {
        NSMutableDictionary *jsonDict = [NSMutableDictionary dictionaryWithCapacity:3];
        [jsonDict setObject:_lat forKey:REQUEST_LOCATION_LATITUDE_KEY];
        [jsonDict setObject:_lng forKey:REQUEST_LOCATION_LONGITUDE_KEY];
        [jsonDict setObject:_distance forKey:REQUEST_LOCATION_DISTANCE_KEY];
        jsonString = [NSString jsonStringWithObject:jsonDict];
        NSLog(@"RequestLocation JSON string: %@", jsonString);
    }
    @catch (NSException *e) {
        NSLog(@"%@",[e description]);
    }
    return jsonString;
}

@end
