//
//  ChildViewController.m
//  3D_Touch
//
//  Created by 求攻略 on 15/11/24.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"action1"
                                                          style:UIPreviewActionStyleDefault handler:
                                ^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController)
                                {
                                    NSLog(@"action1 selected.");
                                }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"action2"
                                                          style:UIPreviewActionStyleSelected handler:
                                ^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController)
                                {
                                    NSLog(@"action2 selected.");
                                }];
    UIPreviewAction *action3_1 = [UIPreviewAction actionWithTitle:@"action3-1"
                                                            style:UIPreviewActionStyleDefault handler:
                                  ^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController)
                                  {
                                      NSLog(@"action3-1 selected.");
                                  }];
    UIPreviewAction *action3_2 = [UIPreviewAction actionWithTitle:@"action3-2"
                                                            style:UIPreviewActionStyleDefault handler:
                                  ^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController)
                                  {
                                      NSLog(@"action3-2 selected.");
                                  }];
    UIPreviewActionGroup *action3 = [UIPreviewActionGroup actionGroupWithTitle:@"action3" style:UIPreviewActionStyleDestructive actions:@[action3_1, action3_2]];
    
    return @[action1, action2, action3];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
