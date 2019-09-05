//
//  MobLinkProxy.m
//  UniversalLinkDev
//
//  Created by ZhuHong on 2018/8/1.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "MobLinkProxy.h"
#import <MobLink/MobLink.h>
#import <MobLink/MLSDKScene.h>
#import <MobLink/IMLSDKRestoreDelegate.h>

// 这个应该是 Moblink 的 BUG, 一定要写这个协议,设置的 delegate 才会生效
@interface MobLinkProxy () <IMLSDKRestoreDelegate>

@end

@implementation MobLinkProxy

// 安装
+ (void)schedul {
    // 设置代理 当前的代理是一个 Class, 所以这个警告的问题, 暂且忽略
    [MobLink setDelegate:self];
}

#pragma mark -
#pragma mark - IMLSDKRestoreDelegate
// 开始进入场景
+ (void)IMLSDKStartCheckScene {
    NSLog(@"Start Check Scene");
}

// 场景进入完成
+ (void)IMLSDKEndCheckScene {
    NSLog(@"End Check Scene");
}

// 是否运行进入场景
+ (void)IMLSDKWillRestoreScene:(MLSDKScene *)scene Restore:(void (^)(BOOL, RestoreStyle))restoreHandler {
    NSLog(@"Will Restore Scene - Path:%@",scene.path);
    // 实际项目中, 可以通过 scene 的值做选择, 是 YES 还是 NO.
    restoreHandler(YES, MLDefault);
}

// 已经完成
+ (void)IMLSDKCompleteRestore:(MLSDKScene *)scene {
    NSLog(@"Complete Restore -Path:%@",scene.path);
}

// 没有找到路径的时候被调用
+ (void)IMLSDKNotFoundScene:(MLSDKScene *)scene {
    NSLog(@"Not Found Scene - Path :%@",scene.path);
}

@end
