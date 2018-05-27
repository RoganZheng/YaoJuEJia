//
//  YJEJ_ResultScan_ViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/17.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_ResultScan_ViewController.h"
#import "YJEJ_ResultScan_View.h"
#import "CustomIOSAlertView.h"

@interface YJEJ_ResultScan_ViewController ()<UIViewCollectEventsDelegate,CustomIOSAlertViewDelegate>

@end

@implementation YJEJ_ResultScan_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"药具领取";
    [super addBackBtn];
    [self layoutView];
    // Do any additional setup after loading the view.
}

-(void) layoutView
{
    self.view.backgroundColor = COLOR(230, 230, 230, 1);
    NSArray *titleAry = @[@"口服避孕药",@"外用避孕胶冻",@"外用避孕药",@"避孕套"];
    NSArray *imgAry = @[@"scan_result_1",@"scan_result_2",@"scan_result_3",@"scan_result_4"];
    UIView *preV;
    for (int i = 0; i<4; i++) {
        
        YJEJ_ResultScan_View *cellView = [[YJEJ_ResultScan_View alloc]initWithTitle:titleAry[i] image:imgAry[i] restNum:@"1"];
        cellView.delegate = self;
        [self.view addSubview:cellView];
        
        if (preV) {
            if (i % 2 == 0) {
                [cellView makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(preV.mas_bottom).offset(paddingHeigh);
                    make.left.equalTo(self.view.mas_left).offset(paddingWidth);
                    make.width.height.equalTo(preV);
                }];

            }else
            {
                [cellView makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(preV.mas_right).offset(paddingWidth);
                    make.top.equalTo(preV.mas_top);
                    make.width.equalTo(preV);
                    make.height.equalTo(preV);
                }];
            }
        }else
        {
            [cellView makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view).offset(paddingWidth);
                make.top.equalTo(self.view).offset(paddingWidth);
                make.width.equalTo(SCREEN_WIDTH/2 - paddingWidth*3/2);
                make.height.equalTo(SCREEN_HEIGHT/5 + 20);
            }];
        }
        preV = cellView;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    if ([type isEqualToString:@"选取种类"]) {
        NSDictionary *dic = (NSDictionary *)params;
        NSLog(@"%@",dic);
        CustomIOSAlertView *alert = [[CustomIOSAlertView alloc]init];
        [alert setContainerView:[self createCustomAlertViewWithImage:[dic objectForKey:@"image"] title:[dic objectForKey:@"title"]]];
        [alert setButtonTitles:@[@"取消",@"确定领取"]];
        [alert setDelegate:self];
        [alert setUseMotionEffects:YES];
        [alert show];
    }
}

-(UIView *)createCustomAlertViewWithImage:(NSString *)imageStr title:(NSString *)titleStr
{
    UIView *backView = [[UIView alloc]init];
    backView.layer.cornerRadius = 10;
    backView.layer.masksToBounds = YES;
    backView.backgroundColor = kWhiteColor;
    backView.frame = CGRectMake(0, 0, SCREEN_WIDTH/4*3, SCREEN_HEIGHT/3);
    
    YJEJ_BaseLable *titleLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:COLOR(50, 50, 50, 1) textFont:kSuitFont(16) textAlignmet:NSTextAlignmentCenter];
    titleLab.text = @"选择的药具";
    titleLab.frame = CGRectMake(0, paddingHeigh, WIDTH(backView), 30);
    [backView addSubview:titleLab];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageStr]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake(paddingHeigh *2, BOTTOM(titleLab)+paddingHeigh, WIDTH(backView)-paddingHeigh *4, WIDTH(backView)/2-paddingHeigh *2);
    [backView addSubview:imageView];
    
    YJEJ_BaseLable *descriLab = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:titleLab.textColor textFont:kSuitFont(15) textAlignmet:NSTextAlignmentCenter];
    descriLab.text = titleStr;
    descriLab.frame = CGRectMake(0, BOTTOM(imageView)+paddingHeigh, WIDTH(backView), 30);
    [backView addSubview:descriLab];
    
    return backView;
}

- (void)customIOS7dialogButtonTouchUpInside:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            [MBProgressHUD showSuccess:@"领取成功" toView:self.view];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popToRootViewControllerAnimated:YES];
            });
        }
            break;
    }
    [(CustomIOSAlertView *)alertView close];
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
