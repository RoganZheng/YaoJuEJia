//
//  UIViewCollectEventsDelegate.h
//  XiaoBaiXueChe
//
//  Created by wubing on 2017/2/10.
//  Copyright © 2017年 RoganZheng. All rights reserved.
//

#ifndef UIViewCollectEventsDelegate_h
#define UIViewCollectEventsDelegate_h

@protocol UIViewCollectEventsDelegate <NSObject>

@optional

- (void)uiView:(UIView*)uiView collectEventsType:(id)type params:(id)params;

@end

#endif /* UIViewCollectEventsDelegate_h */
