//
//  UIResponder+Router.h
//  WRACLayout
//
//  Created by zhangrongwu on 16/10/25.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
