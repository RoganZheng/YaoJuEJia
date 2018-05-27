//
//  SLHttpTool.m
//  SLUniversallyApp
//
//  Created by sll on 2017/5/10.
//  Copyright © 2017年 sll. All rights reserved.
//

#import "SLHttpTool.h"

@implementation SLHttpTool
//默认提交请求的数据是二进制的,返回格式是JSON
//
//1> 如果提交数据是JSON的,需要将请求格式设置为AFJSONRequestSerializer
//2> 如果返回格式不是JSON的,
//请求格式
//
//AFHTTPRequestSerializer            二进制格式
//AFJSONRequestSerializer            JSON
//AFPropertyListRequestSerializer    PList(是一种特殊的XML,解析起来相对容易)
//
//返回格式
//
//AFHTTPResponseSerializer           二进制格式
//AFJSONResponseSerializer           JSON
//AFXMLParserResponseSerializer      XML,只能返回XMLParser,还需要自己通过代理方法解析
//AFXMLDocumentResponseSerializer (Mac OS X)
//AFPropertyListResponseSerializer   PList
//AFImageResponseSerializer          Image
//AFCompoundResponseSerializer       组合

+(AFHTTPSessionManager *)httpManager{
    // 获取请求对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求格式
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json",@"application/soap+xml", nil];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = kRequestTimeOut;
    return manager;
}

/**
  *  发送get请求

 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (__kindof NSURLSessionTask *)Get:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [self httpManager];
    
    return [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(__kindof NSURLSessionTask *)Post:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *))failure{
    AFHTTPSessionManager *manager = [self httpManager];
    return [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}



+(void)xx{

    

}


+(void)downloadFileWithStr:(NSString *)str withFilePath:(NSString *)path success:(void(^)(NSURL *filePath))success failure:(void(^)(NSError *error))failure{
    NSURLSessionTask *task = [[NSURLSessionTask alloc] init];
    //    AFURLSessionManager 这个文件是核心类，基本上通过它来实现了大部分核心功能。负责请求的建立、管理、销毁、安全、请求重定向、请求重启等各种功能。他主要实现了NSURLSession和NSRULSessionTask的封装。
    //    AFHTTPSessionManager 这个文件是AFURLSessionManager的子类。主要实现了对HTTP请求的优化。
    //    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    AFHTTPSessionManager *manager = [self httpManager];

   [[manager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]] progress:^(NSProgress * _Nonnull downloadProgress) {
         NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:path];
        
//        return [NSURL URLWithString:path];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"%@---%@",filePath,error);
        if(error){
            failure(error);
        }else if (success) {
            success(filePath);
        }
        
    }] resume];
    
}



@end
