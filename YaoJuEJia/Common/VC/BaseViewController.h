//
//  BaseViewController.h
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/13.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 自定义封装naviButton

 @param title 文字描述
 @param target 默认self
 @param action 执行动作
 @return UIBarButtonItem
 */
- (UIBarButtonItem *)customWithTitle:(NSString *)title target:(nullable id)target action:(nullable SEL)action;

/**
 图片naviButton

 @param image 图片名
 @param target 默认self
 @param action 执行动作
 @return UIBarButtonItem
 */
- (UIBarButtonItem *)customWithImage:(NSString *)image target:(nullable id)target action:(nullable SEL)action;
/**
 增加navi左上返回按钮，如需要，则调用
 */
- (void)addBackBtn;

/**
 自定义返回按钮动作，默认返回上一级

 @param sender 任意参数
 */
- (void)returnAction:(id)sender;


/**
 添加提示语

 @param info 弹窗信息内容
 */
- (void)showAlertInfo:(NSString *)info;

@end
