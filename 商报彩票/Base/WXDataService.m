//
//  WXDataService.m
//  WXMovie
//
//  Created by JayWon on 15/9/9.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "WXDataService.h"

@implementation WXDataService

+(id)requestDataWithJsonFile:(NSString *)fileName
{
    //（1）取得JSON文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
    //（2）iOS5以后使用NSJSONSerialization，在iOS5之前使用第三方的解析方式：JSONKit  SBJSON
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    
    /*
     NSJSONReadingMutableContainers     //可变容器
     NSJSONReadingMutableLeaves         //可变字符串
     NSJSONReadingAllowFragments        //返回的数据不是字典和数组
     */
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return result;
}

@end
