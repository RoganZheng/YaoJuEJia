//
//  YJEJ_BaseLable.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_BaseLable.h"

@implementation YJEJ_BaseLable

-(instancetype)initWithBackColor:(UIColor *)backColor titleColor:(UIColor *)titleColor textFont:(UIFont *)textFont textAlignmet:(NSTextAlignment)textAlignmet
{
    if ([super init]) {
        self.backgroundColor = backColor;
        self.textColor = titleColor;
        self.font = textFont;
        self.textAlignment = textAlignmet;
    }
    return self;
}

@end
