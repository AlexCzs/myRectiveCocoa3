//
//  LoginModel.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/29.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.data = [dict objectForKey:@"data"];
        self.returnCode = [[dict objectForKey:@"returnCode"] integerValue];
        self.returnMsg = [dict objectForKey:@"returnMsg"];
    }
    return self;
}

@end
