//
//  ICACImageTextFlatView.m
//  ICome
//
//  Created by zhangrongwu on 16/10/18.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "ICACImageTextFlatView.h"

@implementation ICACImageTextFlatView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)tapAction {
    [self routerEventWithName:ICRouterEventAtomicTapEventName userInfo:@{@"url":self.model.viewClass.url}];
}

-(void)layoutSubview {
    
    [self.viImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.model.viewClass.imageLeft);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.viTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.model.viewClass.textLeft);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

-(void)setModel:(ICACViewTypeModel *)model {
    [super setModel:model];
    
    self.viTitleLabel.font = [UIFont systemFontOfSize:self.model.viewClass.fontSize];
    [self.viImageView sd_setImageWithURL:[NSURL URLWithString:self.model.viewClass.imageUrl]];
    self.viTitleLabel.text = self.model.viewClass.text;
    [self layoutSubview];
    
}

@end

