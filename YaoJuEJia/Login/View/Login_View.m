//
//  Login_View.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "Login_View.h"

@implementation Login_View

+(Login_View *)loadView
{
    NSArray *xibs = [[NSBundle mainBundle] loadNibNamed:@"Login_View" owner:self options:nil];
    Login_View *view = [xibs objectAtIndex:0];
    [view.RememberBtn setImage:[UIImage imageNamed:@"gouxuan"] forState:UIControlStateSelected];
    
    return view;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)rememberBtn:(UIButton *)sender {
    if (self.isRemember) {
        [self.RememberBtn setImage:[UIImage imageNamed:@"weigouxuan"] forState:UIControlStateNormal];
        if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [_delegate uiView:nil collectEventsType:@"取消勾选" params:nil];
        }
    }else
    {
        [self.RememberBtn setImage:[UIImage imageNamed:@"gouxuan"] forState:UIControlStateNormal];
        if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [_delegate uiView:nil collectEventsType:@"确认勾选" params:nil];
        }
    }
    self.isRemember = !self.isRemember;
    
}

- (IBAction)loginBtn:(id)sender {
    NSLog(@"登录");
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegate uiView:nil collectEventsType:@"登录操作" params:nil];
    }
}

- (IBAction)registBtn:(id)sender {
    NSLog(@"注册");
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegate uiView:nil collectEventsType:@"注册操作" params:nil];
    }
}
@end
