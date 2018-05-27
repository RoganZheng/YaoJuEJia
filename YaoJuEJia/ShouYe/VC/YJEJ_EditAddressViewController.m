 //
//  YJEJ_EditAddressViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_EditAddressViewController.h"
#import "YJEJ_EditAddressView.h"
#import "YJEJ_SelectCityViewController.h"
#import "SHPlacePickerView.h"

@interface YJEJ_EditAddressViewController ()<UIViewCollectEventsDelegate>

@property (nonatomic ,strong)YJEJ_EditAddressView *nameView;
@property (nonatomic,strong) YJEJ_EditAddressView *phoneView;
@property (nonatomic,strong) YJEJ_EditAddressView *addressView;

@end

@implementation YJEJ_EditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super addBackBtn];
    self.title = @"物流信息";
    [self layoutView];
    // Do any additional setup after loading the view.
}

-(void) layoutView
{
    self.view.backgroundColor = COLOR(220, 220, 220, 1);
    _nameView = [[YJEJ_EditAddressView alloc]initWithTitle:@"收件人" placeHolder:@"输入收件人姓名" editType:EditType_singleLine];
    [self.view addSubview:_nameView];
    
    _phoneView = [[YJEJ_EditAddressView alloc]initWithTitle:@"手机号" placeHolder:@"请输入收件人电话" editType:EditType_singleLine];
    [self.view addSubview:_phoneView];
    
    _addressView = [[YJEJ_EditAddressView alloc]initWithTitle:@"配送地址" placeHolder:@"输入收件人地址" editType:EditType_doubleLine];
    _addressView.delegate = self;
    [self.view addSubview:_addressView];
    
    [_nameView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(paddingHeigh*2);
        make.height.equalTo(paddingHeigh*3+35);
    }];
    
    [_phoneView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameView);
        make.right.equalTo(self.nameView);
        make.top.equalTo(self.nameView.mas_bottom).offset(paddingHeigh *2);
        make.height.equalTo(self.nameView);
    }];
    
    [_addressView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameView);
        make.right.equalTo(self.nameView);
        make.top.equalTo(self.phoneView.mas_bottom).offset(paddingHeigh *2);
        make.height.equalTo(paddingHeigh *5 + 70);
    }];
    
    YJEJ_BaseLable *tips = [[YJEJ_BaseLable alloc]initWithBackColor:kClearColor titleColor:[UIColor redColor] textFont:kSuitFont(15) textAlignmet:NSTextAlignmentLeft];
    tips.text = @"注：同城配送费用5元";
    [self.view addSubview:tips];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [submitBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [submitBtn setBackgroundColor:NAVIGATIONBARCOLOR];
    submitBtn.layer.masksToBounds = YES;
    submitBtn.layer.cornerRadius = 5;
    [self.view addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [tips makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(paddingWidth *2);
        make.top.equalTo(self.addressView.mas_bottom).offset(paddingHeigh);
        make.height.equalTo(30);
        make.width.equalTo(SCREEN_WIDTH);
    }];
    [submitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.equalTo(44);
        make.width.equalTo(SCREEN_WIDTH - paddingHeigh *4);
        make.top.equalTo(tips.mas_bottom).offset(paddingHeigh);
    }];
}

- (void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    WS(weakSelf)
    if ([type isEqualToString:@"选择城市"]) {
        SHPlacePickerView *areaPicker = [[SHPlacePickerView alloc]initWithIsRecordLocation:YES SendPlaceArray:^(NSArray *placeArray) {
            NSLog(@"%@%@%@",placeArray[0], placeArray[1], placeArray[2]);
            [weakSelf.addressView updateViewWithData:[NSString stringWithFormat:@"%@%@%@",placeArray[0], placeArray[1], placeArray[2]]];
        }];
        [self.view addSubview:areaPicker];
        return;
    }
    if ([type isEqualToString:@"完成选择"]) {
        return;
    }
}

-(void)submitAction:(id)sender
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要进行物流发放吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [MBProgressHUD showSuccess:@"提交成功" toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:alert];

    [self presentViewController:alertVC animated:YES completion:nil];
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
