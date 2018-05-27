//
//  BaseNavigationViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self popPanGesture];
    // Do any additional setup after loading the view.
}

// pop的全屏手势
-(void)popPanGesture{
    
    // 创建一个全屏手势覆盖系统的方法
    UIPanGestureRecognizer *popPanGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    // 控制手势的触发,在代理方法中实现
    popPanGesture.delegate = self;
    
    // 把手势添加到self.view
    [self.view addGestureRecognizer:popPanGesture];
    
    // 关掉系统的边缘返回手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

-(void)handleNavigationTransition:(id)sender
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count != 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    
    UIViewController* topVC = self.topViewController;
    
    return [topVC preferredStatusBarStyle];
    
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
