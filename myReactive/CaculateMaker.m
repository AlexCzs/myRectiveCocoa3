//
//  CaculateMaker.m
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/28.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import "CaculateMaker.h"

@implementation CaculateMaker
- (CaculateMaker *(^)(int))add{
    return ^CaculateMaker *(int value){
        _result += value;
        return self;
    };
}

- (CaculateMaker *(^)(int))sub{
    return ^CaculateMaker *(int value){
        _result -= value;
        return self;
    };
}

- (CaculateMaker *(^)(int))muilt{
    return ^CaculateMaker *(int value){
        _result *= value;
        return self;
    };
}

- (CaculateMaker *(^)(int))divide{
    return ^CaculateMaker *(int value){
        _result /= value;
        return self;
    };
}
@end
