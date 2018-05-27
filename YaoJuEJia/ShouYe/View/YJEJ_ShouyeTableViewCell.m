//
//  YJEJ_ShouyeTableViewCell.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/10.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_ShouyeTableViewCell.h"

@interface YJEJ_ShouyeTableViewCell ()

@property (nonatomic ,strong)UIImageView *showImage;
@property (nonatomic,strong) UILabel *showTitle;
@property (nonatomic,strong) UIImageView *rightArrow;

@end

@implementation YJEJ_ShouyeTableViewCell

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
    _showImage = [[UIImageView alloc]init];
    _showImage.image = [UIImage imageNamed:@"shouye_image1"];
    [self addSubview:_showImage];
    [_showImage makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(paddingWidth);
        make.height.width.equalTo(40);
    }];
    
    _rightArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    [self addSubview:_rightArrow];
    [_rightArrow makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-paddingWidth*2);
        make.height.equalTo(20);
        make.width.equalTo(12);
    }];
    
    _showTitle = [[UILabel alloc]init];
    _showTitle.text = @"";
    _showTitle.font = kSuitFont(16.f);
    _showTitle.textColor = [UIColor colorWithHexString:@"#515151"];
    [self addSubview:_showTitle];
    [_showTitle makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.showImage.mas_right).offset(paddingWidth);
        make.right.equalTo(self.rightArrow.mas_left).offset(-paddingWidth);
        make.height.equalTo(40);
    }];
}

- (void)updateViewWithImage:(NSString *)imageStr title:(NSString *)title isShowArrow:(BOOL)isShow
{
    _showImage.image = [UIImage imageNamed:imageStr];
    _showTitle.text = title;
    _rightArrow.hidden = !isShow ? YES : NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

@end
