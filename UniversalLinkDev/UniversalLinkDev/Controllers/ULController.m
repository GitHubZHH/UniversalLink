//
//  ULController.m
//  UniversalLinkDev
//
//  Created by ZhuHong on 2018/7/30.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ULController.h"

@interface ULController ()
@end

@implementation ULController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
        {
            [self getMobId];
        }
            break;
            
        default:
            break;
    }
}

- (void)getMobId {
    /**
    // 构造自定义参数（可选）
    NSMutableDictionary *customParams = [NSMutableDictionary dictionary];
    customParams[@"key1"] = @"value1";
    customParams[@"key2"] = @"value2";
    // 根据路径、来源以及自定义参数构造scene
    MLSDKScene *scene = [[MLSDKScene alloc] initWithMLSDKPath:@"/demo/a" source:@"uuid-123456" params:customParams];
    
    ULDevController* devVC = [[ULDevController alloc] initWithMobLinkScene:scene];
    
    [self.navigationController pushViewController:devVC animated:YES];
    // 请求MobId
    __weak typeof(self) weakSelf = self;
    [MobLink getMobId:scene result:^(NSString *mobId) {
        NSString *msg = mobId == nil ? @"获取Mobid失败" : @"获取Mobid成功";
        NSLog(@"Mobid = %@", mobId);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];
     */
}

@end
