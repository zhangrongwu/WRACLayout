//
//  ICWorkbenchView.m
//  ICome
//
//  Created by zhangrongwu on 16/10/20.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "ICAtomView.h"
#import "ICACModel.h"
#import "ICACViewTypeModel.h"

#import "ICACImageFlatView.h"
#import "ICACImageTextFlatView.h"
#import "ICACImageTextSquareView.h"
#import "ICACTextFlatView.h"
@interface ICAtomView()

@property (nonatomic, strong)UIView *baseCell; // 布局

@end

@implementation ICAtomView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)setWorkbenchList:(NSMutableArray<ICACModel *> *)workbenchList {
    
    _workbenchList = workbenchList;
    self.baseCell = self;
    // 对应组件添加
    for (ICACModel *model in workbenchList) {
        ICWorkbenchRowView *cell = [[ICWorkbenchRowView alloc] initWithFrame:CGRectMake(0, 0, App_Frame_Width, model.rowHeight)];
        cell.views = model.views;
        [self addSubview:cell];
        [cell mas_remakeConstraints:^(MASConstraintMaker *make) {
            if ([self.baseCell isKindOfClass:[ICAtomView class]]) {
                make.top.equalTo(self.baseCell.mas_top).offset(model.lineSpace);
            } else {
                make.top.equalTo(self.baseCell.mas_bottom).offset(model.lineSpace);
            }
            make.left.equalTo(self.baseCell.mas_left);
            make.height.mas_equalTo(model.rowHeight);
            make.width.mas_equalTo(App_Frame_Width);
        }];
        self.baseCell = cell;
        cell.backgroundColor = [UIColor colorWithHexString:model.rowBgColor];
        self.viewHeight = self.viewHeight+model.lineSpace+model.rowHeight;
    }
    self.height = self.viewHeight;
}

@end



// 行
@interface ICWorkbenchRowView()

@property (nonatomic, strong)ICACTextFlatView *textFlatView;
@property (nonatomic, strong)ICACImageFlatView *imageFlatView;
@property (nonatomic, strong)ICACImageTextFlatView *imageTextFlatView;
@property (nonatomic, strong)ICACImageTextSquareView *imageTextSquareView;

@property (nonatomic, assign)NSInteger rowHeight;
@property (nonatomic, strong)UIView *baseView;

@end

@implementation ICWorkbenchRowView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.rowHeight = frame.size.height;
    }
    return self;
}

-(void)setViews:(NSMutableArray *)views {
    _views = views;
    self.baseView = self;
    for (ICACViewTypeModel *typeModel in self.views) {
        if ([typeModel.viewType isEqualToString:@"UILabel"]) {
            
            self.textFlatView = [[ICACTextFlatView alloc] initWithFrame:CGRectMake(App_Frame_Width * typeModel.left, self.rowHeight * typeModel.top, App_Frame_Width * typeModel.viewClass.width, self.rowHeight)];
            [self addSubview:_textFlatView];
            self.textFlatView.model = typeModel;
            self.baseView = self.textFlatView;
        } else if ([typeModel.viewType isEqualToString:@"UIImageTextSquare"]) {
            
            self.imageTextSquareView = [[ICACImageTextSquareView alloc] initWithFrame:CGRectMake(App_Frame_Width * typeModel.left, self.rowHeight * typeModel.top, App_Frame_Width * typeModel.viewClass.width, self.rowHeight)];
            [self addSubview:_imageTextSquareView];
            self.imageTextSquareView.model = typeModel;
            self.baseView = self.imageTextSquareView;
        } else if ([typeModel.viewType isEqualToString:@"UIImageTextFlat"]) {
            
            self.imageTextFlatView = [[ICACImageTextFlatView alloc] initWithFrame:CGRectMake(App_Frame_Width * typeModel.left, self.rowHeight * typeModel.top, App_Frame_Width * typeModel.viewClass.width, self.rowHeight * typeModel.viewClass.height)];
            [self addSubview:_imageTextFlatView];
            self.imageTextFlatView.model = typeModel;
            self.baseView = self.imageTextFlatView;
        } else if ([typeModel.viewType isEqualToString:@"UIImageFlat"]) {
            
            self.imageFlatView = [[ICACImageFlatView alloc] initWithFrame:CGRectMake(App_Frame_Width * typeModel.left, self.rowHeight * typeModel.top, App_Frame_Width * typeModel.viewClass.width, self.rowHeight)];
            [self addSubview:_imageFlatView];
            self.imageFlatView.model = typeModel;
            self.baseView = self.imageFlatView;
        }
    }
}











// 未使用 －－－－－
-(void)textFlatViewLayout:(ICACViewTypeModel *)layout  {
    self.textFlatView.frame = CGRectMake(App_Frame_Width * layout.left, self.rowHeight * layout.top, App_Frame_Width * layout.viewClass.width, self.rowHeight);
    //    [self.textFlatView mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_top).offset(self.rowHeight * layout.top);
    //        make.left.equalTo(self.mas_left).offset(App_Frame_Width * layout.left);
    //        make.width.mas_equalTo(App_Frame_Width * layout.viewClass.width);
    //        make.height.mas_equalTo(self.rowHeight);
    //    }];
}

-(void)imageTextSquareViewLayout:(ICACViewTypeModel *)layout {
    self.imageTextSquareView.frame = CGRectMake(App_Frame_Width * layout.left, self.rowHeight * layout.top, App_Frame_Width * layout.viewClass.width, self.rowHeight);
    
    //    [self.imageTextSquareView mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_top).offset(self.rowHeight * layout.top);
    //        make.left.equalTo(self.mas_left).offset(App_Frame_Width * layout.left);
    //        make.width.mas_equalTo(App_Frame_Width * layout.viewClass.width);
    //        make.height.mas_equalTo(self.rowHeight);
    //    }];
}

-(void)timageTextFlatViewLayout:(ICACViewTypeModel *)layout {
    self.imageTextFlatView.frame = CGRectMake(App_Frame_Width * layout.left, self.rowHeight * layout.top, App_Frame_Width * layout.viewClass.width, self.rowHeight * layout.viewClass.height);
    
    //    [self.imageTextFlatView mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_top).offset(self.rowHeight * layout.top);
    //        make.left.equalTo(self.mas_left).offset(App_Frame_Width * layout.left);
    //        make.width.mas_equalTo(App_Frame_Width * layout.viewClass.width);
    //        make.height.mas_equalTo(self.rowHeight * layout.viewClass.height);
    //    }];
}

-(void)imageFlatViewLayout:(ICACViewTypeModel *)layout {
    self.imageFlatView.frame = CGRectMake(App_Frame_Width * layout.left, self.rowHeight * layout.top, App_Frame_Width * layout.viewClass.width, self.rowHeight);
    
    //    [self.imageFlatView mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_top).offset(self.rowHeight * layout.top);
    //        make.left.equalTo(self.mas_left).offset(App_Frame_Width * layout.left);
    //        make.width.mas_equalTo(App_Frame_Width * layout.viewClass.width);
    //        make.height.mas_equalTo(self.rowHeight);
    //    }];
}

@end


