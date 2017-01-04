//
//  ProtoCol.h
//  test
//
//  Created by 陈昭燊 on 2017/1/4.
//  Copyright © 2017年 燊燊科技公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocol.h"


@interface SQLTool : NSObject

//这里不需要了，放到.m中去
//@property (nonatomic, strong, readonly) NSString *sql;

//参数是一个block，传递一个遵循ISelectable的SQLTool的实例给调用者
+ (NSString *)makeSQL:(void(^)(SQLTool<ISelectable> *tool))block;

@end
