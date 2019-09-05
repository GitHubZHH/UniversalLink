//
//  AppDelegate.m
//  UniversalLinkDev
//
//  Created by ZhuHong on 2018/7/30.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "AppDelegate.h"
#import "ULPlatform.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 业务初始调度
    [ULPlatform businessScheduler];
    //
    NSURL *launchOptionsURL = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    if ([launchOptionsURL isKindOfClass:[NSURL class]]) {
        [ULPlatform handleOpenURL:launchOptionsURL];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ULPlatform handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [ULPlatform handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)app openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options
{
    return [ULPlatform handleOpenURL:url];
}

// Universal Link 激活会执行这个方法
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler {
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        [ULPlatform continueUserActivity:userActivity];
    }
    return YES;
}


@end
