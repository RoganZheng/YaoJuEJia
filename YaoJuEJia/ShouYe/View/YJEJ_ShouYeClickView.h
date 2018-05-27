//
//  YJEJ_ShouYeClickView.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseView.h"

typedef void (^clickBlock)(void);

@interface YJEJ_ShouYeClickView : BaseView

-(instancetype)initWithImage:(NSString *)image Title:(NSString *)title;

@property (nonatomic,copy) clickBlock clickBlocks;


@end
