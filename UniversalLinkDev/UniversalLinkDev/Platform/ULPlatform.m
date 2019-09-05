//
//  ULPlatform.m
//  UniversalLinkDev
//
//  Created by ZhuHong on 2018/7/31.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ULPlatform.h"
#import <UIKit/UIKit.h>
#import "MobLinkProxy.h"

@implementation ULPlatform

+ (BOOL)businessScheduler {
    [MobLinkProxy schedul];
    return YES;
}

+ (BOOL)handleOpenURL:(NSURL*)url {
    NSLog(@"%@", url);
    
    return YES;
}

+ (void)continueUserActivity:(NSUserActivity *)userActivity {
    NSURL* webpageURL = userActivity.webpageURL;
    NSURLComponents* components = [NSURLComponents componentsWithURL:webpageURL resolvingAgainstBaseURL:YES];
    
    // path
    NSLog(@"path = %@", components.path);
    NSLog(@"参数 = %@", components.query);
    
    for (NSURLQueryItem* item in components.queryItems) {
        NSLog(@"key = %@\nvalue = %@", item.name, item.value);
        // 仅仅用于测试
        if ([item.name isEqualToString:@"info"]) {
            UINavigationController* navVC = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
            UIViewController* vc = [[UIViewController alloc] init];
            vc.title = item.value;
            vc.view.backgroundColor = [UIColor blueColor];
            [navVC pushViewController:vc animated:YES];
        }
    }
}

@end
