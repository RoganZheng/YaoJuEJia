//
//  YJEJ_DingdanBottomView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_DingdanBottomView.h"

@interface YJEJ_DingdanBottomView ()

@property (nonatomic,strong) YJEJ_BaseLable *totalNumLab;

@end

@implementation YJEJ_DingdanBottomView

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"#515151"];
        _totalNumLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:kWhiteColor textFont:kSuitFont(16) textAlignmet:NSTextAlignmentLeft];
        _totalNumLab.text = @"总计：0";
        [self addSubview:_totalNumLab];
        [_totalNumLab makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(paddingWidth);
            make.height.equalTo(self).offset(-10);
            make.width.equalTo(SCREEN_WIDTH/2);
        }];
        
        UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [submitBtn setTitle:@"提交订单" forState:UIControlStateNormal];
        submitBtn.titleLabel.font = kSuitFont(16);
        submitBtn.titleLabel.textColor = kWhiteColor;
        [submitBtn setBackgroundColor:NAVIGATIONBARCOLOR ];
        submitBtn.layer.masksToBounds = YES;
        submitBtn.layer.cornerRadius = 3;
        [self addSubview:submitBtn];
        [submitBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
        [submitBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(paddingHeigh);
            make.bottom.equalTo(self.mas_bottom).offset(-paddingHeigh);
            make.right.equalTo(self.mas_right).offset(-paddingWidth);
            make.width.equalTo(SCREEN_WIDTH/4);
        }];
    }
    return self;
}

-(void)updateViewWithData:(id)data
{
    _totalNumLab.text = [NSString stringWithFormat:@"总计：%@", (NSString *)data];
    NSLog(@"%@",_totalNumLab.text);
}

-(void)submitAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegate uiView:self collectEventsType:@"提交订单" params:nil];
        
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
