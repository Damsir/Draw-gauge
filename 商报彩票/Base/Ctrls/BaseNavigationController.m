//
//  BaseNavigationController.m
//  商报彩票
//
//  Created by 涛程 on 16/11/6.
//  Copyright © 2016年 涛程. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //取消半透明效果
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    //根据图片自定义背景设置背景
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64@2x"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    //设置背景颜色
//    在各个item控制器中实现＝＝＝＝＝＝＝
    //设置字体颜色
    //在各个item控制器中实现
    //一、在info.plist中，将View controller-based status bar appearance设为NO。就只能以下方法可以改变状态栏颜色。
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置标题文字的属性
    NSDictionary *titleDic = @{
                               NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                               NSForegroundColorAttributeName : [UIColor whiteColor]
                               };
    [self.navigationBar setTitleTextAttributes:titleDic];
    
    /*
     UIBarStyleDefault          = 0,
     UIBarStyleBlack            = 1, // 黑色
     UIBarStyleBlackOpaque      = 1, // 黑色不透明, Deprecated. Use UIBarStyleBlack
     UIBarStyleBlackTranslucent = 2, // 黑色半透明, Deprecated. Use UIBarStyleBlack and set the translucent property to YES
     */
    //设置 navigationBar 的样式，设置过后 navigationBar 失去了层次立体感
    //    self.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//隐藏导航栏将不能实现
// 设置 UIStatusBar 的首选样式
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    
//    return UIStatusBarStyleLightContent;    //黑底白字
////        return UIStatusBarStyleDefault;         //白底黑字
//}
@end
