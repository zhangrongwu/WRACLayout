//
//  ICACImageTextSquareView.m
//  ICome
//
//  Created by zhangrongwu on 16/10/18.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "ICACImageTextSquareView.h"

@implementation ICACImageTextSquareView
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
        make.top.equalTo(self.mas_top).offset(self.model.viewClass.imageTop);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.viTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.model.viewClass.textTop);
        make.centerX.equalTo(self.mas_centerX);
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
