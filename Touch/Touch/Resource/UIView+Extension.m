//
//  UIView+Extension.m
//  Touch
//
//  Created by mxy on 2017/10/25.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)addSubviews:(NSArray *)views{
    for (id view in views) {
        if (![view isKindOfClass:[UIView class]]) {
            //判断不是view跳出这次循环
            continue;
        }
        [self addSubview:view];
    }
}

- (void (^)(UIView *))addSubview{
    return ^(UIView *sub){
        [self addSubview:sub];
        return ;
    };
}

- (void (^)(NSArray *))addSubviews{
    return ^(NSArray *subs){
        [self addSubviews:subs];
        return ;
    };
}

@end
