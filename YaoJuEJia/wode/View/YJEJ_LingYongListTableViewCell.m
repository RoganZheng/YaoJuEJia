//
//  YJEJ_LingYongListTableViewCell.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_LingYongListTableViewCell.h"

@interface YJEJ_LingYongListTableViewCell ()

@property (nonatomic ,strong) YJEJ_BaseLable *orderLab;
@property (nonatomic,strong) YJEJ_BaseLable *biyuntaoLab;
@property (nonatomic,strong) YJEJ_BaseLable *waiyongLab;
@property (nonatomic,strong) YJEJ_BaseLable *koufuLab;
@property (nonatomic,strong) YJEJ_BaseLable *dateLab;

@end
@implementation YJEJ_LingYongListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _orderLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor colorWithHexString:@"#414141"] textFont:kSuitFont(17) textAlignmet:NSTextAlignmentLeft];
        _biyuntaoLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:_orderLab.textColor textFont:kSuitFont(15) textAlignmet:NSTextAlignmentLeft];
        _waiyongLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:_biyuntaoLab.textColor textFont:_biyuntaoLab.font textAlignmet:NSTextAlignmentLeft];
        _koufuLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:_biyuntaoLab.textColor textFont:_biyuntaoLab.font textAlignmet:NSTextAlignmentLeft];
        _dateLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:_biyuntaoLab.textColor textFont:_biyuntaoLab.font textAlignmet:NSTextAlignmentLeft];
        [self addSubview:_orderLab];
        [self addSubview:_biyuntaoLab];
        [self addSubview:_waiyongLab];
        [self addSubview:_koufuLab];
        [self addSubview:_dateLab];
        [_orderLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(paddingWidth);
            make.top.equalTo(self.mas_top).offset(paddingHeigh);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(paddingHeigh * 2);
        }];
        [_biyuntaoLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.orderLab.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(paddingHeigh*2);
            make.top.equalTo(self.orderLab.mas_bottom).offset(10);
        }];
        [_waiyongLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.orderLab.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(paddingHeigh*2);
            make.top.equalTo(self.biyuntaoLab.mas_bottom).offset(5);
        }];
        [_koufuLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.orderLab.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(paddingHeigh*2);
            make.top.equalTo(self.waiyongLab.mas_bottom).offset(5);
        }];
        [_dateLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.orderLab.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(paddingHeigh*2);
            make.top.equalTo(self.koufuLab.mas_bottom).offset(10);
        }];
    }
    return self;
}

-(void)updateViewWithData:(id)data
{
    YJEJ_RecordListObject *model = (YJEJ_RecordListObject *)data;
    _orderLab.text = [NSString stringWithFormat:@"订单号：%@",model.orderId];
    _biyuntaoLab.text = [NSString stringWithFormat:@"避孕套：x%@",model.biyuntaoNum];
    _waiyongLab.text = [NSString stringWithFormat:@"外用避孕药：x%@",model.waiyongNum];
    _koufuLab.text = [NSString stringWithFormat:@"口服避孕药：x%@",model.koufuNum];
    _dateLab.text = [NSString stringWithFormat:@"日期：%@",model.date];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

@end
