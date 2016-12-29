//
//  LoginViewController.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/29.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "LoginViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LoginViewModel.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "LoginModel.h"
#import "UILoginView.h"

@interface LoginViewController ()
@property (nonatomic, strong) LoginViewModel *loginViewModel;
@property (nonatomic, strong) UILoginView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self binViewModel];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor grayColor];
    self.loginView = [[UILoginView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.loginView];
}

//绑定viewmodel
- (void)binViewModel{
    [RACObserve(self.loginViewModel, avatarURL) subscribeNext:^(NSURL *avatarURL) {
        [self.loginView.imageV sd_setImageWithURL:self.loginViewModel.avatarURL];
    }];
    RAC(self.loginViewModel, username)  = self.loginView.userNameText.rac_textSignal;
    RAC(self.loginViewModel, password)  = self.loginView.passwordText.rac_textSignal;
    RAC(self.loginView.loginButn, enabled) = self.loginViewModel.validLoginSignal;
    
    [[self.loginView.loginButn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
         [self.loginViewModel.loginCommand execute:nil];
     }];
    
    [self.loginViewModel.loginCommand.executionSignals subscribeNext:^(id x) {
        [x subscribeNext:^(LoginModel *loginMsgModel) {
            if (loginMsgModel.returnCode == 200) {
                [self showAlert];
            }
        }];
    }];
}

- (void)showAlert{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"登录成功" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
