//
//  RedView.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/28.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "RedView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation RedView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [[self rac_signalForSelector:@selector(btnClick)] subscribeNext:^(id x) {
            NSLog(@"点击红色anniu");
        }];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)btnClick{
    NSLog(@"click");
}
@end
