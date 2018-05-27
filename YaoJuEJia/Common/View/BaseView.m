//
//  BaseView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (void)showAlertInfo:(NSString *)info
{
    if (info == nil) {
        return;
    }
    [MBProgressHUD showError:info toView:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
