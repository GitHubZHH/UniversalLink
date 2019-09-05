//
//  ULPlatform.h
//  UniversalLinkDev
//
//  Created by ZhuHong on 2018/7/31.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ULPlatform : NSObject

+ (BOOL)businessScheduler;

// 使用 Scheme 的话, 这个是不会被调用的
+ (BOOL)handleOpenURL:(NSURL*)url;

// 使用 Universal Link 的话, 这个是不会被调用的
+ (void)continueUserActivity:(NSUserActivity *)userActivity;

@end
