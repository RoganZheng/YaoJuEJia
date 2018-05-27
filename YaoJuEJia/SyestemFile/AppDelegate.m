//
//  AppDelegate.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "YJEJ_LoginViewController.h"
#import "YJEJ_TabBarViewController.h"
#import "BaseNavigationViewController.h"

@interface AppDelegate ()

@property (nonatomic ,strong)YJEJ_TabBarViewController *tabbar;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"4V5xZtCb2FWkFso7iFr6tg9Xyuw7wrRa" generalDelegate:nil];
    if (!ret) {
        NSLog(@"百度地图初始化失败");
    }
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.shouldShowToolbarPlaceholder = YES;
    manager.toolbarDoneBarButtonItemText = @"完成";
    
    [self customNaviBar];
    //通过通知来实现切换用户状态改变与rootVC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStateChange:) name:KNOTIFICATION_LOGINCHANGE object:nil];
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds] ];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
    
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

-(void)customNaviBar
{
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kWhiteColor,                                                                                                            NSFontAttributeName:kSuitFont(18.f)}];
    
    [[UINavigationBar appearance] setBarTintColor:NAVIGATIONBARCOLOR];
    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
}

- (YJEJ_TabBarViewController *)tabbar
{
    if (!_tabbar) {
        _tabbar = [[YJEJ_TabBarViewController alloc]init];
    }
    return _tabbar;
}

- (void)loginStateChange:(NSNotification *)notification
{
    _nav = nil;
    if ([[notification object] boolValue]) {
        self.window.rootViewController = self.tabbar;
        self.tabbar.selectedIndex = 0;
        BaseNavigationViewController *nav = (BaseNavigationViewController *)self.tabbar.selectedViewController;
        nav.navigationBarHidden = NO;
        if (nav.viewControllers.count > 1) {
            [nav popToRootViewControllerAnimated:NO];
        }
    }else
    {
        _nav = [[BaseNavigationViewController alloc]initWithRootViewController:[[YJEJ_LoginViewController alloc]init] ];
        self.window.rootViewController = _nav;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
