//
//  YJEJ_EditAddressView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/16.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_EditAddressView.h"

@interface YJEJ_EditAddressView ()<UITextFieldDelegate>

@property (nonatomic,strong) YJEJ_BaseLable *selectCityLab;
@property (nonatomic,assign) EditType types;
@property (nonatomic,strong) UITextField *inputText;

@end
@implementation YJEJ_EditAddressView

-(instancetype)initWithTitle:(NSString *)titleStr placeHolder:(NSString *)placeStr editType:(EditType)type
{
    self = [super init];
    if (self) {
        _types = type;
        self.backgroundColor = kWhiteColor;
        YJEJ_BaseLable *titleLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:COLOR(150, 150, 150, 1) textFont:kSuitFont(15) textAlignmet:NSTextAlignmentLeft];
        titleLab.text = titleStr;
        [self addSubview:titleLab];
        
        _inputText = [[UITextField alloc]init];
        _inputText.adjustsFontSizeToFitWidth = YES;
        _inputText.placeholder = placeStr;
        _inputText.font = kSuitFont(18);
        _inputText.textColor = COLOR(100, 100, 100, 1);
        [self addSubview:_inputText];
        
        switch (type) {
            case EditType_doubleLine:
            {
                _selectCityLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor colorWithHexString:@"#515151"] textFont:_inputText.font textAlignmet:NSTextAlignmentLeft];
                _selectCityLab.text = @"请选择城市";
                _selectCityLab.userInteractionEnabled = YES;
                [self addSubview:_selectCityLab];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
                [_selectCityLab addGestureRecognizer:tap];
                
                UIImageView *arrowImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
                arrowImg.contentMode = UIViewContentModeScaleAspectFit;
                [self addSubview:arrowImg];
                
                UIView *lineView = [[UIView alloc]init];
                lineView.backgroundColor = COLOR(220, 220, 220, 1);
                [self addSubview:lineView];
                
                [titleLab makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.mas_left).offset(paddingWidth);
                    make.centerY.equalTo(self);
                    make.width.equalTo(SCREEN_WIDTH/5);
                    make.height.equalTo(paddingHeigh *2);
                }];
                
                [_selectCityLab makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).offset(paddingHeigh *2);
                    make.left.equalTo(titleLab.mas_right);
                    make.right.equalTo(self.mas_right);
                    make.height.equalTo(35);
                }];
                
                [arrowImg makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.selectCityLab);
                    make.right.equalTo(self.mas_right).offset(-paddingWidth);
                    make.width.equalTo(12);
                    make.height.equalTo(20);
                }];

                [lineView makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(1);
                    make.left.equalTo(titleLab.mas_right);
                    make.right.equalTo(self.mas_right);
                    make.centerY.equalTo(self);
                }];
                
                [_inputText makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(lineView.mas_bottom).offset(paddingHeigh);
                    make.height.equalTo(35);
                    make.left.equalTo(self.selectCityLab.mas_left);
                    make.right.equalTo(self.mas_right);
                }];
            }
                break;
                
            default:
            {
                [titleLab makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.mas_left).offset(paddingWidth);
                    make.top.equalTo(self.mas_top).offset(paddingHeigh *2);
                    make.bottom.equalTo(self.mas_bottom).offset(-paddingHeigh *2);
                    make.width.equalTo(SCREEN_WIDTH/5);
                }];
                [_inputText makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(titleLab.mas_right);
                    make.centerY.equalTo(titleLab);
                    make.right.equalTo(self.mas_right);
                    make.height.equalTo(titleLab);
                }];
            }
                break;
        }
    }
    return self;
}

-(void)tapAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegate uiView:nil collectEventsType:@"选择城市" params:nil];
    }
}

- (id)submitImformation
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    switch (_types) {
        case EditType_doubleLine:
            {
                [dic setObject:_inputText.text forKey:@"text"];
                [dic setObject:_selectCityLab.text forKey:@"address"];
                
            }
            break;
            
        default:
            [dic setObject:_inputText.text forKey:@"text"];
            break;
    }
    return dic;
}

-(void)updateViewWithData:(id)data
{
    switch (_types) {
        case EditType_doubleLine:
        {
            _selectCityLab.text = (NSString *)data;
        }
            break;
            
        default:
            break;
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
