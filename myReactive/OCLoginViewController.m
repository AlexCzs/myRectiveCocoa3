//
//  OCLoginViewController.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/29.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "OCLoginViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "LoginModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UILoginView.h"

@interface OCLoginViewController ()
@property (nonatomic, strong) LoginModel *loginModel;
@property (nonatomic, strong) UILoginView *loginView;
@end

@implementation OCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor grayColor];
    self.loginView = [[UILoginView alloc]initWithFrame:self.view.frame];
    [self.loginView.userNameText addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self.loginView.passwordText addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.loginView];
    [self.loginView.loginButn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)netWork{
    [[AFHTTPSessionManager manager] GET:@"http://123.56.6.91:7390/earthshaker/user/v2/awardList.do?access_token=admin" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.loginModel = [[LoginModel alloc]initWithDict:responseObject];
        if (self.loginModel.returnCode == 200) {
            [self showAlert];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
- (void)showAlert{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"登录成功" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)textChange:(UITextField *)textFile{
    NSLog(@"%@",textFile.text);
    BOOL enable = self.loginView.userNameText.text.length>0 && self.loginView.passwordText.text.length>0;
    self.loginView.loginButn.enabled = enable;
}

- (void)loginAction{
    [self netWork];
}

@end
