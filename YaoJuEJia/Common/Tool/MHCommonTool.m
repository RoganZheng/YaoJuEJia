//
//  MHCommonTool.m
//  XinHua
//
//  Created by qu pengbin on 11-11-2.
//  Copyright (c) 2011年 imohoo. All rights reserved.
//

#import "MHCommonTool.h"
//#import <CommonCrypto/CommonDigest.h>

@implementation MHCommonTool

//函数作用 :date根据formatter转换成string
+(NSString*)dateToString:(NSString *)formatter date:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return[dateFormatter stringFromDate:date];
}


//函数作用 :将日期从原格式转换成需要的格式
+(NSString*)convertDateFormatter:(NSString*)sourceFormatter 
                  targetFormatter:(NSString*)targetFormatter  
                       dateString:(NSString*)dateString
{   
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:sourceFormatter];
    NSDate *date = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:targetFormatter];
    return[dateFormatter stringFromDate:date];
}

//函数作用 :将日期字符串转换成date
+(NSDate *)stringToDate:(NSString *)formatter dateString:(NSString *)dateString
{
    
    NSLocale *locale=[NSLocale currentLocale];
    
	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:[locale localeIdentifier]]];
	[dateFormatter setDateFormat:formatter];
	return [dateFormatter dateFromString:dateString];
}

//将char数据转换成utf8格式的string
+(NSString *)charToUTF8String:(const char *)charData
{
    NSString *string = [NSString stringWithUTF8String:charData];
    return string;
}

////将string转换成MD5格式数据,需引进库<CommonCrypto/CommonDigest.h>
//+ (NSString *)stringToMD5Value:(NSString *)string
//{
//    if (string==nil) 
//    {
//        return nil;
//    }
//    const char *cStr = [string UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5( cStr, strlen(cStr), result );
//    return [NSString stringWithFormat:
//            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
//            ];
//}

//函数作用 :得到随机数字
+(int)randNumber:(int)max
{
    return arc4random()%max+1;
}

//随机抽取max个数
- (NSMutableArray *)getRondom:(NSInteger)max{
    
    NSMutableArray *numBox = [NSMutableArray array];
    NSMutableArray *retNum = [NSMutableArray array];
    
    for(int i=0;i<max;i++){
        [numBox addObject:[NSNumber numberWithInteger:i]];
    }
    
    NSInteger end = max-1;
    
    for(int i=0;i<max;i++){
        int num = arc4random()%(end+1);//0 - max-1
        [retNum addObject:[numBox objectAtIndex:num]];
        [numBox replaceObjectAtIndex:num withObject:[numBox objectAtIndex:end]];
        end--;
    }
    
    NSLog(@"%@",retNum);
    
    return retNum;
    
}

//函数作用 :替换不必要的字符
+(NSString *)replaceStringToString:(NSString *)needReplaceStr
                     replaceString:(NSString *)replaceString
                   toReplaceString:(NSString *)toReplaceString
{
    NSString *string = [needReplaceStr stringByReplacingOccurrencesOfString:replaceString withString:toReplaceString];
    return string;
}

//函数作用 :去除首尾空格
+ (NSString *)trimString:(NSString *)buf
{    
    NSString *string = [[NSMutableString alloc] initWithString:buf];
    
    CFStringTrimWhitespace((CFMutableStringRef)string);
    
    return string;
}

//将data类型的数据,转成UTF8的数据
+(NSString *)dataToUTF8String:(NSData *)data
{
	NSString *buf = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	return buf;
}

//角度转弧度  
+ (CGFloat)toRadians:(CGFloat)degree 
{  
    return degree / 180.0 * M_PI;  
}  
//弧度转角度  
+ (CGFloat)toDegrees:(CGFloat)radian 
{  
    return radian / M_PI * 180.0;  
}  

//将string转换为指定编码 
+(NSString *)changeDataToEncodinString:(NSData *)data encodin:(NSStringEncoding )encodin
{
    NSString *buf = [[NSString alloc] initWithData:data encoding:encodin];
    return buf;
}

//uialert提醒
+(void)alertWithTitle:(NSString *)title 
              Message:(NSString *)message 
             delegate:(id)delegate 
         cancelButton:(NSString *)cancelButton
          otherButton:(NSString *)otherButton
{    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message
												   delegate:delegate cancelButtonTitle:cancelButton otherButtonTitles:otherButton,nil];
	
	[alert show];
}

+ (BOOL)stringIsValidEmail:(NSString *)checkString
{  
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";   
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString]; 
    
    return [emailTest evaluateWithObject:checkString];  
}

/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^1[3456789]\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/**   函数名称 :isBlankString
 **   函数作用 :判断字符串是否为空字符
 **   函数参数 :
 **   函数返回值:
 **/
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

/**
 * 计算文件的大小
 */
+ (NSString *) calculateFileSizeString:(int64_t)fileSize {
    NSArray *sizeUtils = @[@"B",@"K",@"M",@"G"];
    
    int counter = 0;
    while (counter < [sizeUtils count]-1 && fileSize > 1024.0f) {
        fileSize /= 1024.0f;
        counter++;
    }
    
    return [NSString stringWithFormat:@"%0.1lld%@",fileSize,sizeUtils[counter]];
}


