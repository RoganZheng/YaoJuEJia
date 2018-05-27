//
//  YJEJ_LoginViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_LoginViewController.h"
#import "YJEJ_RegistViewController.h"
#import "YJEJ_ShouYeViewController.h"
#import "Login_View.h"

@interface YJEJ_LoginViewController ()<UIViewCollectEventsDelegate>

@property (nonatomic,strong) Login_View *loginView;

@end

@implementation YJEJ_LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];
    
    [HttpNetworkManager postWithURL:Request_userLogin params:@{@"userid":@"123",@"username":@"123456",@"child":@"123",@"userpsw":@"123"} successBlock:^(NSDictionary *returnData) {
        
    } failBlock:^(NSError *error) {
        
    }];
    // Do any additional setup after loading the view.
}

-(void)layout
{
    _loginView = [Login_View loadView];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
    [_loginView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params
{
    if ([type isEqualToString:@"取消勾选"]) {
        
    }
    if ([type isEqualToString:@"确认勾选"]) {
        
    }
    if ([type isEqualToString:@"登录操作"]) {
        [SqliteDataTool addUserImformationWithIdCard:@"testID" phone:@"testPhone" userName:@"testName" password:@"testPassword"];
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
    }
    if ([type isEqualToString:@"注册操作"]) {
        YJEJ_RegistViewController *vc = [[YJEJ_RegistViewController alloc]init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([type isEqualToString:@"注册成功"]) {
        NSDictionary *paraDic = (NSDictionary *)params;
        _loginView.UserText.text = [paraDic objectForKey:@"idCard"];
        _loginView.pwdText.text = [paraDic objectForKey:@"password"];
        
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
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
