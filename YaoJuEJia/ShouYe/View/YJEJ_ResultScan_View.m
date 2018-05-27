//
//  YJEJ_ResultScan_View.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/18.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_ResultScan_View.h"

@interface YJEJ_ResultScan_View ()

@property (nonatomic ,strong) NSString *iconImg;
@property (nonatomic,strong) NSString *titleStr;
@end

@implementation YJEJ_ResultScan_View

-(instancetype)initWithTitle:(NSString *)titleStr image:(NSString *)imageStr restNum:(NSString *)restNum
{
    self = [super init];
    if (self) {
        _iconImg = imageStr;
        _titleStr = titleStr;
        self.backgroundColor = kClearColor;
        UIView *mainBackView = [[UIView alloc]init];
        mainBackView.backgroundColor = kWhiteColor;
        [self addSubview:mainBackView];
        [mainBackView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-44);
        }];
        
        UIView *numBackView = [[UIView alloc]init];
        numBackView.backgroundColor = kWhiteColor;
        [self addSubview:numBackView];
        [numBackView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(mainBackView.mas_bottom).offset(paddingHeigh/2);
            make.right.equalTo(self);
            make.left.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        if (restNum.integerValue > 0) {
            self.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
            [self addGestureRecognizer:tap];
        }
        UIImageView *iconImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageStr]];
        iconImg.contentMode = UIViewContentModeScaleAspectFit;
        [mainBackView addSubview:iconImg];
        [iconImg makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(mainBackView);
            make.centerY.equalTo(mainBackView).offset(-paddingHeigh);
            make.width.equalTo(mainBackView.mas_width).offset(-paddingWidth *2);
            make.height.equalTo(mainBackView.mas_height).offset(-paddingHeigh *4);
        }];
        YJEJ_BaseLable *titleLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:COLOR(70, 70, 70, 1) textFont:kSuitFont(15) textAlignmet:NSTextAlignmentCenter];
        [mainBackView addSubview:titleLab];
        titleLab.text = titleStr;
        [titleLab makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(iconImg.mas_bottom).offset(paddingHeigh/2);
            make.width.equalTo(self);
            make.height.equalTo(25);
        }];
        
        YJEJ_BaseLable *numLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:COLOR(50, 50, 50, 1) textFont:kSuitFont(16) textAlignmet:NSTextAlignmentCenter];
        numLab.text = [NSString stringWithFormat:@"数量：%@",restNum];
        [numBackView addSubview:numLab];
        [numLab makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(numBackView);
        }];
        
    }
    return self;
}

-(void)tapAction:(id)sender
{
    NSLog(@"点击了");
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        NSDictionary *dic = @{@"image":_iconImg,@"title":_titleStr};
        [_delegate uiView:nil collectEventsType:@"选取种类" params:dic];
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
