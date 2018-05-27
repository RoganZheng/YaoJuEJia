//
//  BaseTextField.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseTextField.h"

@interface BaseTextField ()<UITextFieldDelegate>

@property (nonatomic,strong) UIButton *secretBtn;

@end

@implementation BaseTextField

-(instancetype)initWithPlaceHolder:(NSString *)placeHolderStr InputType:(UIKeyboardType)inputType isHiddenText:(BOOL)isHidden
{
    self = [super init];
    if (self) {
        [self layoutWithPlaceHolder:placeHolderStr inputType:inputType isHiddenText:isHidden];
    }
    return self;
}

-(void)layoutWithPlaceHolder:(NSString *)holderStr inputType:(UIKeyboardType)inputMode isHiddenText:(BOOL)isHidden
{
    self.mainText = [[UITextField alloc]init];
    self.mainText.font = kSuitFont(15.0);
    self.mainText.placeholder = holderStr;
    self.mainText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.mainText.delegate = self;
    self.mainText.keyboardType = inputMode;
    [self addSubview:self.mainText];
    [self.mainText makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-paddingWidth);
    }];
    if (!isHidden) {
        _secretBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_secretBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_secretBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted | UIControlStateSelected];
        [self addSubview:_secretBtn];
        [_secretBtn makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self.mas_right);
            make.height.width.equalTo(paddingWidth);
        }];
    }
    
}

- (UITextField *)mainText
{
    if ([self.mainText.text isEqualToString:self.mainText.placeholder]) {
        self.mainText.text = @"";
    }
    return self.mainText;
}

- (void)setMainText:(UITextField *)mainText
{
    
}

@end
