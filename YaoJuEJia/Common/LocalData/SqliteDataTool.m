//
//  YJEJ_SqliteDataTool.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/10.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "SqliteDataTool.h"

@implementation SqliteDataTool

static FMDatabaseQueue *queue;

+(void)initialize
{
    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"yaoju.sqlite"];
    //    NSLog(@"FMDBpath---%@",filename);
    queue = [FMDatabaseQueue databaseQueueWithPath:filename];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL result = [db executeUpdate:@"create table if not exists userTable (id integer primary key autoincrement, idCard text, phone text, userName text, password text);"];
        if (result) {
            NSLog(@"创建表成功");
        }else
        {
            NSLog(@"创建表失败");
        }
    }];
}

+ (void)addUserImformationWithIdCard:(NSString *)idCard phone:(NSString *)phoneNum userName:(NSString *)name password:(NSString *)password
{
    //插入新用户数据之前，先将已有的用户数据删除，再重新插入
    [self removeLastUserImformation];
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO userTable (idCard,phone,userName,password) VALUES('%@','%@','%@','%@')",idCard, phoneNum, name, password];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        if (![db executeUpdate:sql]) {
            NSLog(@"插入新用户数据失败");
        }else
        {
            NSLog(@"插入新用户数据成功");
        }
    }];
}

//查询用户数据是否存在

+(BOOL)calculateUserIsExist;
{
    __block BOOL isExist = NO;
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat:@"select * from userTable"];
        FMResultSet *rs = [db executeQuery:sql];
        NSLog(@"%@",rs);
        while ([rs next]) {
            isExist = YES;
        }
        [rs close];
    }];
    return isExist;
}

+ (void)removeLastUserImformation
{
    if (![self calculateUserIsExist]) {
        return;
    }
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat:@"DELETE FROM userTable;"];
        BOOL result = [db executeUpdate:sql];
        if (result) {
            NSLog(@"删除原有用户数据成功");
        }else
        {
            NSLog(@"删除原有用户数据失败");
        }
    }];
}

+ (NSDictionary *)calculateAndGetUserData
{
    __block NSMutableDictionary *resultDic = [NSMutableDictionary dictionary];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat:@"select * from userTable;"];
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            [resultDic setObject:[rs stringForColumn:kPhone] forKey:kPhone];
            [resultDic setObject:[rs stringForColumn:kUserName] forKey:kUserName];
            [resultDic setObject:[rs stringForColumn:kPassword] forKey:kPassword];
            [resultDic setObject:[rs stringForColumn:kCardId] forKey:kCardId];
        }
    }];
    return [NSDictionary dictionaryWithDictionary:resultDic];
}
@end
