//
//  YJEJ_ShouyeTableView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/10.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_ShouyeTableView.h"
#import "YJEJ_ShouyeTableViewCell.h"

@interface YJEJ_ShouyeTableView ()<UITableViewDelegate, UITableViewDataSource, UIViewCollectEventsDelegate>

@property (nonatomic,copy) NSArray *imageAry;
@property (nonatomic,copy) NSArray *titleAry;

@end

@implementation YJEJ_ShouyeTableView

#pragma mark - UITableViewDataSource

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.imageAry = @[@"shouye_image1",@"shouye_image2",@"shouye_image3",@"shouye_image4",@"shouye_image5"];
        self.titleAry = @[@"药具知识",@"避孕知识",@"避孕节育",@"生殖健康",@"自测服务"];
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc]init];
        self.backgroundColor = COLOR(220, 220, 220, 1);
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
            
        case 1:
            return 2;
            break;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *rid=@"shouyeCell";
    
    YJEJ_ShouyeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell==nil){
        
        cell=[[YJEJ_ShouyeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:rid];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    switch (indexPath.section) {
        case 0:
        {
            [cell updateViewWithImage:[self.imageAry objectAtIndex:indexPath.row] title:[self.titleAry objectAtIndex:indexPath.row] isShowArrow:YES];
        }
            break;
            
        case 1:
        {
           [cell updateViewWithImage:[self.imageAry objectAtIndex:indexPath.row+3] title:[self.titleAry objectAtIndex:indexPath.row+3] isShowArrow:YES];
        }
            break;
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_delegates && [_delegates respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        NSString *typeStr;
        switch (indexPath.section) {
            case 0:
            {
                if (indexPath.row == 0) {
                    typeStr = @"药具知识";
                }
                if (indexPath.row == 1) {
                    typeStr = @"避孕知识";
                }
                if (indexPath.row == 2) {
                    typeStr = @"避孕节育";
                }
            }
                break;
                
            case 1:
            {
                if (indexPath.row == 0) {
                    typeStr = @"生殖健康";
                }
                if (indexPath.row == 1) {
                    typeStr = @"自测服务";
                }
            }
                break;
        }
        [_delegates uiView:nil collectEventsType:typeStr params:nil];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    return backView;
    
}

@end
