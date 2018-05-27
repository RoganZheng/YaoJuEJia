//
//  YJEJ_RecordLingQuViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_RecordLingQuViewController.h"
#import "YJEJ_LingYongListTableView.h"
#import "YJEJ_RecordListObject.h"
#import "YJEJ_RecordDetailViewController.h"

@interface YJEJ_RecordLingQuViewController ()<UIViewCollectEventsDelegate>

@property (nonatomic,strong) YJEJ_LingYongListTableView *listTable;

@end

@implementation YJEJ_RecordLingQuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"领用记录";
    [super addBackBtn];
    [self layoutView];
    // Do any additional setup after loading the view.
}

-(void) layoutView{
    _listTable = [[YJEJ_LingYongListTableView alloc]init];
    _listTable.delegates = self;
    [self.view addSubview:_listTable];
    [_listTable makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    if ([type isEqualToString:@"领用详情"]) {
        YJEJ_RecordListObject *model = (YJEJ_RecordListObject *)params;
        YJEJ_RecordDetailViewController *vc = [[YJEJ_RecordDetailViewController alloc]init];
        vc.model = model;
        [self.navigationController pushViewController:vc animated:YES];
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
