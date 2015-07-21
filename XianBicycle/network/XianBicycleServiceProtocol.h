//
//  XianBicycleServiceProtocol.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/14/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XianBicycleServiceProtocol <NSObject>

enum
{
    NetworkCodeNoError,
    NetworkCodeTimeout,
    NetworkCodeUnknown
};

/**
 * @brief Called when the service has completed parsing the requested data into formatted result object.
 * @param data :  decoded resutl object data(need at a cast)
 * @param code : result code, 0 is success, others is error
 **/
- (void)getDecodedData:(id)data withCode:(NSInteger)code;

@end