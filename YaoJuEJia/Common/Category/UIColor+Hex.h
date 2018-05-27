//
//  UIColor+Hex.h
//  XiaoBaiXueChe
//
//  Created by 许芝光 on 16/2/16.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
