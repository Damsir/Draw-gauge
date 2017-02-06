//
//  ToolView.m
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "ToolView.h"
#import "MyButton.h"
#import "SelectColorView.h"

#define kButtonSpace 10.0
//深绿色
#define DarkgreenColor [UIColor  colorWithRed:126/255.00 green:202/255.00 blue:129/255.00 alpha:1.0f]
//注意，枚举的顺序要和按钮名称的顺序保持一致。根据枚举顺序响应事件
typedef enum
{
    kButtonEarser,
    kButtonColor = 1,
    kButtonLineWidth,
    kButtonUndo,
    kButtonClearScreen,
    kButtonSave
}kButtonActionType;

@interface ToolView()
{
    ToolViewActionBlock _toolViewSelectEraserBlock;
    SelectColorBlock _selectColorBlock;
    SelectLineWidthBlock _selectLineWidthBlock;
    ToolViewActionBlock _toolViewSelectUndoBlock;
    ToolViewActionBlock _toolViewSelectClearScreenBlock;
    ToolViewActionBlock _toolViewSelectSaveBlock;
}

@property (weak, nonatomic)MyButton *selectButton;

@property (weak, nonatomic)SelectColorView *colorView;

@property (weak, nonatomic)SelectLineWidthView *lineWidthView;

@end

@implementation ToolView

-(id)initWithFrame:(CGRect)frame
afterSelectEraser:(ToolViewActionBlock)afterSelectEraser
  afterSelectColor:(SelectColorBlock)afterSelectColor
afterSelectLineWidth:(SelectLineWidthBlock)afterSelectLineWidth
   afterSelectUndo:(ToolViewActionBlock)afterSelectUndo
afterSelectClearScreen:(ToolViewActionBlock)afterSelectClearScreen
afterSelectSave:(ToolViewActionBlock)afterSelectSave
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _toolViewSelectEraserBlock = afterSelectEraser;
        _selectColorBlock = afterSelectColor;
        _selectLineWidthBlock = afterSelectLineWidth;
        _toolViewSelectUndoBlock = afterSelectUndo;
        _toolViewSelectClearScreenBlock = afterSelectClearScreen;
        _toolViewSelectSaveBlock = afterSelectSave;
        [self setBackgroundColor:DarkgreenColor];
        
        //通过循环的方式创建按钮
        NSArray *array = @[@"返回",@"颜色",@"线宽",@"撤销",@"清屏",@"保存"];
        
        [self createButtonsWithArray:array];
        
    }
    
    return self;
}

#pragma mark - 创建工具视图中的按钮
-(void)createButtonsWithArray:(NSArray *)array
{
    //需要按钮的宽度，起始点位置
    NSInteger index = 0;
    NSInteger count = array.count;
    CGFloat width = (self.bounds.size.width - (count + 1) * kButtonSpace) / count;
    CGFloat height = self.bounds.size.height;
    
    for(NSString *text in array){
    
        MyButton *button = [MyButton buttonWithType:UIButtonTypeCustom];

        CGFloat startX = kButtonSpace + index * (width + kButtonSpace);
        [button setFrame:CGRectMake(startX, kButtonSpace / 2+6, width, height - 10)];
        
        [button setTitle:text forState:UIControlStateNormal];
        [button setTag:index];
        
        button.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(18.0f )];
        [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    
        [self addSubview:button];
        
        //test coding
        //[button setSelectedMyButton:YES];
        
        index++;
    }
}

