//
//  ICACBaseView.m
//  ICome
//
//  Created by zhangrongwu on 16/10/18.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "ICACBaseView.h"

@implementation ICACBaseView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        // 根据数据添加border
        //        // 设置选中与未选中背景颜色
    }
    return self;
}
-(void)setModel:(ICACViewTypeModel *)model {
    _model = model;
    
    UIColor *borderColor = [UIColor colorWithHexString:model.viewClass.borderColor];
    
    if (model.viewClass.borderTop != 0) {
        [self addTopBorderWithColor:borderColor andWidth:1];
    }
    if (model.viewClass.borderLeft != 0) {
        [self addLeftBorderWithColor:borderColor andWidth:1];
    }
    if (model.viewClass.borderBottom != 0) {
        [self addBottomBorderWithColor:borderColor andWidth:1];
    }
    if (model.viewClass.borderRight != 0) {
        [self addRightBorderWithColor:borderColor andWidth:1];
    }
    
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:model.viewClass.bgColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:model.viewClass.clickBgColor]] forState:UIControlStateHighlighted];
    
    self.viTitleLabel.font = [UIFont systemFontOfSize:model.viewClass.fontSize];
    self.viTitleLabel.textColor = [UIColor colorWithHexString:model.viewClass.fgColor];;
}

-(UIImageView *)viImageView {
    if (!_viImageView) {
        _viImageView = [[UIImageView alloc] init];
        [self addSubview:_viImageView];
    }
    return _viImageView;
}

-(UILabel *)viTitleLabel {
    if (!_viTitleLabel) {
        _viTitleLabel = [[UILabel alloc] init];
        _viTitleLabel.textColor = [UIColor grayColor];
        _viTitleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_viTitleLabel];
    }
    return _viTitleLabel;
}

-(UILabel *)viDescLabel {
    if (!_viDescLabel) {
        _viDescLabel = [[UILabel alloc] init];
        [self addSubview:_viDescLabel];
    }
    return _viDescLabel;
}

-(UIView *)statusView {
    if (!_statusView) {
        _statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    }
    return _statusView;
}

@end



