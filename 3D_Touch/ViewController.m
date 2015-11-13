//
//  ViewController.m
//  3D_Touch
//
//  Created by 求攻略 on 15/11/13.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 3d touch 第一个标签通过plist文件添加
    //3d touch 第二个按钮
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeFavorite];
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"tow" localizedTitle:@"第二个标签" localizedSubtitle:@"副标题" icon:icon userInfo:@{@"info":@"第二个按钮点击的效果"}];
    [UIApplication sharedApplication].shortcutItems = @[item];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
