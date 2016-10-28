//
//  ICACViewTypeModel.h
//  ICome
//
//  Created by zhangrongwu on 16/10/19.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICACViewClassModel.h"

@interface ICACViewTypeModel : NSObject
// 距离左边百分比
@property (nonatomic, assign)float left; //该列的左边框在本行中显示位置。

// 距离上边百分比
@property (nonatomic, assign)float top; //该列的上边框在本行中纵向显示位置。
// view type
@property (nonatomic, strong)NSString *viewType;
// 内部信息
@property (nonatomic, strong)ICACViewClassModel *viewClass;

@end
