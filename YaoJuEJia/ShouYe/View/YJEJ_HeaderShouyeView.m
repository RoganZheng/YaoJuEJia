//
//  YJEJ_HeaderShouyeView.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_HeaderShouyeView.h"
#import <SDCycleScrollView.h>
#import "YJEJ_ShouYeClickView.h"

@interface YJEJ_HeaderShouyeView ()<SDCycleScrollViewDelegate>

@end

@implementation YJEJ_HeaderShouyeView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutView];
    }
    return self;
}

-(void) layoutView
{
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_WIDTH/7*3) delegate:(id)self placeholderImage:[UIImage imageNamed:@""]];
    scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    scrollView.currentPageDotColor = NAVIGATIONBARCOLOR;
    scrollView.imageURLStringsGroup = @[@"shouye_scroll1",@"shouye_scroll2",@"shouye_scroll3"];
    [self addSubview:scrollView];
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = kWhiteColor;
    backView.frame = CGRectMake(0, BOTTOM(scrollView), WIDTH(scrollView), SCREEN_WIDTH/7*2);
    [self addSubview:backView];
    YJEJ_ShouYeClickView *saoyisao = [[YJEJ_ShouYeClickView alloc]initWithImage:@"shouye_saoyisao" Title:@"扫一扫"];
    YJEJ_ShouYeClickView *onlineLingqu = [[YJEJ_ShouYeClickView alloc]initWithImage:@"shouye_lingqu" Title:@"在线领取"];
    YJEJ_ShouYeClickView  *luntan = [[YJEJ_ShouYeClickView alloc]initWithImage:@"shouye_luntan" Title:@"交流论坛"];
    saoyisao.frame = CGRectMake(0, 0, HEIGHT(backView)-10, HEIGHT(backView)-10);
    onlineLingqu.frame = saoyisao.frame;
    luntan.frame = saoyisao.frame;
    saoyisao.center = CGPointMake(backView.center.x/2-SCREEN_WIDTH/10, backView.center.y);
    onlineLingqu.center = CGPointMake(backView.center.x, backView.center.y);
    luntan.center = CGPointMake(backView.center.x*3/2+SCREEN_WIDTH/10, backView.center.y);
    [self addSubview:saoyisao];
    [self addSubview:onlineLingqu];
    [self addSubview:luntan];
    WS(weakSelf)
    saoyisao.clickBlocks = ^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [weakSelf.delegate uiView:nil collectEventsType:@"扫一扫" params:nil];
        }
    };
    onlineLingqu.clickBlocks = ^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [weakSelf.delegate uiView:nil collectEventsType:@"在线领取" params:nil];
        }
    };
    luntan.clickBlocks = ^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [weakSelf.delegate uiView:nil collectEventsType:@"交流论坛" params:nil];
        }
    };
}


#pragma mark ==========  轮播回调  =========

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{

}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"dianjile");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
