//
//  UITabBar+tabbarBadge.m
//  anjia365_llpx
//
//  Created by Ace on 2017/5/16.
//  Copyright © 2017年 imohoo. All rights reserved.
//

#import "UITabBar+tabbarBadge.h"

#define TabbarItemNums 4    //tabbar数量

@implementation UITabBar (tabbarBadge)

-(void)showBadgeOnItemIndex:(NSInteger)index
{
    [self removeBadgeOnItemIndex:index];
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 111 + index;
    badgeView.layer.cornerRadius = 5;
    badgeView.layer.masksToBounds = YES;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;
    
    float percentX = (index + 0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);
    [self addSubview:badgeView];
}

-(void)hideBadgeOnItemIndex:(NSInteger)index
{
    [self removeBadgeOnItemIndex:index];
}

-(void)removeBadgeOnItemIndex:(NSInteger)index
{
    for (UIView *subView in self.subviews) {
        if (subView.tag == 111+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
