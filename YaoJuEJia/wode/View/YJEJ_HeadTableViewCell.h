//
//  YJEJ_HeadTableViewCell.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJEJ_HeadTableViewCell : UITableViewCell

@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegate;

-(void)updateViewWithName:(NSString *)userName cardId:(NSString *)cardId image:(NSString *)image;

@end
