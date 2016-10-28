//
//  ICACViewClassModel.h
//  ICome
//
//  Created by zhangrongwu on 16/10/19.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICACViewClassModel : NSObject
@property (nonatomic, assign)NSInteger textTop;//text显示时距离该列的上边框的距离。单位 px
@property (nonatomic, assign)NSInteger textLeft; //text显示时距离该列左边框的距离。单位 px
@property (nonatomic, assign)NSInteger fontSize;//text的字体大小。单位 px
@property (nonatomic, strong)NSString *text;//文本内容
@property (nonatomic, strong)NSString *fgColor;//前景颜色值，格式如 #0a0a0a0a
@property (nonatomic, strong)NSString *bgColor;//背景颜色值，格式如 #0a0a0a0a
@property (nonatomic, assign)NSInteger imageTop;//图片显示时距离该列的上边框的距离。单位 px
@property (nonatomic, assign)NSInteger imageLeft;//图片显示时距离该列的左边框的距离。单位 px
@property (nonatomic, strong)NSString *imageUrl;//图片的链接地址
@property (nonatomic, strong)NSString *url; //点击时打开的链接地址
@property (nonatomic, strong)NSString *clickBgColor;//鼠标点击下去时背景颜色值，格式如 #0b0b0b0b


@property (nonatomic, assign)NSInteger borderTop;//上边框的宽度，0 表示不显示边框
@property (nonatomic, assign)NSInteger borderRight;//右边框的宽度，0 表示不显示边框
@property (nonatomic, assign)NSInteger borderBottom;//底边框的宽度，0 表示不显示边框
@property (nonatomic, assign)NSInteger borderLeft;//左边框的宽度，0 表示不显示边框

@property (nonatomic, strong)NSString *borderColor;// 当边框的宽度不为0时，边框的颜色，格式如 #0a0a0a0a
@property (nonatomic, assign)float width;// 该列的列宽与所在行的行宽的比率。
@property (nonatomic, assign)float height; // 该列的列高与所在行的行高的比率。
@property (nonatomic, assign)NSInteger status;//图标右上角显示红点的状态位。0 不显示红点 非 0 显示红点

@end
