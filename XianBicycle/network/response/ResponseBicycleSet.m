//
//  ResponseBicycleSet.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "ResponseBicycleSet.h"

NSString *const RESPONSE_BICYCLE_SET_SITEID_KEY     = @"siteid";
NSString *const RESPONSE_BICYCLE_SET_SITENAME_KEY   = @"sitename";
NSString *const RESPONSE_BICYCLE_SET_LOCATION_KEY   = @"location";
NSString *const RESPONSE_BICYCLE_SET_LATITUDE_KEY   = @"latitude";
NSString *const RESPONSE_BICYCLE_SET_LONGITUDE_KEY  = @"longitude";
NSString *const RESPONSE_BICYCLE_SET_DISTANCE_KEY   = @"distance";
NSString *const RESPONSE_BICYCLE_SET_EMPTYNUM_KEY   = @"emptynum";
NSString *const RESPONSE_BICYCLE_SET_LOCKNUM_KEY    = @"locknum";

@implementation BicycleSetItem

@end

@implementation ResponseBicycleSet

@synthesize siteList;

+(instancetype) getJSONResponse: (id)jsonObject {
    ResponseBicycleSet *bicycleSet = [[ResponseBicycleSet alloc] init];
    if ([jsonObject isKindOfClass:[NSArray class]]) {
        NSArray *list = jsonObject;
        NSMutableArray *itemObjectList = [[NSMutableArray alloc] initWithCapacity:[list count]];
        for (int i = 0; i < [list count]; i++) {
            id itemObject = [list objectAtIndex:i];
            BicycleSetItem *item = [[BicycleSetItem alloc] init];
            item.siteid = itemObject[RESPONSE_BICYCLE_SET_SITEID_KEY];
            item.sitename = itemObject[RESPONSE_BICYCLE_SET_SITENAME_KEY];
            item.location = itemObject[RESPONSE_BICYCLE_SET_LOCATION_KEY];
            item.latitude = [(NSNumber *)itemObject[RESPONSE_BICYCLE_SET_LATITUDE_KEY] doubleValue];
            item.longitude = [(NSNumber *)itemObject[RESPONSE_BICYCLE_SET_LONGITUDE_KEY] doubleValue];
            item.distance = [(NSNumber *)itemObject[RESPONSE_BICYCLE_SET_DISTANCE_KEY] doubleValue];
            item.emptynum = [(NSNumber *)itemObject[RESPONSE_BICYCLE_SET_EMPTYNUM_KEY] integerValue];
            item.locknum = [(NSNumber *)itemObject[RESPONSE_BICYCLE_SET_LOCKNUM_KEY] integerValue];
            [itemObjectList addObject:item];
        }
        bicycleSet.siteList = [itemObjectList copy];
        return bicycleSet;
    }
    return nil;
}

@end
