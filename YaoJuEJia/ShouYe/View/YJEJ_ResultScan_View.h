//
//  YJEJ_ResultScan_View.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/18.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseView.h"

@interface YJEJ_ResultScan_View : BaseView

-(instancetype)initWithTitle:(NSString *)titleStr image:(NSString *)imageStr restNum:(NSString *)restNum;

@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegate;

@end
