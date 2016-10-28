//
//  ICACBaseView.h
//  WRACLayout
//
//  Created by zhangrongwu on 16/10/25.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIResponder+Router.h"
#import "UIView+Border.h"
#import "UIImage+Image.h"
#import "ICACViewTypeModel.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Color.h"
#import "UIView+Extension.h"
#import "ICConfig.h"


@interface ICACBaseView : UIButton

@property (nonatomic, strong)UIImageView *viImageView;

@property (nonatomic, strong)UILabel *viTitleLabel;

@property (nonatomic, strong)UILabel *viDescLabel;

@property (nonatomic, strong)UIView *statusView;

@property (nonatomic, strong)ICACViewTypeModel *model;

@end
