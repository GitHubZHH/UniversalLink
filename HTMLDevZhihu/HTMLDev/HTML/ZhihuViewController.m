//
//  ZhihuViewController.m
//  HTMLDev
//
//  Created  by hong.zhu on 2019/8/30
//  Copyright © 2019 CoderHG. All rights reserved.
//  

#import "ZhihuViewController.h"
#import <WebKit/WebKit.h>

@interface ZhihuViewController () <WKUIDelegate, WKNavigationDelegate>

@end

@implementation ZhihuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.allowsInlineMediaPlayback = YES;
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:webView];
    
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    // 获取文件资源 & 显示
    
    // `知乎` 网页
    NSURL *url = [NSURL URLWithString:@"https://zhuanlan.zhihu.com/p/31628866"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [webView loadRequest:request];
}


#pragma mark - WKWebView Delegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    WKNavigationActionPolicy actionPolicy = WKNavigationActionPolicyAllow;
    // decisionHandler(actionPolicy);
#error +2 就不能使用 Universal Link
    decisionHandler(actionPolicy+2);
}


@end