#pragma mark - 按钮监听方法
-(void)tapButton:(MyButton *)button
{

    //方法1:遍历所有的按钮，将selectedMyButton设置为NO，取消所有的下方红线
    //方法2:在属性中记录前一次选中的按钮，将该按钮的属性设置为NO
    if (self.selectButton != nil && self.selectButton != button) {
        [self.selectButton setSelectedMyButton:NO];
    }
    
    //通过设置当前按钮selectedMyButton属性，在下方绘制红线
    [button setSelectedMyButton:YES];
    self.selectButton = button;
    
    switch (button.tag) {
        case kButtonEarser:
            //以变量的方式调用视图控制器的块代码
            _toolViewSelectEraserBlock();
            [self forceHideView:nil];
            break;
        case kButtonColor:
            //点击按钮时强行关闭当前显示的子视图
            [self forceHideView:self.colorView];
            
            //显示/隐藏颜色选择视图
            [self showHideColorView];
            break;
        case kButtonLineWidth:
            [self forceHideView:self.lineWidthView];
            //显示/隐藏线宽选择视图
            [self showHideLineWidthView];
            break;
        case kButtonUndo:
            //以变量的方式调用视图控制器的块代码
            _toolViewSelectUndoBlock();
            [self forceHideView:nil];
            break;
        case kButtonClearScreen:
            //以变量的方式调用视图控制器的块代码
            _toolViewSelectClearScreenBlock();
            [self forceHideView:nil];
            break;
        case kButtonSave:
            
            _toolViewSelectSaveBlock();
            [self forceHideView:nil];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 子视图操作方法
#pragma mark 强行隐藏当前显示的子视图
//如果显示的视图与传入的比较视图相同，则不再关闭
-(void)forceHideView:(UIView *)compareView
{
    //1.用属性记录当前显示的子视图，强行关闭视图即可
    //2.遍历所有子视图，如果处于显示状态，则将其关闭
    //3.直接判断子视图，此方法仅适用于子视图数量极少情况
    UIView *view = nil;
    if (self.colorView.frame.origin.y > 0) {
        view = self.colorView;
    }else if (self.lineWidthView.frame.origin.y > 0){
        view = self.lineWidthView;
    }else{
        return;
    }
    
    if (view == compareView) {
        return;
    }
    
    //视图
    CGRect toFrame = view.frame;
    //工具条视图边框
    CGRect toolFrame = self.frame;

    toFrame.origin.y = -64;
    toolFrame.size.height = 64;
    
    [UIView animateWithDuration:0.5f animations:^{
        [self setFrame:toolFrame];
        [view setFrame:toFrame];
    }];
}

#pragma mark 显示/隐藏指定视图
-(void)showHideView:(UIView *)view
{
    //动画显示视图
    CGRect toFrame = view.frame;
    //工具条视图边框
    CGRect toolFrame = self.frame;
    if (toFrame.origin.y < 0) {
        //隐藏时显示
        toFrame.origin.y = 58;  //控制颜色高距离,红线请去MyButton修改
        toolFrame.size.height = 88;
    }else{
        toFrame.origin.y = -64;
        toolFrame.size.height = 64;
    }
    
    [UIView animateWithDuration:0.5f animations:^{
        [self setFrame:toolFrame];
        [view setFrame:toFrame];
    }];
}

#pragma mark 显示/隐藏线宽选择视图
-(void)showHideLineWidthView
{
    //1.懒加载线宽视图
    if (self.lineWidthView == nil) {
        SelectLineWidthView *view = [[SelectLineWidthView alloc]initWithFrame:CGRectMake(0, -30, kScreenWidth, 30) afterSelectLineWidth:^(CGFloat lineWidth) {
            _selectLineWidthBlock(lineWidth);
            [self forceHideView:nil];
            
        }];
        
        [self addSubview:view];
        
        self.lineWidthView = view;
        
    }
    //2.动画显示线宽视图
    [self showHideView:self.lineWidthView];
}

#pragma mark 显示/隐藏颜色选择视图
-(void)showHideColorView
{
    //1.懒加载颜色视图
    if (self.colorView == nil) {
        SelectColorView *view = [[SelectColorView alloc]initWithFrame:CGRectMake(0, -30, kScreenWidth, 30) afterSelectColor:^(UIColor *color){
            
            //以函数的方式调用块代码变量
            _selectColorBlock(color);
            
            //选择颜色后，强行关闭颜色选择子视图
            [self forceHideView:nil];
            
        }];
        
        [self addSubview:view];
        
        self.colorView = view;
    }
    //2.动画显示颜色视图
    [self showHideView:self.colorView];
}

@end
