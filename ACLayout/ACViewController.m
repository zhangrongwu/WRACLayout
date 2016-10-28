//
//  ACViewController.m
//  WRACLayout
//
//  Created by zhangrongwu on 16/10/25.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "ACViewController.h"
#import "ICAtomView.h"
#import "ICACModel.h"
#import "MJExtension.h"
#import "Masonry.h"
#import "ICConfig.h"

@interface ACViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)ICAtomView *atomView;

@property (nonatomic, strong)UITableView *tableView;

@end
@implementation ACViewController
#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setNav];
    [self getData];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - CustomDelegate
// 外部代理
#pragma mark - event response
// 按钮点击方法
#pragma mark - private methods
// 设置页面布局
- (void)setUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
// 设置navigation
- (void)setNav {
    
}
// 网络请求
- (void)getData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"geojson"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *list = [jsonObject objectForKey:@"data"];
    NSMutableArray *workbenchList = [[NSMutableArray alloc] init];
    [list enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ICACModel *model = [ICACModel mj_objectWithKeyValues:obj];
        [workbenchList addObject:model];
    }];
    self.atomView.workbenchList = workbenchList;
    self.tableView.tableHeaderView = self.atomView;
    [self setUI];
}

#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.userInteractionEnabled = YES;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)routerEventWithName:(NSString *)eventName
                   userInfo:(NSDictionary *)userInfo {
    if ([eventName isEqualToString:ICRouterEventAtomicTapEventName]) {
        NSLog(@"%@", userInfo[@"url"]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(ICAtomView *)atomView {
    if (!_atomView) {
        _atomView = [[ICAtomView alloc] initWithFrame:CGRectMake(0, 0, App_Frame_Width, 0)];
    }
    return _atomView;
}
@end
