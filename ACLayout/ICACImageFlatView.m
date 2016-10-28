//
//  ICACImageFlatView.m
//  ICome
//
//  Created by zhangrongwu on 16/10/18.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "ICACImageFlatView.h"

@implementation ICACImageFlatView
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
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
}


-(void)setModel:(ICACViewTypeModel *)model {
    [super setModel:model];
    [self.viImageView sd_setImageWithURL:[NSURL URLWithString:self.model.viewClass.imageUrl]];
    
    [self layoutSubview];
}

@end
