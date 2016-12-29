//
//  LoginModel.h
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/29.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject
@property (nonatomic, copy) NSString *returnMsg;
@property (nonatomic, assign) NSInteger returnCode;
@property (nonatomic, copy) NSDictionary *data;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
