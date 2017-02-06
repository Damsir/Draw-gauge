//
//  viewcell.m
//  drawBoard
//
//  Created by 涛程 on 16/12/1.
//  Copyright © 2016年 dengwei. All rights reserved.
//

#import "viewcell.h"

//一行九格，x五格，widthcell22一格，widthcell28三格
#define widthcell22   TRANS_VALUE(23.0f )
#define widthcell28   TRANS_VALUE(29.0f )
#define x             TRANS_VALUE(40.0f )
#define y             (self.bounds.size.height)
#define BtnHeight     TRANS_VALUE(10.0f )
#define ViewDown      TRANS_VALUE(1.0f )

//画规线条颜色
#define backgrodColor [UIColor grayColor]
//超深绿色
#define SuperDarkgreenColor [UIColor  colorWithRed:124/255.00 green:179/255.00 blue:150/255.00 alpha:1.0f]
//深绿色
#define DarkgreenColor [UIColor  colorWithRed:126/255.00 green:202/255.00 blue:129/255.00 alpha:1.0f]
//浅绿
#define LightgreenColor [UIColor  colorWithRed:218/255.00 green:240/255.00 blue:185/255.00 alpha:1.0f]

@implementation viewcell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
//        [self setBackgroundColor:backgrodColor];
        self.backgroundColor =backgrodColor;
        //  背景view
        //1
        UIView *view0 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, x,y)];
//        [view0 setBackgroundColor:DarkgreenColor];
        view0.backgroundColor = DarkgreenColor;
        [self addSubview:view0];
        //2
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(x+1, 0, widthcell22, y)];
        view1.backgroundColor = LightgreenColor;
        [self addSubview:view1];
        //3
        UIView *bbcolor = [[UIView alloc]initWithFrame:CGRectMake(x+widthcell22+1, 0, TRANS_VALUE(2.0f ), self.bounds.size.height)];
        [bbcolor setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bbcolor];//线条
        
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(x+widthcell22+3, 0, x, y)];
        view2.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:view2];
        UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(x*2+widthcell22+4, 0, x, y)];
        view3.backgroundColor = [UIColor whiteColor];
        [self addSubview:view3];
        UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(x*3+widthcell22+5, 0, x, y)];
        view4.backgroundColor = [UIColor whiteColor];
        [self addSubview:view4];
        
        UIView *view5 = [[UIView alloc]initWithFrame:CGRectMake(x*4+widthcell22+6, 0, x, y)];
        view5.backgroundColor = [UIColor whiteColor];
        [self addSubview:view5];
        
        //4
        UIView *bcolor = [[UIView alloc]initWithFrame:CGRectMake(x*5+widthcell22+6, 0, TRANS_VALUE(2.0f ), self.bounds.size.height)];
        [bcolor setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bcolor];//线条
        
        UIView *view6 = [[UIView alloc]initWithFrame:CGRectMake(x*5+widthcell22+8, 0, widthcell28, y)];
        view6.backgroundColor = LightgreenColor;
        [self addSubview:view6];
        
        UIView *view7 = [[UIView alloc]initWithFrame:CGRectMake(x*5+widthcell28+widthcell22+9, 0, widthcell28, y)];
        view7.backgroundColor = LightgreenColor;
        [self addSubview:view7];
        
        UIView *view8 = [[UIView alloc]initWithFrame:CGRectMake(x*5+widthcell28*2+widthcell22+10, 0, widthcell28, y)];
        view8.backgroundColor = LightgreenColor;
        [self addSubview:view8];
        
        //按钮
        _btn0 = [[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, x, BtnHeight)];
        [_btn0 setTitle:@"1888" forState:UIControlStateNormal];
        [_btn0 setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        _btn0.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(14.0f )];
        [view0 addSubview:_btn0];

        _btn1=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, widthcell22, BtnHeight)];
        [_btn1 setTitle:nil forState:UIControlStateNormal];
        [_btn1 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(14.0f )];
        [view1 addSubview:_btn1];
        
        _btn2=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, x, BtnHeight)];
        [_btn2 setTitle:nil forState:UIControlStateNormal];
        [_btn2 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn2.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(18.0f )];
        [view2 addSubview:_btn2];
        
        _btn3=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, x, BtnHeight)];
        [_btn3 setTitle:nil forState:UIControlStateNormal];
        [_btn3 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn3.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(18.0f )];
        [view3 addSubview:_btn3];
        
        _btn4=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, x, BtnHeight)];
        [_btn4 setTitle:nil forState:UIControlStateNormal];
        [_btn4 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn4.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(18.0f )];
        [view4 addSubview:_btn4];
        
        _btn5=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, x, BtnHeight)];
        [_btn5 setTitle:@"8" forState:UIControlStateNormal];
        [_btn5 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn5.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(18.0f )];
        [view5 addSubview:_btn5];
        
        _btn6=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, widthcell28, BtnHeight)];
        [_btn6 setTitle:@"8" forState:UIControlStateNormal];
        [_btn6 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn6.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(14.0f )];
        [view6 addSubview:_btn6];
        
        _btn7=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, widthcell28, BtnHeight)];
        [_btn7 setTitle:@"8" forState:UIControlStateNormal];
        [_btn7 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn7.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(14.0f )];
        [view7 addSubview:_btn7];
        
        _btn8=[[UIButton alloc]initWithFrame:CGRectMake(0, y/2-BtnHeight/2, widthcell28, BtnHeight)];
        [_btn8 setTitle:@"8" forState:UIControlStateNormal];
        [_btn8 setTitleColor:SuperDarkgreenColor forState:UIControlStateNormal];
        _btn8.titleLabel.font = [UIFont systemFontOfSize: TRANS_VALUE(14.0f )];
        [view8 addSubview:_btn8];
        
        
        
        
    }
    
    return self;
}

