//
//  SLHttpFormTool.h
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/17.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SLHttpFormTool : NSObject

+(AFHTTPSessionManager *)httpManager;

+(__kindof NSURLSessionTask *)FormPost:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *))failure;

@end
