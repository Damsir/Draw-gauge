//
//  WXTabBarButton.m
//  WXMovie
//
//  Created by JayWon on 15/9/6.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "WXTabBarButton.h"

#define kItemImgSize 25

@implementation WXTabBarButton

-(instancetype)initWithFrame:(CGRect)frame
                 withImgName:(NSString *)imgName
                   withTitle:(NSString *)title
                  sinImgName:(NSString *)simgName
{
    self = [super initWithFrame:frame];
    
    if (self != nil) {

        _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName] highlightedImage:[UIImage imageNamed:simgName]];
        _imgView.frame = CGRectMake((frame.size.width-kItemImgSize)/2, 5, kItemImgSize, kItemImgSize);

        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imgView];
        
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imgView.frame)+5, frame.size.width, 10)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.highlightedTextColor = [UIColor redColor];
        
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.text = title;
        
        [self addSubview:_titleLabel];
    }
    
    return self;
}
//        imgView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-kItemImgSize)/2, 5, kItemImgSize, kItemImgSize)];
//         imgView.highlighted = YES;
//        imgView.image = [UIImage imageNamed:imgName];

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
