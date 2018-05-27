//
//  YJEJ_SqliteDataTool.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/10.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#include <FMDB.h>

@interface SqliteDataTool : NSObject


/**
 插入一条用户数据
 
 @param idCard 身份证
 @param phoneNum 手机号
 @param name 姓名
 @param password 密码
 */
+(void)addUserImformationWithIdCard:(NSString *)idCard phone:(NSString *)phoneNum userName:(NSString *)name password:(NSString *)password;


/**
 删除用户数据
 */
+(void)removeLastUserImformation;


/**
 查询当前用户的数据
 
 @return 返回字典中包含，昵称、密码、身份证号、手机号
 */
+(NSDictionary *)calculateAndGetUserData;

@end
