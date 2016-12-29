//
//  CaculateManager.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/28.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "CaculateManager.h"

@implementation CaculateManager
+ (int)makeCaculators:(void(^)(CaculateMaker *make))block{
    CaculateMaker *make = [[CaculateMaker alloc]init];
    block(make);
    return make.result;
}

@end
