//
//  YJEJ_SelectCityViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/16.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_SelectCityViewController.h"

@interface YJEJ_SelectCityViewController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation YJEJ_SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择城市";
    [super addBackBtn];
    // Do any additional setup after loading the view.
}

-(void)submitAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegate uiView:nil collectEventsType:@"完成选择" params:nil];
        [self.navigationController popViewControllerAnimated:YES];
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
