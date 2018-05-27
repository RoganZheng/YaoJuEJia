//
//  YJEJ_TabBarViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_TabBarViewController.h"
#import "YJEJ_ShouYeViewController.h"
#import "YJEJ_DaoHangViewController.h"
#import "YJEJ_WoDeViewController.h"
#import "BaseNavigationViewController.h"

@interface YJEJ_TabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation YJEJ_TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.delegate = self;
    [self addChildViewControllers];
    [self addLines];
    // Do any additional setup after loading the view.
}

/**
 items间的线
 */
-(void)addLines{
    
    int childCount = (int)self.childViewControllers.count;
    CGFloat itemWith = (SCREEN_WIDTH - 4.f * childCount) * 1.0/childCount;
    for (int i = 1; i < childCount; i ++) {
        UIView * lineView = [[UIView alloc]init];
        lineView.backgroundColor = COLOR(189, 189, 189, 1);
        lineView.frame  = CGRectMake((4.f + itemWith) * i, 0.f, 0.5f, 49.f/3.0);
        lineView.center = CGPointMake(lineView.center.x, 49.f/2.0);
        [self.tabBar addSubview:lineView];
    }
}

-(void)addChildViewControllers
{
    [self addChildViewController:[[YJEJ_ShouYeViewController alloc]init] title:@"首页" imageName:@"tabbar_unselect_shouye" selectImageName:@"tabbar_select_shouye"];
    [self addChildViewController:[[YJEJ_DaoHangViewController alloc]init] title:@"导航" imageName:@"tabbar_unselect_daohang" selectImageName:@"tabbar_select_daohang"];
    [self addChildViewController:[[YJEJ_WoDeViewController alloc]init] title:@"我的" imageName:@"tabbar_unselect_wode" selectImageName:@"tabbar_select_wode"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selImageName
{
    // 设置标题
    childController.tabBarItem.title = title;
    
    // 通过 AttributeText 设置字体属性
    // 设置字体颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F07BA6"]} forState:UIControlStateSelected];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#515151"]} forState:UIControlStateNormal];
    // 设置字体大小
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: kSuitFont(12.5)} forState:UIControlStateNormal];
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
