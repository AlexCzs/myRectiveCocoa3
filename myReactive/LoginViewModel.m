//
//  LoginViewModel.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/29.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "LoginViewModel.h"
#import <AFNetworking/AFNetworking.h>
#import "LoginModel.h"

@implementation LoginViewModel

- (instancetype)initViewModel
{
    self = [super init];
    if (self) {
        RAC(self,avatarURL) = [RACObserve(self, username)map:^id(id value) {
            NSLog(@"userName:%@",value);
            return @"http://img.jiqie.com/10/8/1370nz.jpg";
        }];
        
        self.validLoginSignal = [RACSignal combineLatest:@[ RACObserve(self, username), RACObserve(self, password) ] reduce:^(NSString *username,NSString *password){
            NSLog(@"enable:%d",username.length > 0 && password.length > 0);
            return @(username.length > 0 && password.length > 0);
        }];
        
        self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            NSLog(@"commoand：init");
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [[AFHTTPSessionManager manager] GET:@"http://123.56.6.91:7390/earthshaker/user/v2/awardList.do?access_token=admin" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    LoginModel *loginModel = [[LoginModel alloc]initWithDict:responseObject];
                    [subscriber sendNext:loginModel];
                    [subscriber sendCompleted];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [subscriber sendNext:@"bad request"];
                    [subscriber sendCompleted];
                }];
                return nil;
            }];
        }];
        
        
    }
    return self;
}

@end
