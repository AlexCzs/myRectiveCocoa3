//
//  UILoginView.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/29.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "UILoginView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UILoginView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(165, 120, 50, 50)];
        self.imageV.center = CGPointMake(self.center.x, 120);
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:@"http://img.jiqie.com/10/8/1370nz.jpg"]];
        [self addSubview:_imageV];
        
        
        self.userNameText = [[UITextField alloc]initWithFrame:CGRectMake(0,0, 200, 30)];
        self.userNameText.center = CGPointMake(self.center.x, 200);
        self.userNameText.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.userNameText];
        
        
        self.passwordText = [[UITextField alloc]initWithFrame:CGRectMake(0,0, 200, 30)];
        self.passwordText.center = CGPointMake(self.center.x, 240);
        self.passwordText.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.passwordText];
        
        
        self.loginButn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
        [self.loginButn setTitle:@"login" forState:UIControlStateNormal];
        self.loginButn.backgroundColor = [UIColor redColor];
        self.loginButn.center = CGPointMake(self.center.x, 350);
        self.loginButn.enabled = NO;
        [self addSubview:self.loginButn];
    }
    return self;
}

@end
