//
//  YJEJ_LingYongListTableView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_LingYongListTableView.h"
#import "YJEJ_RecordListObject.h"

@interface YJEJ_LingYongListTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataAry;

@end

@implementation YJEJ_LingYongListTableView

-(instancetype)init
{
    self = [super init];
    if (self) {
        _dataAry = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            YJEJ_RecordListObject *model = [[YJEJ_RecordListObject alloc]init];
            model.date = [MHCommonTool getYYYYMMddHHmmssWithString:[NSString stringWithFormat:@"%ld",(long)[MHCommonTool getTimeStamp]]];
            model.orderId = @"1234567890";
            model.biyuntaoNum = [NSString stringWithFormat:@"%d",i];
            model.waiyongNum = [NSString stringWithFormat:@"%d",i+1];
            model.koufuNum = [NSString stringWithFormat:@"%d", i+2];
            [_dataAry addObject:model];
        }
        self.delegate = self;
        self.dataSource = self;
        self.tableHeaderView = [[UIView alloc]init];
        self.tableFooterView = [[UIView alloc]init];
        self.backgroundColor = COLOR(220, 220, 220, 1);
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *rid=@"lingyongCell";
    
    YJEJ_LingYongListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell==nil){
        
        cell=[[YJEJ_LingYongListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:rid];
        
    }
    [cell updateViewWithData:[_dataAry objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegates && [_delegates respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        [_delegates uiView:nil collectEventsType:@"领用详情" params:[_dataAry objectAtIndex:indexPath.row]];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return paddingHeigh * 12 + 30;
}

- (void)refreshTableViewWithData:(id)data
{
    [_dataAry removeAllObjects];
    [_dataAry addObjectsFromArray:(NSArray *)data];
    [self reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
