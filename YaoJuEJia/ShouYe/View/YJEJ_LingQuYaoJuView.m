//
//  YJEJ_LingQuYaoJuView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_LingQuYaoJuView.h"

@interface YJEJ_LingQuYaoJuView ()

@property (nonatomic ,strong) YJEJ_BaseLable *numLab;

@end

@implementation YJEJ_LingQuYaoJuView

-(instancetype)initWithTitle:(NSString *)title image:(NSString *)image unitsDescription:(NSString *)units availableTime:(NSString *)availNum backgroudColor:(UIColor *)backColor
{
    self = [super init];
    if (self) {
        self.kvoObj = [[YJEJ_numberObject alloc]init];
        self.backgroundColor = kWhiteColor;
        UIView *imageViewBack = [[UIView alloc]init];
        imageViewBack.backgroundColor = backColor;
        imageViewBack.layer.masksToBounds = YES;
        imageViewBack.layer.cornerRadius = 5;
        [self addSubview:imageViewBack];
        
        UILabel *imageView_title = [[UILabel alloc]init];
        imageView_title.text = title;
        imageView_title.textAlignment = NSTextAlignmentCenter;
        imageView_title.textColor = kWhiteColor;
        imageView_title.font = kSuitFont(12);
        [self addSubview:imageView_title];
        
        
        UIImageView *iconImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
        iconImg.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:iconImg];
        
        [imageViewBack makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(paddingWidth);
            make.top.equalTo(self.mas_top).offset(paddingHeigh);
            make.bottom.equalTo(self.mas_bottom).offset(-paddingHeigh);
            make.width.equalTo(SCREEN_WIDTH/5);
        }];
        
        [imageView_title makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(imageViewBack);
            make.bottom.equalTo(self.mas_centerY).offset(-10);
            make.height.equalTo(15);
            make.width.equalTo(self);
        }];
        
        [iconImg makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(imageViewBack);
            make.top.equalTo(self.mas_centerY).offset(10);
            make.width.height.equalTo(30);
        }];
        
        YJEJ_BaseLable *mainTitle = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor colorWithHexString:@"#515151"] textFont:kSuitFont(17) textAlignmet:NSTextAlignmentLeft];
        mainTitle.text = title;
        [self addSubview:mainTitle];
        YJEJ_BaseLable *unitNumLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor colorWithHexString:@"#515151"] textFont:kSuitFont(15) textAlignmet:NSTextAlignmentLeft];
        unitNumLab.text = units;
        [self addSubview:unitNumLab];
        YJEJ_BaseLable *availTimeLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor colorWithHexString:@"#515151"] textFont:unitNumLab.font textAlignmet:NSTextAlignmentLeft];
        availTimeLab.text = availNum;
        [self addSubview:availTimeLab];
        
        [unitNumLab makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(imageViewBack.mas_right).offset(10);
            make.height.equalTo(20);
            make.width.equalTo(SCREEN_WIDTH/3);
        }];
        [mainTitle makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(unitNumLab.mas_top).offset(-paddingHeigh);
            make.left.equalTo(unitNumLab.mas_left);
            make.height.equalTo(unitNumLab);
            make.width.equalTo(unitNumLab);
        }];
        [availTimeLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(unitNumLab.mas_bottom).offset(paddingHeigh);
            make.left.equalTo(unitNumLab.mas_left);
            make.width.equalTo(unitNumLab);
            make.height.equalTo(unitNumLab);
        }];
        
        UIImageView *addBtnView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dingdan_jiahao"]];
        addBtnView.userInteractionEnabled = YES;
        [self addSubview:addBtnView];
        
        UITapGestureRecognizer *addTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addAction:)];
        [addBtnView addGestureRecognizer:addTap];
        
        UIImageView *reduceBtnView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dingdan_jianhao"]];
        reduceBtnView.userInteractionEnabled = YES;
        [self addSubview:reduceBtnView];
        
        UITapGestureRecognizer *reduceTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reduceAction:)];
        [reduceBtnView addGestureRecognizer:reduceTap];
        
        
        _numLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor darkGrayColor] textFont:kSuitFont(18) textAlignmet:NSTextAlignmentCenter];
        _numLab.backgroundColor = COLOR(230, 230, 230, 1);
        _numLab.layer.masksToBounds = YES;
        _numLab.layer.cornerRadius = 3;
        _numLab.layer.borderWidth = 1;
        _numLab.layer.borderColor = [UIColor colorWithHexString:@"#515151"].CGColor;
        _numLab.text = @"0";
        [self addSubview:_numLab];
        
        UIView *btnBackView = [[UIView alloc]init];
        btnBackView.layer.masksToBounds = YES;
        btnBackView.layer.cornerRadius = 5;
        btnBackView.layer.borderColor = [UIColor colorWithHexString:@"#515151"].CGColor;
        btnBackView.layer.borderWidth = 1;
        [self addSubview:btnBackView];
        
        [addBtnView makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-paddingWidth);
            make.centerY.equalTo(availTimeLab);
            make.width.height.equalTo(33);
        }];
        [_numLab makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(addBtnView);
            make.width.equalTo(50);
            make.height.equalTo(30);
            make.right.equalTo(addBtnView.mas_left).offset(-2);
        }];
        [reduceBtnView makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numLab.mas_left).offset(-2);
            make.centerY.equalTo(addBtnView);
            make.width.height.equalTo(addBtnView);
        }];
        
        //使用KVO监听数值变化，并更新至lable中
        [self.kvoObj addObserver:self forKeyPath:@"num" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"num"] && object == self.kvoObj) {
        _numLab.text = [NSString stringWithFormat:@"%@",[change valueForKey:@"new"]];
        if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [_delegate uiView:nil collectEventsType:@"数值改变" params:nil];
        }
        NSLog(@"old = %@ ; new = %@", [change valueForKey:@"old"], [change valueForKey:@"new"]);
    }
}

-(void)addAction:(id)sender
{
    self.kvoObj.num++;
}

-(void)reduceAction:(id)sender
{
    self.kvoObj.num > 0 ? self.kvoObj.num-- : self.kvoObj.num;
}

- (NSInteger)currentNum
{
    return self.kvoObj.num;
}

-(void)dealloc
{
    [self.kvoObj removeObserver:self forKeyPath:@"num"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
