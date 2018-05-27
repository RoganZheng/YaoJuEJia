//
//  YJEJ_DingdanBottomView.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseView.h"

@interface YJEJ_DingdanBottomView : BaseView

@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegate;

-(void)updateViewWithData:(id)data;

@end
