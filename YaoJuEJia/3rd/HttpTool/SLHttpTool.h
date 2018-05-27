//
//  SLHttpTool.h
//  SLUniversallyApp
//
//  Created by sll on 2017/5/10.
//  Copyright © 2017年 sll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SLHttpTool : NSObject

+(AFHTTPSessionManager *)httpManager;
/**
 *  发送get请求
 
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (__kindof NSURLSessionTask *)Get:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(__kindof NSURLSessionTask *)Post:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *))failure;

+(void)downloadFileWithStr:(NSString *)str withFilePath:(NSString *)path success:(void(^)(NSURL *filePath))success failure:(void(^)(NSError *error))failure;

@end
