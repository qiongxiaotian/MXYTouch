//
//  UIView+Extension.h
//  Touch
//
//  Created by mxy on 2017/10/25.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

- (void (^)(UIView *))addSubview;
- (void (^)(NSArray *))addSubviews;

@end
