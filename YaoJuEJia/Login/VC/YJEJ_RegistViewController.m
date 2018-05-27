//
//  YJEJ_RegistViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_RegistViewController.h"
#import "Regist_View.h"

@interface YJEJ_RegistViewController ()<UIViewCollectEventsDelegate>

@end

@implementation YJEJ_RegistViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户注册";
    [super addBackBtn];
    [self layout];
    // Do any additional setup after loading the view.
}

-(void)layout
{
    Regist_View *view = [Regist_View loadView];
    view.delegate = self;
    [self.view addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    WS(weakSelf)
    if ([type isEqualToString:@"确认注册"]) {
        NSDictionary *dic = (NSDictionary *)params;
        NSLog(@"%@",dic);
        
        if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [self showAlertInfo:@"注册成功"];
            [_delegate uiView:nil collectEventsType:@"注册成功" params:params];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        }
    }
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
