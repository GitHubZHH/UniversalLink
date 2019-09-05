//
//  HTMLController.m
//  HTMLDev
//
//  Created by ZhuHong on 2018/7/31.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HTMLController.h"

@interface HTMLController () <UIWebViewDelegate>
// 网页视图
@property (weak, nonatomic) IBOutlet UIWebView *webView;
// 加载提示框
@property (weak, nonatomic) IBOutlet UILabel *loadTipsLabel;

@end

@implementation HTMLController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取文件资源 & 显示
    NSString* path = [[NSBundle mainBundle] pathForResource:@"UniversalLinkDev" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [self.webView loadRequest:request];
}

#pragma mark -
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    self.loadTipsLabel.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.loadTipsLabel.hidden = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    self.loadTipsLabel.hidden = YES;
}

@end
