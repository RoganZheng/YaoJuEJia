//
//  YJEJ_WodeTableView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_WodeTableView.h"
#import "YJEJ_HeadTableViewCell.h"
#import "YJEJ_ShouyeTableViewCell.h"

@interface YJEJ_WodeTableView ()<UITableViewDelegate, UITableViewDataSource, UIViewCollectEventsDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,copy) NSArray *titleAry;
@property (nonatomic,copy) NSArray *imageAry;

@end

@implementation YJEJ_WodeTableView

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.imageAry = @[@"wode_image1",@"wode_image2",@"wode_image3",@"wode_image4"];
        NSString *version = [NSString stringWithFormat:@"当前版本号：%@",[[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleShortVersionString"]];
        self.titleAry = @[@"在线领取订单记录",@"关于药具e家",version,@"退出登录"];
        self.delegate = self;
        self.dataSource = self;
        self.tableHeaderView = [[UIView alloc]init];
        self.backgroundColor = COLOR(220, 220, 220, 1);
    }
    return self;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
        default:
            return 1;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            static NSString *rid=@"firstCell";
            
            YJEJ_HeadTableViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:rid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if(cell==nil){
                
                cell=[[YJEJ_HeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:rid];
            }
            cell.delegate = self;
            NSDictionary *userDic = [SqliteDataTool calculateAndGetUserData];
            NSString *userName = [NSString stringWithFormat:@"用户昵称：%@",[userDic objectForKey:kUserName] ];
            NSString *cardId = [NSString stringWithFormat:@"身份证号：%@",[userDic objectForKey:kCardId]];
            [cell updateViewWithName:userName cardId:cardId image:@"icon"];
            
            return cell;
        }
            break;
            
        default:
        {
            static NSString *rid=@"otherCell";
            
            YJEJ_ShouyeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
            
            if(cell==nil){
                
                cell=[[YJEJ_ShouyeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:rid];
                
            }
            switch (indexPath.section) {
                case 1:
                {
                    BOOL isShow;
                    if (indexPath.row == 0 || indexPath.row == 1) {
                        isShow = YES;
                    }else
                    {
                        isShow = NO;
                    }
                    [cell updateViewWithImage:[self.imageAry objectAtIndex:indexPath.row] title:[self.titleAry objectAtIndex:indexPath.row] isShowArrow:isShow];
                }

                    break;
                    
                case 2:
                {
                    [cell updateViewWithImage:[self.imageAry objectAtIndex:indexPath.row+3] title:[self.titleAry objectAtIndex:indexPath.row+3] isShowArrow:NO];
                }
                    break;
            }
            
            return cell;
        }
            break;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_delegates || ![_delegates respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
        return;
    }
    switch (indexPath.section) {
        case 1:
        {
            if (indexPath.row == 0) {
                [_delegates uiView:self collectEventsType:@"在线领取订单记录" params:nil];
            }
            if (indexPath.row == 1) {
                [_delegates uiView:self collectEventsType:@"关于药具e家" params:nil];
            }
        }
            break;
            
        case 2:
        {
            [_delegates uiView:self collectEventsType:@"退出登录" params:nil];
        }
            break;
    }
}

-(void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    if ([type isEqualToString:@"点击头像"]) {
        if (_delegates && [_delegates respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [_delegates uiView:self collectEventsType:@"点击头像" params:nil];
        }
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 100;
            break;
            
        default:
            return kNavigationHeight;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 6)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
