//
//  WXTabBarButton.h
//  WXMovie
//
//  Created by JayWon on 15/9/6.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTabBarButton : UIControl
{
    
    
    
}
@property(nonatomic,strong) UIImageView *imgView;
@property(nonatomic,strong) UILabel *titleLabel;
-(instancetype)initWithFrame:(CGRect)frame
                 withImgName:(NSString *)imgName
                   withTitle:(NSString *)title
                  sinImgName:(NSString *)simgName;

@end
