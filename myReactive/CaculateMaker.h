//
//  CaculateMaker.h
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/28.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculateMaker : NSObject
@property (nonatomic, assign) int result;
- (CaculateMaker *(^)(int))add;
- (CaculateMaker *(^)(int))sub;
- (CaculateMaker *(^)(int))muilt;
- (CaculateMaker *(^)(int))divide;


@end
