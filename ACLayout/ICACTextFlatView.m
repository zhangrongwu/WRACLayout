//
//  ICACTextFlatView.m
//  ICome
//
//  Created by zhangrongwu on 16/10/18.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "ICACTextFlatView.h"

@implementation ICACTextFlatView
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
    [self.viTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.model.viewClass.textLeft);
        make.top.equalTo(self.mas_top).offset(self.model.viewClass.textTop);
    }];
}

-(void)setModel:(ICACViewTypeModel *)model {
    [super setModel:model];
    self.viTitleLabel.text = model.viewClass.text;
    [self layoutSubview];
}
@end
