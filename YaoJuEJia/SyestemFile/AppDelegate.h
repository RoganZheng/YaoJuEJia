//
//  AppDelegate.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapView.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic,strong) BMKMapManager *mapManager;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic ,strong) UINavigationController *nav;


@end

