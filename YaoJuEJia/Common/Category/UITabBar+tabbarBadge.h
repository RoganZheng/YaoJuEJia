//
//  UITabBar+tabbarBadge.h
//  anjia365_llpx
//
//  Created by Ace on 2017/5/16.
//  Copyright © 2017年 imohoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (tabbarBadge)

-(void)showBadgeOnItemIndex:(NSInteger)index; //显示红点

-(void)hideBadgeOnItemIndex:(NSInteger)index; //隐藏红点

@end
