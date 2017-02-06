//
//  RootTaBarController.m
//  商报彩票
//
//  Created by 涛程 on 16/11/6.
//  Copyright © 2016年 涛程. All rights reserved.
//

#import "RootTaBarController.h"
#import "WXTabBarButton.h"



@interface RootTaBarController ()
{
    UIImageView *selectItem;
    NSArray *titlesArr;
//    NSArray *titlesArrhight;
}
@end

@implementation RootTaBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、创建viewCtrls
    [self createViewCtrls];
    
    //2、自定义uitabbar
    [self customTabBar];
    
}

//如果RootTabBarController是通过storyboard加载的,那么移除的动作需要放在这个方法里面
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //移除系统tabbar自带的item
    [self removeUITabBarButton];
}
-(void)createViewCtrls
{
    UIStoryboard *homeStbd = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIStoryboard *newsStbd = [UIStoryboard storyboardWithName:@"Activity" bundle:nil];
    UIStoryboard *topStbd = [UIStoryboard storyboardWithName:@"Found" bundle:nil];
    UIStoryboard *cinemaStbd = [UIStoryboard storyboardWithName:@"My" bundle:nil];
    
    
    NSArray *viewCtrls = @[
                           [homeStbd instantiateInitialViewController],
                           [newsStbd instantiateInitialViewController],
                           [topStbd instantiateInitialViewController],
                           [cinemaStbd instantiateInitialViewController],
                           ];
    
    self.viewControllers = viewCtrls;
}

-(void)customTabBar
{
    float itemWidth = kScreenWidth / 4;
 
    //背景
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
//    
//    //选中的样式
//    selectItem = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
//    selectItem.frame = CGRectMake(0, 0, itemWidth, 48);
//    [self.tabBar addSubview:selectItem];
    
    
    //tabbar按钮
    titlesArr = @[@"七星彩", @"活动", @"发现", @"我的"];
    
//    //高亮
//    titlesArrhight= @[@"七星彩", @"活动", @"发现", @"我的"];
    
    //普通
    NSArray *imgArr = @[
                        @"七星彩01",
                        @"活动01",
                        @"发现01",
                        @"我的01",
                        ];
    
    //高亮
    NSArray *highArr = @[
                        @"七星彩",
                        @"活动",
                        @"发现",
                        @"我的",
                        
                        ];
    for (int i=0; i<titlesArr.count; i++) {
        NSString *title = titlesArr[i];
        NSString *imgName = imgArr[i];
        NSString *highName = highArr[i];
        
        
       WXTabBarButton *item = [[WXTabBarButton alloc]
                                initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, 49)
                                withImgName:imgName
                                withTitle:title
                                sinImgName:highName];
        [item addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        item.tag = 1000 + i;
        [self.tabBar addSubview:item];
        
        //默认第一个item高亮
        if (i==0) {
            item.imgView.highlighted = YES;
            item.titleLabel.highlighted = YES;
        }

    }
    
}
-(void)buttonAction:(WXTabBarButton *)sender
{
    self.selectedIndex = sender.tag - 1000;
    [UIView animateWithDuration:.3 animations:^{
        selectItem.center = sender.center;
    }];
    //遍历按钮，通过判断按钮tag来显示高亮
    for (int i=0; i<titlesArr.count; i++){
        WXTabBarButton *item = [self.tabBar viewWithTag:1000+i];
    if ([item isEqual:(WXTabBarButton *)sender]) {
        item.imgView.highlighted = YES;
        item.titleLabel.highlighted = YES;
    }else{
        item.imgView.highlighted = NO;
        item.titleLabel.highlighted = NO;
    }
    
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)removeUITabBarButton
{
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

@end
