//
//  ResponseBicycleSet.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "ResponseBicycleSet.h"

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
            item.siteid = [itemObject objectForKey:@"siteid"];
            item.sitename = [itemObject objectForKey:@"sitename"];
            item.location = [itemObject objectForKey:@"location"];
            item.latitude = [itemObject objectForKey:@"latitude"];
            item.longitude = [itemObject objectForKey:@"longitude"];
            item.distance = [itemObject objectForKey:@"distance"];
            item.emptynum = [itemObject objectForKey:@"emptynum"];
            item.locknum = [itemObject objectForKey:@"locknum"];
            [itemObjectList addObject:item];
        }
        self.siteList = [itemObjectList copy];
        return self;
    }
    return nil;
}

@end
