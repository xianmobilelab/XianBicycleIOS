//
//  XianBicycleService.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "XianBicycleService.h"
#import "XianBicycleNetwork.h"
#import <AFNetworking.h>

@implementation XianBicycleService

- (void)searchByLocation: (RequestLocation *) param withDelegate: (id)delegate
{
    [self doSearch:param withDelegate:delegate];
}

- (void)searchByTerm: (RequestTerm *) param withDelegate: (id)delegate
{
    [self doSearch:param withDelegate:delegate];
}

- (void)doSearch: (BaseRequest *) param withDelegate: (id)delegate
{
    NSString *request = [[param getJSONRequest] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *requestAPI = SEARCH_API;
    NSRange range = [requestAPI rangeOfString:SEARCH_QUERY];
    requestAPI = [requestAPI stringByReplacingCharactersInRange:range withString:request];
    NSLog(@"Search API: %@", requestAPI);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    [manager GET:requestAPI parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
