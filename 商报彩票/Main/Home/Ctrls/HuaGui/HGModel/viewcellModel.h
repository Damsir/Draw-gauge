//
//  viewcellModel.h
//  drawBoard
//
//  Created by 涛程 on 16/12/1.
//  Copyright © 2016年 dengwei. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 备注：创建多少个view，就要给type多少个顺序数字，用于显示分割线
 数据格式：
 ［｛
 "newsid" : 1111,
 "type" : 1,
 "title" : 1,
 "summary" : 1,
 "image" : 1

 ｝，｛
 ｝］
 */
@interface viewcellModel : NSObject
@property(nonatomic, strong)NSNumber *movieID;
@property(nonatomic, strong)NSNumber *type;
@property(nonatomic, strong)NSNumber *title;
@property(nonatomic, strong)NSNumber *summary;
@property(nonatomic, strong)NSNumber *image;
@end
