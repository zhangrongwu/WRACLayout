//
//  UIResponder+Router.m
//  WRACLayout
//
//  Created by zhangrongwu on 16/10/25.
//  Copyright © 2016年 iCom. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

@end
