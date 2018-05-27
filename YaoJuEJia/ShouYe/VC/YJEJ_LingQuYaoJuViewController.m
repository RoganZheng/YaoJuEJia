//
//  YJEJ_LingQuYaoJuViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_LingQuYaoJuViewController.h"
#import "YJEJ_LingQuYaoJuView.h"
#import "YJEJ_DingdanBottomView.h"
#import "YJEJ_EditAddressViewController.h"

@interface YJEJ_LingQuYaoJuViewController ()<UIViewCollectEventsDelegate>

@property (nonatomic ,strong)YJEJ_LingQuYaoJuView *biYunTao;
@property (nonatomic,strong) YJEJ_LingQuYaoJuView *waiYongYao;
@property (nonatomic,strong) YJEJ_LingQuYaoJuView *kouFuYao;
@property (nonatomic,strong) YJEJ_DingdanBottomView *bottomView;

@end

@implementation YJEJ_LingQuYaoJuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super addBackBtn];
    self.title = @"请选择药具类型";
    [self layoutView];
    // Do any additional setup after loading the view.
}

-(void) layoutView
{
    
    self.view.backgroundColor = COLOR(220, 220, 220, 1);
    
    _bottomView = [[YJEJ_DingdanBottomView alloc]init];
    _bottomView.delegate = self;
    [self.view addSubview:_bottomView];
    [_bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(60);
    }];
    
    _biYunTao = [[YJEJ_LingQuYaoJuView alloc]initWithTitle:@"避孕套" image:@"dingdan_biyuntao" unitsDescription:@"10只" availableTime:@"有效期：36个月" backgroudColor:COLOR(153, 215, 87, 1)];
    _waiYongYao = [[YJEJ_LingQuYaoJuView alloc]initWithTitle:@"外用避孕药" image:@"dingdan_waiyong" unitsDescription:@"10只" availableTime:@"有效期：36个月" backgroudColor:COLOR(94, 170, 246, 1)];
    _kouFuYao = [[YJEJ_LingQuYaoJuView alloc]initWithTitle:@"口服避孕药" image:@"dingdan_koufu" unitsDescription:@"片" availableTime:@"有效期：36个月" backgroudColor:NAVIGATIONBARCOLOR];
    _biYunTao.delegate = self;
    _waiYongYao.delegate = self;
    _kouFuYao.delegate = self;
    [self.view addSubview:_biYunTao];
    [self.view addSubview:_waiYongYao];
    [self.view addSubview:_kouFuYao];
    
    [_biYunTao makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(SCREEN_HEIGHT/5);
    }];
    [_waiYongYao makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.biYunTao.mas_bottom).offset(1);
        make.height.equalTo(self.biYunTao);
    }];
    [_kouFuYao makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.waiYongYao.mas_bottom).offset(1);
        make.height.equalTo(self.biYunTao);
    }];
    
}

- (void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    NSInteger totalNum = [self.biYunTao currentNum] + [self.waiYongYao currentNum] + [self.kouFuYao currentNum];
    
    if ([type isEqualToString:@"提交订单"]) {
        if (totalNum < 1) {
            [MBProgressHUD showError:@"对不起，领取数量不能为0!" toView:self.view];
            return;
        }
        YJEJ_EditAddressViewController *vc = [[YJEJ_EditAddressViewController alloc]init];
        vc.yaoJuNumber = totalNum;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([type isEqualToString:@"数值改变"]) {
        [_bottomView updateViewWithData:[NSString stringWithFormat:@"%ld",(long)totalNum]];
        return;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
