//
//  ICACModel.h
//  ICome
//
//  Created by zhangrongwu on 16/10/19.
//  Copyright © 2016年 iCom. All rights reserved.
//  每一行对应的model

#import <Foundation/Foundation.h>

@interface ICACModel : NSObject

@property (nonatomic, assign)NSInteger rowHeight; //行高，单位pix
@property (nonatomic, assign)float lineSpace; //行间距，单位pix。设置本行与上一行之间的距离
@property (nonatomic, strong)NSString *rowBgColor; // 行的背景颜色
@property (nonatomic, strong)NSMutableArray *views;

@end
