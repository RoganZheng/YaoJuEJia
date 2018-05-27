//
//  YJEJ_HeadTableViewCell.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_HeadTableViewCell.h"

@interface YJEJ_HeadTableViewCell ()

@property (nonatomic,strong) UILabel *userName;    //用户昵称
@property (nonatomic,strong) UILabel *cardId;      //身份证号
@property (nonatomic,strong) UIImageView *headImage;   //头像

@end

@implementation YJEJ_HeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutView];
    }
    return self;
}

-(void) layoutView
{
    _userName = [[UILabel alloc]init];
    _userName.font = kSuitFont(16.f);
    _userName.textColor = COLOR(70, 70, 70, 1);
    [self addSubview:_userName];
    
    _cardId = [[UILabel alloc]init];
    _cardId.font = _userName.font;
    _cardId.textColor = _userName.textColor;
    [self addSubview:_cardId];
    
    _headImage = [[UIImageView alloc]init];
//    _headImage.userInteractionEnabled = YES;
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = 26;
    _headImage.image = [UIImage imageNamed:@"icon"];
    [self addSubview:_headImage];
    
    [_userName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(paddingWidth);
        make.bottom.equalTo(self.mas_centerY).offset(-5);
        make.right.equalTo(self.headImage.mas_left);
        make.height.equalTo(30);
    }];
    
    [_cardId makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userName);
        make.top.equalTo(self.mas_centerY).offset(5);
        make.width.equalTo(SCREEN_WIDTH/3*2);
        make.height.equalTo(30);
    }];
    
    [_headImage makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-paddingWidth);
        make.width.height.equalTo(52);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tipAtcion:)];
    [_headImage addGestureRecognizer:tap];
}

-(void)tipAtcion:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegate uiView:self collectEventsType:@"点击头像" params:nil];
    }
}

- (void)updateViewWithName:(NSString *)userName cardId:(NSString *)cardId image:(NSString *)image
{
    _userName.text = userName;
    _cardId.text = cardId;
    [_headImage sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"icon"]];
//    _headImage.image = [UIImage imageNamed:image];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

@end
