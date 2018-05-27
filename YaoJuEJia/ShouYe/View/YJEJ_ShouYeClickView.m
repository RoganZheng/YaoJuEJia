//
//  YJEJ_ShouYeClickView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_ShouYeClickView.h"

@implementation YJEJ_ShouYeClickView

-(instancetype)initWithImage:(NSString *)image Title:(NSString *)title
{
    self = [super init];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
        UIImageView *images = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
        images.layer.masksToBounds = YES;
        images.layer.cornerRadius = 3;
        [self addSubview:images];
        [images makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-paddingHeigh);
            make.height.width.equalTo(50);
        }];
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.text = title;
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = [UIColor colorWithHexString:@"#515151"];
        titleLab.font = kSuitFont(16.f);
        [self addSubview:titleLab];
        [titleLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(images.mas_bottom).offset(5);
            make.centerX.equalTo(images);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(30);
        }];
    }
    return self;
}

-(void)tapAction:(id)sender
{
    if (self.clickBlocks) {
        self.clickBlocks();
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
