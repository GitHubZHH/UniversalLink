//
//  WKController.m
//  HTMLDev
//
//  Created  by hong.zhu on 2019/8/30
//  Copyright © 2019 CoderHG. All rights reserved.
//  

#import "WKController.h"
#import <WebKit/WebKit.h>

@interface WKController () <WKUIDelegate, WKNavigationDelegate>

@end

@implementation WKController

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
    NSString* path = [[NSBundle mainBundle] pathForResource:@"UniversalLinkDev" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [webView loadRequest:request];
    
}

#pragma mark - WKWebView Delegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    WKNavigationActionPolicy actionPolicy = WKNavigationActionPolicyAllow;
    
    // 这样能打开 App
    decisionHandler(actionPolicy);
#error  +2 就不能使用 Universal Link
     decisionHandler(actionPolicy+2);
}

@end
