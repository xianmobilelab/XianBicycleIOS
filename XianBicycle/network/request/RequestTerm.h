//
//  RequestTerm.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/12/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseRequest.h"

// Query fmt
// {"term":ANY_STRING}
@interface RequestTerm : BaseRequest

@property(nonatomic, copy) NSString *term;

-(instancetype)initWithTerm:(NSString *) term;

@end
