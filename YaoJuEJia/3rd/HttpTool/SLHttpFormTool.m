//
//  SLHttpFormTool.m
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/17.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "SLHttpFormTool.h"

@implementation SLHttpFormTool

+(AFHTTPSessionManager *)httpManager{
    // 获取请求对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求格式
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = kRequestTimeOut;
    return manager;
}

+(__kindof NSURLSessionTask *)FormPost:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *))failure{
    AFHTTPSessionManager *manager = [self httpManager];
    return [manager POST:URLString
              parameters:parameters
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    


    }
                progress:^(NSProgress * _Nonnull uploadProgress) {
        
    }
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     if (success) {
                         success(responseObject);
                     }
    }
                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     if (failure) {
                         failure(error);
                     }
    }];
//    return [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
}

@end
