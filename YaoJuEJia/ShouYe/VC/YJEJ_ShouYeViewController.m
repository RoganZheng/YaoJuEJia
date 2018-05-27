//
//  YJEJ_ShouYeViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_ShouYeViewController.h"
#import <SDCycleScrollView.h>
#import "YJEJ_HeaderShouyeView.h"
#import "YJEJ_ShouyeTableView.h"
#import "YJEJ_SaoyisaoViewController.h"
#import "YJEJ_ResultScan_ViewController.h"
#import "YJEJ_LingQuYaoJuViewController.h"
#import "YJEJ_KnowledgeListViewController.h"

@interface YJEJ_ShouYeViewController ()<UIViewCollectEventsDelegate>

@end

@implementation YJEJ_ShouYeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    [self layoutView];
    // Do any additional setup after loading the view.
}

-(void) layoutView
{
    YJEJ_HeaderShouyeView *headerView = [[YJEJ_HeaderShouyeView alloc]init];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/7*5);
    headerView.delegate = self;
    
    YJEJ_ShouyeTableView *tableList = [[YJEJ_ShouyeTableView alloc]init];
    tableList.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49.f - 64.f);
    tableList.delegates = self;
    [self.view addSubview:tableList];
    tableList.tableHeaderView = headerView;
}

-(void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    NSLog(@"%@",type);
    if ([type isEqualToString:@"扫一扫"]) {
        YJEJ_ResultScan_ViewController *vc = [[YJEJ_ResultScan_ViewController alloc]init];
//        YJEJ_SaoyisaoViewController *vc = [[YJEJ_SaoyisaoViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([type isEqualToString:@"在线领取"]) {
        YJEJ_LingQuYaoJuViewController  *vc = [[YJEJ_LingQuYaoJuViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([type isEqualToString:@"交流论坛"]) {
        [MBProgressHUD showError:@"功能暂未开放" toView:self.view];
        return;
    }
    if ([type isEqualToString:@"药具知识"]) {
        [self PushToVCWithTitle:@"药具知识"];
    }
    if ([type isEqualToString:@"避孕知识"]) {
        [self PushToVCWithTitle:@"避孕知识"];
    }
    if ([type isEqualToString:@"避孕节育"]) {
        [self PushToVCWithTitle:@"避孕节育"];
    }
    if ([type isEqualToString:@"生殖健康"]) {
        [self PushToVCWithTitle:@"生殖健康"];
    }
    if ([type isEqualToString:@"自测服务"]) {
        [self PushToVCWithTitle:@"自测服务"];
    }
}

-(void)PushToVCWithTitle:(NSString *)title
{
    YJEJ_KnowledgeListViewController *vc = [[YJEJ_KnowledgeListViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.navBarTitle = title;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
