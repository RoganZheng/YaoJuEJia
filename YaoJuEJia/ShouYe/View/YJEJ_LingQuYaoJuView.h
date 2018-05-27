//
//  YJEJ_LingQuYaoJuView.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseView.h"
#import "YJEJ_numberObject.h"

@interface YJEJ_LingQuYaoJuView : BaseView

-(instancetype)initWithTitle:(NSString *)title image:(NSString *)image unitsDescription:(NSString *)units availableTime:(NSString *)availNum backgroudColor:(UIColor *)backColor;

-(NSInteger)currentNum;

@property (nonatomic,strong) YJEJ_numberObject *kvoObj;
@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegate;

@end
