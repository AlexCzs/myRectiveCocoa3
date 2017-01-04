//
//  ProtoCol.m
//  test
//
//  Created by 陈昭燊 on 2017/1/4.
//  Copyright © 2017年 燊燊科技公司. All rights reserved.
//

#import "SQLTool.h"

//通过Class Extension让SQLTool遵循所有的协议
@interface SQLTool () <ISelectable, IFromable, IWhere>

@property (nonatomic, strong) NSString *sql;

@end

@implementation SQLTool

+ (NSString *)makeSQL:(void(^)(SQLTool<ISelectable> *tool))block {
    if (block) {
        //创建遵循ISelectable协议的实例，通过block传递给调用者
        SQLTool<ISelectable> *tool = [[SQLTool<ISelectable> alloc] init];
        block(tool);
        return tool.sql;
    }
    return nil;
}

- (Select)select {
    return ^(NSArray<NSString *> *columns) {
        if (columns.count > 0) {
            self.sql = [NSString stringWithFormat:@"SELECT %@", [columns componentsJoinedByString:@","]];
        } else {
            self.sql = @"SELECT *";
        }
        //这里将自己返回出去
        return self;
    };
}

- (From)from{
    return ^(NSString *tableName) {
        if (tableName) {
            self.sql = [NSString stringWithFormat:@"%@ From %@", self.sql,tableName];
        } else {
            NSAssert(tableName, @"表名不能为空");
        }
        return self;
    };
}

- (where)where{
    return ^(NSString *alias){
        if (alias) {
            self.sql = [NSString stringWithFormat:@"%@ where %@", self.sql,alias];
        }else{
            
        }
        return self;
    };
}

@end
