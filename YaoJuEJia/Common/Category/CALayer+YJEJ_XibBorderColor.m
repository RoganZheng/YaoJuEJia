//
//  CALayer+YJEJ_XibBorderColor.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "CALayer+YJEJ_XibBorderColor.h"
#import <UIKit/UIKit.h>

@implementation CALayer (YJEJ_XibBorderColor)

- (void)setBorderColorWithUIColor:(UIColor *)color
{
    
    self.borderColor = color.CGColor;
}

@end
