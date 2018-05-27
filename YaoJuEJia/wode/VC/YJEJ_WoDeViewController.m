//
//  YJEJ_WoDeViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_WoDeViewController.h"
#import "YJEJ_WodeTableView.h"
#import "YJEJ_ImagePickTool.h"
#import "YJEJ_RecordLingQuViewController.h"

@interface YJEJ_WoDeViewController ()<UIViewCollectEventsDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,strong) YJEJ_WodeTableView *mainTable;
@end

@implementation YJEJ_WoDeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self layoutView];
    // Do any additional setup after loading the view.
}

-(void) layoutView
{
    _mainTable = [[YJEJ_WodeTableView alloc]init];
    _mainTable.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationHeight-49);
    _mainTable.delegates = self;
    [self.view addSubview:_mainTable];
    
}

- (void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    NSLog(@"%@",type);
    if ([type isEqualToString:@"点击头像"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"获取头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"从相册中获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [YJEJ_ImagePickTool openImagePicker:UIImagePickerControllerSourceTypePhotoLibrary delegate:self baseController:self.navigationController allowEdit:YES];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [YJEJ_ImagePickTool openImagePicker:UIImagePickerControllerSourceTypeCamera delegate:self baseController:self.navigationController allowEdit:YES];
        }];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action1];
        [alert addAction:action2];
        [alert addAction:actionCancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if ([type isEqualToString:@"在线领取订单记录"]) {
        YJEJ_RecordLingQuViewController *vc = [[YJEJ_RecordLingQuViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([type isEqualToString:@"关于药具e家"]) {
        
    }
    if ([type isEqualToString:@"退出登录"]) {
        [self logout];
    }
}

-(void)logout{
    UIAlertController *logout = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定退出登录" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [logout addAction:sure];
    [logout addAction:cancel];
    [self presentViewController:logout animated:YES completion:nil];
}

#pragma mark ==========  UIImagePickerController Delegate  =========

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *selectedImage = nil;
    selectedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (selectedImage == nil) {
        selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if (selectedImage == nil) {
        return;
    }
    UIImage *scaleImage = [selectedImage scaleWithMaxSize:100 quality:kCGInterpolationDefault];
    
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
