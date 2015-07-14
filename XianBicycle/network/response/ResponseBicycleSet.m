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

@synthesize siteid;
@synthesize sitename;
@synthesize location;
@synthesize distance;
@synthesize latitude;
@synthesize longitude;
@synthesize emptynum;
@synthesize locknum;

@end

@implementation ResponseBicycleSet

@synthesize siteList;

-(id) getJSONResponse: (id)jsonObject {
    if ([jsonObject isKindOfClass:[NSArray class]]) {
        NSArray *list = jsonObject;
        NSMutableArray *itemObjectList = [[NSMutableArray alloc] initWithCapacity:[list count]];
        for (int i = 0; i < [list count]; i++) {
            id itemObject = [list objectAtIndex:i];
            BicycleSetItem *item = [[BicycleSetItem alloc] init];
            item.siteid = [itemObject objectForKey:RESPONSE_BICYCLE_SET_SITEID_KEY];
            item.sitename = [itemObject objectForKey:RESPONSE_BICYCLE_SET_SITENAME_KEY];
            item.location = [itemObject objectForKey:RESPONSE_BICYCLE_SET_LOCATION_KEY];
            item.latitude = [itemObject objectForKey:RESPONSE_BICYCLE_SET_LATITUDE_KEY];
            item.longitude = [itemObject objectForKey:RESPONSE_BICYCLE_SET_LONGITUDE_KEY];
            item.distance = [itemObject objectForKey:RESPONSE_BICYCLE_SET_DISTANCE_KEY];
            item.emptynum = [itemObject objectForKey:RESPONSE_BICYCLE_SET_EMPTYNUM_KEY];
            item.locknum = [itemObject objectForKey:RESPONSE_BICYCLE_SET_LOCKNUM_KEY];
            [itemObjectList addObject:item];
        }
        self.siteList = [itemObjectList copy];
        return self;
    }
    return nil;
}

@end
