 //
//  ULDevController.m
//  UniversalLinkDev
//
//  Created by ZhuHong on 2018/7/30.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ULDevController.h"
#import <MobLink/MobLink.h>
#import <MobLink/UIViewController+MLSDKRestore.h>

@interface ULDevController ()
// 这个是从 'Universal Link' 带入的参数场景
@property (nonatomic, strong) MLSDKScene* scene;

@end

@implementation ULDevController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 背景色
    self.view.backgroundColor = [UIColor whiteColor];
}

// Universal Link 就是通过这个方法找到对应的路劲
+ (NSString *)MLSDKPath {
    return @"/demo/a";
}

// Universal Link 通过这个方法将具体的参数场景传入控制器
- (instancetype)initWithMobLinkScene:(MLSDKScene *)scene {
    self = [super init];
    self.scene = scene;
    self.title = scene.params[@"title"];
    return self;
}

@end
