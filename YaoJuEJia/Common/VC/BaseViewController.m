//
//  BaseViewController.m
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/13.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic ,strong) MBProgressHUD *hubView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

    // Do any additional setup after loading the view.
}

- (UIBarButtonItem *)customWithTitle:(NSString *)title target:(nullable id)target action:(nullable SEL)action
{
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:title
                                                           style:UIBarButtonItemStylePlain
                                                          target:target
                                                          action:action];
    [btn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TEXTFONTSIZE15,NSFontAttributeName,COLOR(70, 70, 70, 1), NSForegroundColorAttributeName,nil]forState:UIControlStateNormal];
    [btn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TEXTFONTSIZE15,NSFontAttributeName,COLOR(120, 120, 120, 1),NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    return btn;
}

- (UIBarButtonItem *)customWithImage:(NSString *)image target:(id)target action:(SEL)action
{
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.contentMode = UIViewContentModeLeft;
    //    UIImage* btnBackImage = [MHFileTool imageWithResourcesName:@"test_back@2x.png"];
    [btnBack setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btnBack.frame = CGRectMake(0, 0,50,50);
    btnBack.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    [btnBack addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return leftItem;
}

-(void)addBackBtn
{
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.contentMode = UIViewContentModeLeft;
    //    UIImage* btnBackImage = [MHFileTool imageWithResourcesName:@"test_back@2x.png"];
    [btnBack setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    btnBack.frame = CGRectMake(0, 0,40,40);
    btnBack.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    self.navigationItem.leftBarButtonItem = leftItem;
    [btnBack addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)returnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertInfo:(NSString *)info{
    
    if (info == nil) {
        return;
    }
    
    [MBProgressHUD showError:info toView:self.view];
    
//    WS(weakSelf)
//    _hubView.labelText = info;
//    _hubView.mode = MBProgressHUDModeText;
//    [_hubView show:YES];
//    [self.view bringSubviewToFront:_hubView];
//
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.6 * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        // Do something...
//        [weakSelf.hubView hide:YES];
//    });
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)dealloc
{
    NSLog(@" ----- %@ ----- dealloc!!!",NSStringFromClass([self class]));
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
