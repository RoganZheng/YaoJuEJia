//
//  CommonHeader.h
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/13.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#define kUserName @"userName"   //昵称
#define kPassword @"password"   //密码
#define kPhone  @"phone"        //电话
#define kCardId @"idCard"       //身份证号

//网络请求超时时间
#define kRequestTimeOut 10

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr, "\nfunction:%s  打印第%d行 content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define IsDicContainSuccess(dic) [[NSString stringWithFormat:@"%@", [dic objectForKey:@"msg"]] containsString:@"成功"]

//生成返回数据数组
#define formatAry(object,ary,from) for (int i = 0; i < ((NSArray *)from).count; i++) {    object * tmpData = [object yy_modelWithDictionary:from[i]];    [ary addObject:tmpData];}
//弱引用
#define WS(weakSelf)  __weak __typeof(&*self) weakSelf = self;

//错误信息
#define kErrorMessage [error.userInfo objectForKey:@"errorMsg"]

#define UIImagePath(imageName) [UIImage imageNamed:imageName]

#endif /* CommonHeader_h */
