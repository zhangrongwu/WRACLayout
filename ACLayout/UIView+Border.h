//
//  UIView+Border.h
//  WRACLayout
//
//  Created by zhangrongwu on 16/10/25.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)
// 下边框
-(void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
// 下边框
-(void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
// 右边框
-(void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
// 上边框
-(void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
@end
