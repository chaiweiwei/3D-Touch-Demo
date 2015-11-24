//
//  ViewController.m
//  3D_Touch
//
//  Created by 求攻略 on 15/11/13.
//  Copyright © 2015年 求攻略. All rights reserved.
//

#import "ViewController.h"

#define __kScreenWidth [UIScreen mainScreen].bounds.size.width
#define __kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

// peek && pop 相关
@property (nonatomic, assign) CGRect sourceRect;       // 用户手势点 对应需要突出显示的rect
@property (nonatomic, strong) NSIndexPath *indexPath;  // 用户手势点 对应的indexPath

@property (nonatomic, copy) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 3d touch 第一个标签通过plist文件添加
    //3d touch 第二个按钮
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeFavorite];
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"tow" localizedTitle:@"第二个标签" localizedSubtitle:@"副标题" icon:icon userInfo:@{@"info":@"第二个按钮点击的效果"}];
    [UIApplication sharedApplication].shortcutItems = @[item];
    
    [self configTableView];
    
    if([self is3DTouchAvaliable]) {
        //将sourceView这个视图注册允许使用3D Touch功能
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }
}

//判断是否支持3Dtouch
- (BOOL)is3DTouchAvaliable {
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        return YES;
    }
    return NO;
}

- (void)configTableView {
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.items = @[@"第一条",@"第二条",@"第三条",@"第四条",@"第五条",@"第六条"];
    self.tableView.rowHeight = 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.items[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",indexPath);
}

#pragma mark -- UIViewControllerPreviewingDelegate

//peek手势
//长按需要预览的内容
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    //childVC是继续长按的情况下进入的页面
    UIViewController *childVC = [[UIViewController alloc] init];
    //预览时候展示的view大小
    //如果不设置会根据内部的大小适应
    //childVC.preferredContentSize = CGSizeMake(0.0f,100.0f);
    
    // 用户手势点 对应需要突出显示的rect
    [self getShouldShowRectAndIndexPathWithLocation:location];
    
    previewingContext.sourceRect = self.sourceRect;
    
    // 加个白色背景
    UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(20, 10, __kScreenWidth - 40, __kScreenHeight - 20 - 64 * 2)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 10;
    bgView.clipsToBounds = YES;
    [childVC.view addSubview:bgView];
    
    // 加个lable
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, __kScreenWidth - 40, __kScreenHeight - 20 - 64 * 2)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.tag = 1001;
    lable.text = @"再按重一点...";
    [childVC.view addSubview:lable];

    return childVC;
}
//pop手势
//继续重按进入页面
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    UILabel *lable = (UILabel *)[viewControllerToCommit.view viewWithTag:1001];
    lable.text = @"继续重按进入的页面";
    
    //展示预览的childVC既viewControllerToCommit
    [self showViewController:viewControllerToCommit sender:self];
    
    //或者重按执行cell的点击动作
    //[self tableView:self.tableView didSelectRowAtIndexPath:self.indexPath];
}


// 获取用户手势点所在cell的下标。同时判断手势点是否超出tableView响应范围
- (BOOL)getShouldShowRectAndIndexPathWithLocation:(CGPoint)location {
    NSInteger row = (location.y - 20)/50;
    self.sourceRect = CGRectMake(0, row * 50, __kScreenWidth, 50);
    self.indexPath = [NSIndexPath indexPathForItem:row inSection:0];
    // 如果row越界了，返回NO 不处理peek手势
    return row >= self.items.count ? NO : YES;
}

@end
