//
//  BaseTextField.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTextField : UIView

@property (nonatomic,strong) UITextField *mainText;

-(instancetype)initWithPlaceHolder:(NSString *)placeHolderStr InputType:(UIKeyboardType)inputType isHiddenText:(BOOL)isHidden;

@end
