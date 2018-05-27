//
//  YJEJ_EditAddressView.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/16.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseView.h"

typedef enum : NSUInteger {
    EditType_singleLine,
    EditType_doubleLine,
} EditType;

@interface YJEJ_EditAddressView : BaseView

-(instancetype)initWithTitle:(NSString *)titleStr placeHolder:(NSString *)placeStr editType:(EditType)type;

@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegate;

-(id)submitImformation;

-(void)updateViewWithData:(id)data;

@end
