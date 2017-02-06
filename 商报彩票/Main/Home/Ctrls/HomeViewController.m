//
//  HomeViewController.m
//  商报彩票
//
//  Created by 涛程 on 16/11/6.
//  Copyright © 2016年 涛程. All rights reserved.
//

#import "HomeViewController.h"



#import "HGViewController.h"


#define HomeScrollHeight TRANS_VALUE(105.0f)  //循环图高
#define cycScView5Height TRANS_VALUE(21.0f)   //广播高
#define BtnScViewTopHght (HomeScrollHeight+28+cycScView5Height)

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //关闭自动调整
//    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor  colorWithRed:225/255.00 green:0 blue:0 alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    backIetm.title =@"七星彩";
    self.navigationItem.backBarButtonItem = backIetm;
    
    
    [self loadingButton];
    
    //改变状态栏颜色
    [self StatusBarColor];
    
  
}


- (void)pushHuagui{
    HGViewController *hg = [[HGViewController alloc]init];
     hg.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;//设置视图弹出时的动画效果
    [self presentViewController:hg animated:YES completion:nil];
}


- (void)loadingButton{
    //背景ScrollView
    UIScrollView *BtnScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, BtnScViewTopHght, kScreenWidth, kScreenHeight-BtnScViewTopHght)];
//    BtnScrollView.layer.cornerRadius = 10;
    BtnScrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:BtnScrollView];

    //画规
    UIButton *_Huagui = [[UIButton alloc]initWithFrame:CGRectMake(TRANS_VALUE(5.0f), TRANS_VALUE(100.0f), TRANS_VALUE(150.0f), TRANS_VALUE(90.0f))];
    _Huagui.layer.cornerRadius = 10;
    [_Huagui setBackgroundImage:[UIImage imageNamed:@"画规"] forState:UIControlStateNormal];
    [_Huagui addTarget:self action:@selector(pushHuagui) forControlEvents:UIControlEventTouchDown];
    [BtnScrollView addSubview:_Huagui];
    
    
}

- (void)StatusBarColor{
    UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    vv.backgroundColor = [UIColor  colorWithRed:225/255.00 green:0 blue:0 alpha:1.0f];
    [self.view addSubview:vv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [UIView animateWithDuration:0.5 animations:^{
        [self.navigationController setNavigationBarHidden:YES animated:animated];
    }];
    

}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