- (void)setModel:(viewcellModel *)model{
    _model = model;
    int movieID = [_model.movieID intValue];
    int type = [_model.type intValue];
    int title = [_model.title intValue];
    int summary = [_model.summary intValue];
    int image = [_model.image intValue];
    
    
    if (!movieID) {
        //需要加判断，当没有值的时候不显示
        [_btn0 setTitle:nil forState:UIControlStateNormal];
    }else{
        //需要加判断，当没有值的时候不显示
        [_btn0 setTitle:[NSString stringWithFormat:@"%d",movieID] forState:UIControlStateNormal];
    }
    if (!type) {
        //需要加判断，当没有值的时候不显示
        [_btn1 setTitle:nil forState:UIControlStateNormal];
    }else{
        //需要加判断，当没有值的时候不显示
        [_btn1 setTitle:[NSString stringWithFormat:@"%d",type] forState:UIControlStateNormal];
    }
    if (!title) {
        //需要加判断，当没有值的时候不显示
        [_btn2 setTitle:nil forState:UIControlStateNormal];
    }else{
        //需要加判断，当没有值的时候不显示
        [_btn2 setTitle:[NSString stringWithFormat:@"%d",title] forState:UIControlStateNormal];
    }
    if (!summary) {
        //需要加判断，当没有值的时候不显示
        [_btn3 setTitle:nil forState:UIControlStateNormal];
    }else{
        //需要加判断，当没有值的时候不显示
        [_btn3 setTitle:[NSString stringWithFormat:@"%d",image] forState:UIControlStateNormal];
    }
    if (!image) {
        //需要加判断，当没有值的时候不显示
        [_btn4 setTitle:nil forState:UIControlStateNormal];
    }else{
        //需要加判断，当没有值的时候不显示
        [_btn4 setTitle:[NSString stringWithFormat:@"%d",image] forState:UIControlStateNormal];
    }
    
    
    //线条
    if (type == 2) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 6) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 10) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 14) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 18) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 22) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 26) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 30) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 34) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 38) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
    if (type == 40) {
        UIView *bb8 = [[UIView alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(42.0f ), self.bounds.size.width, ViewDown)];
        [bb8 setBackgroundColor:SuperDarkgreenColor];
        [self addSubview:bb8];
    }
}



@end
