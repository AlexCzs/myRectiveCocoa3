//
//  LoginViewModel.h
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/29.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LoginViewModel : NSObject
@property (nonatomic, copy, readonly) NSURL *avatarURL;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) RACSignal *validLoginSignal;
@property (nonatomic, strong) RACCommand *loginCommand;
@property (nonatomic, strong) RACCommand *browserLoginCommand;
- (instancetype)initViewModel;
@end
