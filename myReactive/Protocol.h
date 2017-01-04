//
//  Protocol.h
//  test
//
//  Created by 陈昭燊 on 2017/1/4.
//  Copyright © 2017年 燊燊科技公司. All rights reserved.
//

#ifndef Protocol_h
#define Protocol_h

@class SQLTool;

@protocol ISelectable;
@protocol IFromable;
@protocol IWhere;


/*****************************/

//定义select的block，返回值是遵循了IFromable的实例对象
//即后续调用时只能调用IFromable协议的方法
typedef SQLTool <IFromable> *(^Select)(NSArray<NSString *> *columns);

//定义from的block
typedef SQLTool <IWhere> *(^From)(NSString *tableName);

typedef SQLTool <IWhere> *(^where)(NSString *alias);


/*****************************/

@protocol ISelectable <NSObject>

@property (nonatomic, strong, readonly) Select select;

@end

@protocol IFromable <NSObject>

@property (nonatomic, strong, readonly) From from;

@end

@protocol IWhere <NSObject>

@property (nonatomic, strong, readonly) where where;
@end

#endif
