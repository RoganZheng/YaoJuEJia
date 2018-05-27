//
//  YJEJ_WebViewViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_WebViewViewController.h"
#import <WebKit/WebKit.h>

@interface YJEJ_WebViewViewController ()<WKNavigationDelegate, WKUIDelegate>

@property (nonatomic,strong) WKWebView *mainWebView;

@end

@implementation YJEJ_WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;
    
    self.mainWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kNavigationHeight)];
    self.mainWebView.UIDelegate = self;
    self.mainWebView.navigationDelegate = self;
    [self.view addSubview:self.mainWebView];
    NSURL *url = [NSURL URLWithString:self.urlString];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:url]];
    // Do any additional setup after loading the view.
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD showError:@"加载中" toView:self.view];
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
