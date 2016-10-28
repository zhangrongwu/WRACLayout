//
//  ICWorkbenchView.h
//  ICome
//
//  Created by zhangrongwu on 16/10/20.
//  Copyright © 2016年 iCom. All rights reserved.
//  工作台模块

#import <UIKit/UIKit.h>
@class ICACModel;
@interface ICAtomView : UIView
// 数据
@property (nonatomic, strong)NSMutableArray<ICACModel *> *workbenchList;


@property (nonatomic, assign)NSInteger viewHeight;

@end






@interface ICWorkbenchRowView : UIView
@property (nonatomic, strong)NSMutableArray *views;
@end
