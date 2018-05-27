//
//  YJEJ_RecordDetailViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_RecordDetailViewController.h"
#import "YJEJ_OrderDetailTableViewCell.h"

@interface YJEJ_RecordDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UITableView *listTable;
@property (nonatomic,strong) NSArray *detailAry;

@end

@implementation YJEJ_RecordDetailViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        _detailAry = @[@"调度配载",@"订单编号",@"日期"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单物流";
    [super addBackBtn];
    [self layoutView];
    // Do any additional setup after loading the view.
}

-(void) layoutView
{
    self.view.backgroundColor = COLOR(220, 220, 220, 1);
    _listTable = [[UITableView alloc]init];
    _listTable.delegate = self;
    _listTable.dataSource = self;
    _listTable.scrollEnabled = NO;
    _listTable.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_listTable];
    [_listTable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(150 + paddingHeigh *3);
    }];
    YJEJ_BaseLable *wuliuLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:COLOR(70, 70, 70, 1) textFont:kSuitFont(17) textAlignmet:NSTextAlignmentLeft];
    [self.view addSubview:wuliuLab];
    wuliuLab.text = @"物流信息：";
    [wuliuLab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.listTable.mas_bottom).offset(paddingHeigh);
        make.left.equalTo(self.view).offset(paddingWidth);
        make.width.equalTo(SCREEN_WIDTH/2);
        make.height.equalTo(40);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *rid=@"detailCell";
    
    YJEJ_OrderDetailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell==nil){
        
        cell= (YJEJ_OrderDetailTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"YJEJ_OrderDetailTableViewCell" owner:self options:nil]  lastObject];
    }
    cell.titleLab.text = [_detailAry objectAtIndex:indexPath.section];
    switch (indexPath.section) {
        case 0:
        {
            cell.detailLab.text = _model.diaodupeizai;
        }
            break;
            
        case 1:
        {
            cell.detailLab.text = _model.orderId;
        }
            break;
        case 2:
        {
            cell.detailLab.text = _model.date;
        }
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, paddingHeigh)];
    
    backView.backgroundColor = COLOR(220, 220, 220, 1);
    return backView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return paddingHeigh;
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
