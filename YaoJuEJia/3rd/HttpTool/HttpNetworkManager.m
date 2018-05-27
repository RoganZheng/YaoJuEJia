//
//  HttpNetworkManager.m
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "HttpNetworkManager.h"
#import "SLHttpTool.h"
#import "SLHttpFormTool.h"
#import "MBProgressHUD.h"
#import <XMLReader.h>

@implementation HttpNetworkManager

+ (instancetype)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+(void)postFormWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(MHAsiSuccessBlock)successBlock failBlock:(MHAsiFailureBlock)failBlock
{
    [MBProgressHUD showHUDAddedTo:[MHCommonTool currentViewController].view animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        
    });
    
    NSLog(@"\n[ 请求URL： %@ ], \n[ 请求参数：%@ ]",url,params);
    [[SLHttpFormTool httpManager] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key = %@ and obj = %@", key, obj);
            [formData appendPartWithFormData:[obj dataUsingEncoding:NSUTF8StringEncoding] name:key];
        }];
        NSLog(@"%@",formData);
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        
//        NSDictionary *responeDic = (NSDictionary *)responseObject;
        //此处为解析XML数据格式
        NSDictionary *responeDic = [XMLReader dictionaryForXMLString:responseObject error:nil];
        
        NSLog(@"\n[ 请求地址：%@] \n [返回数据：%@]",url,responeDic);
        
        if (responeDic == nil || ![responeDic isKindOfClass:[NSDictionary class]]) {
            NSError *error = [self serverDataError];
            if (failBlock) {
                failBlock(error);
            }
            return;
        }
        if ([responeDic objectForKey:@"msg"]) {
            if (successBlock) {
                successBlock(responeDic);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        
        NSLog(@"[ 请求错误信息：%@ ]",error);
        if (failBlock) {
            failBlock(error);
        }
    }];
}

+(void)postWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(MHAsiSuccessBlock)successBlock failBlock:(MHAsiFailureBlock)failBlock
{
    //加载等待动画至当前顶部的VC视图中，固定秒数之后自动关闭，防止当前页面假死，影响用户体验
    
    [MBProgressHUD showHUDAddedTo:[MHCommonTool currentViewController].view animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        
    });
    
    NSLog(@"\n[ 请求URL： %@ ], \n[ 请求参数：%@ ]",url,params);
    
    [[SLHttpTool httpManager] POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        
        //        NSDictionary *responeDic = (NSDictionary *)responseObject;
        //此处为解析XML数据格式
        NSDictionary *responeDic = [XMLReader dictionaryForXMLString:responseObject error:nil];
        
        NSLog(@"\n[ 请求地址：%@] \n [返回数据：%@]",url,responeDic);
        
        if (responeDic == nil || ![responeDic isKindOfClass:[NSDictionary class]]) {
            NSError *error = [self serverDataError];
            if (failBlock) {
                failBlock(error);
            }
            return;
        }
        if ([responeDic objectForKey:@"msg"]) {
            if (successBlock) {
                successBlock(responeDic);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        
        NSLog(@"[ 请求错误信息：%@ ]",error);
        if (failBlock) {
            failBlock(error);
        }
    }];
}

+(void)getWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(MHAsiSuccessBlock)successBlock failBlock:(MHAsiFailureBlock)failBlock
{
    //加载等待动画至当前顶部的VC视图中，固定秒数之后自动关闭，防止当前页面假死，影响用户体验
    
    [MBProgressHUD showHUDAddedTo:[MHCommonTool currentViewController].view animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        
    });
    
    NSLog(@"\n[ 请求URL： %@ ], \n[ 请求参数：%@ ]",url,params);
    
    [[SLHttpTool httpManager] GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        //上传进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        

        //        NSDictionary *responeDic = (NSDictionary *)responseObject;
        //此处为解析XML数据格式
        NSDictionary *responeDic = [XMLReader dictionaryForXMLString:responseObject error:nil];
        NSLog(@"\n[ 请求地址：%@] \n [返回数据：%@]",url,responeDic);
        
        if (responseObject == nil || ![responseObject isKindOfClass:[NSDictionary class]]) {
            NSError *error = [self serverDataError];
            if (failBlock) {
                failBlock(error);
            }
            return;
        }
        if ([responseObject objectForKey:@"msg"]) {
            if (successBlock) {
                successBlock(responseObject);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:[MHCommonTool currentViewController].view animated:YES];
        if (failBlock) {
            failBlock(error);
        }
    }];
}

+ (NSError *)serverDataError {
    //服务器数据格式错误
    NSError *error = [NSError errorWithDomain:@"imohoo"
                                         code:2333
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"接口返回数据无法解析", @"errorMsg",
                                               NULL]];
    return error;
}

@end
