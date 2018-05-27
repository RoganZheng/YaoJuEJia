//
//  SendObject.h
//  XiaoBaiXueChe
//
//  Created by 许芝光 on 16/2/14.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 基于YYModel，用于将传参字典中的模型转换成json格式
 */

@interface SendObject : NSObject
@property(nonatomic, strong) NSString *test;
- (id)getSend;
@end
