//
//  YJEJ_LingYongListTableView.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJEJ_LingYongListTableViewCell.h"

@interface YJEJ_LingYongListTableView : UITableView

-(void)refreshTableViewWithData:(id)data;

@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegates;

@end
