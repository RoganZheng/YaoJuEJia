//
//  YJEJ_SaoyisaoViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_SaoyisaoViewController.h"
#import "YJEJ_ResultScan_ViewController.h"

@interface YJEJ_SaoyisaoViewController ()

@end

@implementation YJEJ_SaoyisaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"扫一扫";
    [self.navigationController.navigationBar
     setTitleTextAttributes:
     @{NSFontAttributeName : TEXTFONTSIZE18,
       NSForegroundColorAttributeName : kWhiteColor}];
    [self addBackBtn];
    
    //创建参数对象
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    
    //矩形区域中心上移，默认中心点为屏幕中心点
    style.centerUpOffset = 44;
    
    //扫码框周围4个角的类型,设置为外挂式
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    
    //扫码框周围4个角绘制的线条宽度
    style.photoframeLineW = 6;
    
    //扫码框周围4个角的宽度
    style.photoframeAngleW = 24;
    
    //扫码框周围4个角的高度
    style.photoframeAngleH = 24;
    
    //扫码框内 动画类型 --线条上下移动
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    
    //线条上下移动图片
    style.animationImage = [UIImage imageNamed:@"zhongjian"];
    
    self.style = style;
    
    YJEJ_BaseLable *tips = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor redColor] textFont:kSuitFont(18.) textAlignmet:NSTextAlignmentCenter];
    tips.text = @"请扫描自助发放机上的二维码领取";
    tips.frame = CGRectMake(0, SCREEN_HEIGHT - kNavigationHeight - 100, SCREEN_WIDTH, 50);
    [self.view addSubview:tips];
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
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)scanResultWithArray:(NSArray<LBXScanResult *> *)array
{
    if (array.count < 1) {
        [self popAlertMsgWithScanResult:nil];
        return;
    }
    for (LBXScanResult *result in array) {
        NSLog(@"result：%@", result.strScanned);
        YJEJ_ResultScan_ViewController *vc = [[YJEJ_ResultScan_ViewController alloc]init];
        vc.resultStr = result.strScanned;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (void)popAlertMsgWithScanResult:(NSString *)strResult
{
    if (!strResult)
    {
        strResult = @"识别失败";
    }
    
    WS(weakSelf)
    [weakSelf reStartDevice];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
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
