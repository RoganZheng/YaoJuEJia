//
//  MHCommonTool.h
//  XinHua
//
//  Created by qu pengbin on 11-11-2.
//  Copyright (c) 2011年 imohoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MHCommonTool : NSObject
/**   函数名称 :dateToString
 **   函数作用 :date根据formatter转换成string
 **   函数参数 : 
 **           formatter  ---要的格式，比如:@"MMM yyyy"
 **           date       ---日期
 **   函数返回值:格式
 **/
+(NSString*)dateToString:(NSString *)formatter date:(NSDate *)date;


/**   函数名称 :convertDateFormatter
 **   函数作用 :将日期从原格式转换成需要的格式
 **   函数参数 : 
 **           sourceFormatter  ---原格式
 **           targetFormatter  ---要的格式，比如:@"MMM yyyy"
 **           dateString       ---日期
 **   函数返回值:格式
 **/
+(NSString*)convertDateFormatter:(NSString*)sourceFormatter 
                  targetFormatter:(NSString*)targetFormatter  
                       dateString:(NSString*)dateString;


/**   函数名称 :stringToDate
 **   函数作用 :将日期字符串转换成date
 **   函数参数 : 
 **           formatter  ---要的格式，比如:@"MMM yyyy"
 **           dateString ---日期
 **   函数返回值:date
 **/
+(NSDate *)stringToDate:(NSString *)formatter dateString:(NSString *)dateString;


/**   函数名称 :charToUTF8String
 **   函数作用 :将char数据转换成utf8格式的string
 **   函数参数 : 
 **           charData  ---需转换的char数据
 **   函数返回值:utf8格式string
 **/
+(NSString *)charToUTF8String:(const char *)charData;


/**   函数名称 :stringToMD5Value
 **   函数作用 :将字符串转成MD5
 **   函数参数 : 
 **           string    ---需转换的string
 **   函数返回值:md5编码后的值
 **/
+(NSString *)stringToMD5Value:(NSString *)string;


/**   函数名称 :randNumber
 **   函数作用 :得到随机数字
 **   函数参数 :   max －－随机数的最大值
 **   函数返回值:随机数
 **/
+(int)randNumber:(int)max;

//随机抽取100个数
- (NSMutableArray *)getRondom:(NSInteger)max;


/**   函数名称 :replaceStringToString
 **   函数作用 :替换不需要的字符
 **   函数参数 :   needReplaceStr   ---需要替换的string
                 replaceString    ---需要替换掉的特殊字符
                 toReplaceString  ---替换成需要的字符
 **   函数返回值:替换后string
 **/
+(NSString *)replaceStringToString:(NSString *)needReplaceStr
                     replaceString:(NSString *)replaceString
                   toReplaceString:(NSString *)toReplaceString;


/**   函数名称 :replaceFirstAndEndSpace
 **   函数作用 :去除首尾空格
 **   函数参数 :   buf   ---需要替换的string
 **   函数返回值:去除首尾空格后的string
 **/
+(NSString *)trimString:(NSString *)buf;


/**   函数名称 :DataToUTF8String
 **   函数作用 :将data类型的数据,转成UTF8的数据
 **   函数参数 :   data   ---需要转化的data
 **   函数返回值:utf8格式string
 **/
+(NSString *)dataToUTF8String:(NSData *)data;


/**   函数名称 :toRadians
 **   函数作用 :角度转弧度  
 **   函数参数 :  角度
 **   函数返回值:  弧度
 **/
//角度转弧度  
+ (CGFloat)toRadians:(CGFloat)degree;  
//弧度转角度  
+ (CGFloat)toDegrees:(CGFloat)radian;  



/**   函数名称 :changeDataToEncodinString
 **   函数作用 :将data转换成所需格式的string  
 **   函数参数 :  
 **            data ---所需转化的data
 **         encodin ---编码格式
 **   函数返回值:  转换好的string
 **/
+(NSString *)changeDataToEncodinString:(NSData *)data encodin:(NSStringEncoding )encodin;



/**   函数名称 :alertWithTitle
 **   函数作用 :提醒工具 
 **   函数参数 :  title               ---提醒的标题(可以为nil)
 **              Message            ---提醒的内容(可以为nil)
 **             delegate            ---delegate(可以为nil)
 **            cancelButton         ---取消按钮(可以为nil)
 **             otherButton         ---其他按钮(可以为nil)
 **   函数返回值:  无
 **/
+(void)alertWithTitle:(NSString *)title 
              Message:(NSString *)message 
             delegate:(id)delegate 
         cancelButton:(NSString *)cancelButton
          otherButton:(NSString *)otherButton;

/**   函数名称 :stringIsValidEmail:
 **   函数作用 :检测邮箱是否合法 
 **   函数参数 : 待检测的邮箱地址
 **   函数返回值:  YES 合法 NO 不合法
 **/
+ (BOOL)stringIsValidEmail:(NSString *)checkString;

/**   函数名称 :isValidateMobile
 **   函数作用 :判断手机号码验证是否合法
 **   函数参数 :
 **   函数返回值: YES 合法 NO 不合法
 **/
+(BOOL) isValidateMobile:(NSString *)mobile;


/**   函数名称 :isBlankString
 **   函数作用 :判断字符串是否为空字符
 **   函数参数 :
 **   函数返回值:
 **/
+ (BOOL) isBlankString:(NSString *)string;

/**
 * 计算文件的大小
 */
+ (NSString *) calculateFileSizeString:(int64_t)fileSize;



/**
 *  获取1970时间戳
 *
 *  @return 时间戳（s）
 */
+ (NSInteger)getTimeStamp;

+ (void)clearConstraints:(UIView *)view;

+ (CGSize) textSizeWithText:(NSString *)text font:(UIFont *)font drawSize:(CGSize)drawSize;

//统计字符串字数
+ (int)countWord:(NSString *)s;

+ (NSString *) dateDistanceWithDate:(NSDate *)date;

//身份证判定
+ (BOOL)verifyIDCardNumber:(NSString *)value;

//时间戳处理 YYYY/MM/dd
+ (NSString *)getYYYYMMddWithString:(NSString *)string;

/**
 时间戳处理 YYYY/MM/dd/HH/mm/ss
 */
+ (NSString *)getYYYYMMddHHmmssWithString:(NSString *)string;

/**
 格式化时间字符串(YYYY/MM/dd)转换为时间戳
 */
+(NSTimeInterval)getTimeIntervalWithTimeStr:(NSString *)timeStr;


/**
 *  判断名字是否合法(中文)
 *  @param name 名称
 *  @return yes / no
 */
+(BOOL)isNameValid:(NSString *)name;

//手机号正则
+ (BOOL)isVAlidPhoneNumber:(NSString *)phoneNum;

//字体自适应高度计算
+ (CGSize)sizeWithMaxSize:(CGSize)maxSize text:(NSString *)text font:(CGFloat)fontSize;

//获取当前显示的控制器。已处理tabbar控制器，返回tabbar items中topVC
+(UIViewController *)currentViewController;

@end
