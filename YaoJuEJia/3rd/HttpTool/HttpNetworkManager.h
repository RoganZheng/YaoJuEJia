//
//  HttpNetworkManager.h
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^MHAsiSuccessBlock)(NSDictionary *returnData);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^MHAsiFailureBlock)(NSError *error);

@interface HttpNetworkManager : NSObject

/**
 请求单例管理
 */
+(instancetype)sharedInstance;

/**
 POST请求

 @param url url
 @param params 请求字典
 @param successBlock 成功block
 @param failBlock 失败block
 */
+(void)postWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(MHAsiSuccessBlock)successBlock failBlock:(MHAsiFailureBlock)failBlock;

/**
 GET请求

 @param url URL
 @param params 请求字典
 @param successBlock 成功block
 @param failBlock 失败block
 */
+(void)getWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(MHAsiSuccessBlock)successBlock failBlock:(MHAsiFailureBlock)failBlock;


/**
 post请求，以表单形式

 @param url URL
 @param params 请求字典
 @param successBlock 成功block
 @param failBlock 失败block
 */
+(void)postFormWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(MHAsiSuccessBlock)successBlock failBlock:(MHAsiFailureBlock)failBlock;

@end
