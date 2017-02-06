//
//  HGViewController.m
//  商报彩票
//
//  Created by 涛程 on 16/12/2.
//  Copyright © 2016年 涛程. All rights reserved.
//

#import "HGViewController.h"
//画布
#import "DrawView.h"
//工具栏
#import "ToolView.h"
//背景
#import "viewcell.h"
#import "viewcellModel.h"

//画规背景颜色
#define backgrodColor [UIColor grayColor]



@interface HGViewController ()<UIScrollViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
        UIScrollView *sc;
        UIView *vv;
}
@property (weak, nonatomic)DrawView *drawView;

@end

@implementation HGViewController
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //PS:基于oc的事件传递原理，请按顺序加载
    //1.加载界面
    [self loadUI];
    //2.加载数据
    [self loadData];
    //3.加载画布
    [self loadDrawView];
    
    //默认绘画模式，关闭UIScrollView的上下移动，开启drawView的交互
    sc.scrollEnabled =NO;
    self.drawView.userInteractionEnabled = YES;
    
}
- (void)loadUI{
    
    //创建上下移动
    sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+64)];
    sc.backgroundColor = backgrodColor;
    sc.contentSize = CGSizeMake(sc.bounds.size.width, sc.bounds.size.height*3.2);
    sc.maximumZoomScale = 1;
    sc.minimumZoomScale = 0.5;
    sc.delegate = self;
    [self.view addSubview:sc];
    
    vv= [[UIView alloc]initWithFrame:CGRectMake(0, 0,sc.bounds.size.width , sc.bounds.size.height*3.2+100)];
//    vv.backgroundColor = backgrodColor;
    vv.tag = 101;
    [sc addSubview:vv];
}
- (void)loadData{
    id result = [WXDataService requestDataWithJsonFile:@"huaguishuju.json"];
    for (NSDictionary *dic in result) {
        viewcellModel *model = [[viewcellModel alloc] init];
        model.movieID = dic[@"newsid"];
        model.type = dic[@"type"];
        model.title = dic[@"title"];
        model.summary = dic[@"summary"];
        model.image = dic[@"image"];
        [self.dataArr addObject:model];
    }
    
    for (int i = 0 ; i < _dataArr.count; i++) {
        
        viewcell *viewcells =[[viewcell alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(43.0f )*i+i, self.view.bounds.size.width, TRANS_VALUE(43.0f ))];
        [vv addSubview:viewcells];
        
        viewcells.model = _dataArr[i];
    }
}

- (void)loadDrawView{
    
    //画布
    DrawView *drawView = [[DrawView alloc]initWithFrame:vv.bounds];
    drawView.backgroundColor = [UIColor clearColor];
    
    [vv addSubview:drawView];
    self.drawView = drawView;
//    __weak typeof(drawView) wdrawView = drawView;
    
    //添加控制绘画开关
    UIButton * backButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton2.frame = CGRectMake(10, 300, 80, 50);
    
    [backButton2 setTitle:@"我要动" forState:UIControlStateNormal];
    [backButton2 setTitle:@"我不动" forState:UIControlStateSelected];
    [backButton2 addTarget:self action:@selector(home:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton2];
    
    //添加画笔开关
    UIButton * backButton3 = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton3.frame = CGRectMake(10, 450, 80, 50);
    
    [backButton3 setTitle:@"自定义画笔" forState:UIControlStateNormal];
    [backButton3 setTitle:@"直线" forState:UIControlStateSelected];
    [backButton3 addTarget:self action:@selector(Lines:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton3];
    
    __weak typeof(self) weakSelf = self;
    //工具栏
    ToolView *toolView = [[ToolView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64) afterSelectEraser:^{
        //清屏
        [drawView clearScreen];
        [weakSelf dismissViewControllerAnimated:YES completion:^{
        }];
    } afterSelectColor:^(UIColor *color) {
        //给绘图视图设置颜色
        [drawView setDrawColor:color];
        [drawView setLineWidth:3.0];
    } afterSelectLineWidth:^(CGFloat lineWidth) {
        //给绘图视图设置线宽
        [drawView setLineWidth:lineWidth];
    } afterSelectUndo:^{
        //撤销
        [drawView undoStep];

    } afterSelectClearScreen:^{
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定清空规图？" preferredStyle: UIAlertControllerStyleAlert];
        __weak typeof(alert) wAlert = alert;
        [wAlert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [wAlert addAction:[UIAlertAction actionWithTitle:@"我要清空" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //清屏
            [drawView clearScreen];
        }]];

        [self presentViewController:wAlert animated:true completion:nil];
       
    } afterSelectSave:^{
        //保存图片
        [weakSelf Savelat];
            }];

//    [self.navigationController.navigationBar addSubview:toolView];
    [self.view addSubview:toolView];
}

- (void)home:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {

        NSLog(@"1");
        //默认非绘画模式，开启UIScrollView的上下移动，关闭drawView的交互
        sc.scrollEnabled =YES;
        self.drawView.userInteractionEnabled = NO;
    }else{
        
        NSLog(@"2");
        //默认绘画模式，关闭UIScrollView的上下移动，开启drawView的交互
        sc.scrollEnabled =NO;
        self.drawView.userInteractionEnabled = YES;
    }
}
- (void)Lines:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        
        _drawView.Line = 1;
    }else{
        _drawView.Line = 0;
        
    }
}
#pragma mark - 照片选择代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    
    //设置绘图视图
    [self.drawView setImage:image];
    
    //关闭照片选择窗口
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UIScrollViewDelegate
//指定UIScrollView上面需要缩放的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //取到scrollView上面的子视图 imgView
    return [scrollView viewWithTag:101];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"已经缩放, 只要在缩放就会调用, 当前缩放比率为%f", scrollView.zoomScale);
    //居中代码
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    
    
    
    vv.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                            scrollView.contentSize.height * 0.5 + offsetY);
    
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"将要开始缩放");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"已经结束缩放");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)Savelat{
    
    UIGraphicsBeginImageContext(vv.bounds.size);     //vv 当前的view
    [vv.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    //保存图片
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle: UIAlertControllerStyleAlert];
    __weak typeof(alert) wAlert = alert;
    [wAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:wAlert animated:true completion:nil];
}
//将要开始
- ( void )viewWillAppear:( BOOL )animated
{
    //隐藏tabbar
    self.tabBarController.tabBar.hidden = YES;
    
}
//将要结束
- (void)viewWillDisappear:(BOOL)animated{
    //显示tabbar
    
    self.tabBarController.tabBar.hidden = NO;
   
}

@end
