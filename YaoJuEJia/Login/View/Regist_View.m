//
//  Regist_View.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "Regist_View.h"

@implementation Regist_View

+(Regist_View *)loadView
{
    NSArray *xibs = [[NSBundle mainBundle] loadNibNamed:@"Regist_View" owner:self options:nil];
    Regist_View *view = [xibs objectAtIndex:0];
    return view;
}

- (IBAction)registAction:(id)sender {
    if (self.idCardText.text.length == 0) {
        [super showAlertInfo:@"身份证号不能为空"];
        return;
    }
    if (![MHCommonTool verifyIDCardNumber:self.idCardText.text]) {
        [super showAlertInfo:@"请输入正确身份证号"];
        return;
    }
    if (self.phoneText.text.length == 0) {
        [super showAlertInfo:@"手机号不能为空"];
        return;
    }
    if (![MHCommonTool isVAlidPhoneNumber:self.phoneText.text]) {
        [super showAlertInfo:@"请输入正确手机号"];
        return;
    }
    if (self.nameText.text.length == 0) {
        [super showAlertInfo:@"姓名不能为空"];
        return;
    }
    if (self.pwdText.text.length == 0) {
        [super showAlertInfo:@"密码不能为空"];
        return;
    }
    
    NSMutableDictionary *paraDic = [NSMutableDictionary dictionary];
    [paraDic setObject:self.idCardText.text forKey:@"idCard"];
    [paraDic setObject:self.phoneText.text forKey:@"phone"];
    [paraDic setObject:self.nameText.text forKey:@"name"];
    [paraDic setObject:self.pwdText.text forKey:@"password"];
    
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegate uiView:self collectEventsType:@"确认注册" params:paraDic];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