+ (NSInteger)getTimeStamp {
    return [[NSDate date] timeIntervalSince1970];
}


+ (void)clearConstraints:(UIView *)view{
    if(!view || !view.superview) return;
    
    //First remove any constraints on the superview
    NSMutableArray * constraints_to_remove = [NSMutableArray new];
    UIView * superview = view.superview;
    
    for( NSLayoutConstraint * constraint in superview.constraints) {
        if( constraint.firstItem == view ||constraint.secondItem == view ) {
            [constraints_to_remove addObject:constraint];
        }
    }
    [superview removeConstraints:constraints_to_remove];
}

+ (CGSize) textSizeWithText:(NSString *)text font:(UIFont *)font drawSize:(CGSize)drawSize {
    CGSize textSize = CGSizeZero;
        textSize = [text boundingRectWithSize:drawSize
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:font}
                                      context:nil].size;
    return textSize;
}


+ (int)countWord:(NSString *)s
{
    int i,n=[s length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++){
        c=[s characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
}

+ (NSString *) dateDistanceWithDate:(NSDate *)date {
    NSString *timeString = @"";
    NSTimeInterval timeInterval = ABS([date timeIntervalSinceNow]);
    if (timeInterval < 3600) {
        timeString = [NSString stringWithFormat:@"%d分钟前",(int)timeInterval/60];
    }else if (timeInterval < 3600 * 24) {
        int hour = (int)timeInterval/3600;
        int second = ((int)timeInterval%3600)/60;
        timeString = [NSString stringWithFormat:@"%d个小时%d分钟前",hour,second];
    }else {
        timeString = [NSString stringWithFormat:@"%d天前",(int)timeInterval/(3600*24)];
    }
    
    return timeString;
}

//身份证判定
+ (BOOL)verifyIDCardNumber:(NSString *)value {
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
    + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

+ (NSString *)getYYYYMMddWithString:(NSString *)string
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
//  史前巨坑！！！！！！！！
//    [formatter setDateFormat:@"YYYY/MM/dd"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[string doubleValue]];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    NSString* dateString = [formatter stringFromDate:localDate];
    return dateString;
}

/**
 时间戳处理
 */
+ (NSString *)getYYYYMMddHHmmssWithString:(NSString *)string
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy/MM/dd/HH/mm/ss"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[string doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 格式化时间字符串(YYYY/MM/dd)转换为时间戳
 */
+(NSTimeInterval)getTimeIntervalWithTimeStr:(NSString *)timeStr{
    NSDateFormatter *formatter_ = [[NSDateFormatter alloc] init];
    formatter_.dateFormat = @"yyyy/MM/dd";
    NSDate *createDate = [formatter_ dateFromString:timeStr];
    NSTimeInterval a = [createDate timeIntervalSince1970];
    return a;
}

/**
 *  判断名字是否合法(中文)
 *  @param name 名称
 *  @return yes / no
 */
+(BOOL)isNameValid:(NSString *)name
{
    BOOL isValid = NO;
    
    if (name.length > 0)
    {
        for (NSInteger i=0; i<name.length; i++)
        {
            unichar chr = [name characterAtIndex:i];
            
            if (chr < 0x80)
            { //字符
                if (chr >= 'a' && chr <= 'z')
                {
                    isValid = NO;
                }
                else if (chr >= 'A' && chr <= 'Z')
                {
                    isValid = NO;
                }
                else if (chr >= '0' && chr <= '9')
                {
                    isValid = NO;
                }
                else if (chr == '-' || chr == '_')
                {
                    isValid = NO;
                }
                else
                {
                    isValid = NO;
                }
            }
            else if (chr >= 0x4e00 && chr < 0x9fa5)
            { //中文
                isValid = YES;
            }
            else
            { //无效字符
                isValid = NO;
            }
            
            if (!isValid)
            {
                break;
            }
        }
    }
    
    return isValid;
}

//手机号正则
+ (BOOL)isVAlidPhoneNumber:(NSString *)phoneNum{
    /*
     支持手机号段:
     移动：139   138   137   136   135   134   147   150   151   152   157   158    159   178  182   183   184   187   188
     联通： 130   131   132   155   156   185   186   145   176
     电信： 133   153   177   180   181   189
     */
//    NSString *regex = @"^0?(13[0-9]|15[012356789]|17[03678]|18[0-9]|14[57])[0-9]{8}";
    NSString *regex = @"^1[3456789]\\d{9}$";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:phoneNum];
}
+ (CGSize)sizeWithMaxSize:(CGSize)maxSize text:(NSString *)text font:(CGFloat)fontSize{
    CGSize textSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size;
    return textSize;
}

+(UIViewController *)currentViewController
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    if (window.windowLevel != UIWindowLevelNormal){
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(UIWindow * tmpWin in windows){
            
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                
                window = tmpWin;
                
                break;
                
            }
            
        }
        
    }
    
    UIViewController *result = window.rootViewController;
    
    while (result.presentedViewController) {
        
        result = result.presentedViewController;
        
    }
    
    if ([result isKindOfClass:[UITabBarController class]]) {
        
        result = [(UITabBarController *)result selectedViewController];
        
    }
    
    if ([result isKindOfClass:[UINavigationController class]]) {
        
        result = [(UINavigationController *)result topViewController];
        
    }
    
    return result;
}

@end
