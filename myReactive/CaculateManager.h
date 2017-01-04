//
//  CaculateManager.h
//  myReactive
//
//  Created by 陈昭燊 on 2016/12/28.
//  Copyright © 2016年 燊燊科技公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CaculateMaker.h"

@interface CaculateManager : NSObject
+ (int)makeCaculators:(void(^)(CaculateMaker *caculate))block;
@end
