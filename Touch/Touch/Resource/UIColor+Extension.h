//
//  UIColor+Extension.h
//  Touch
//
//  Created by mxy on 2017/10/25.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor * (^)(NSString *))hex;
+ (UIColor * (^)(int r,int g,int b))rgb;

+ (UIColor * (^)(void))black;
+ (UIColor * (^)(void))darkGray;
+ (UIColor * (^)(void))lightGray;
+ (UIColor * (^)(void))white;
+ (UIColor * (^)(void))gray;
+ (UIColor * (^)(void))red;
+ (UIColor * (^)(void))green;
+ (UIColor * (^)(void))yellow;
+ (UIColor * (^)(void))blue;
+ (UIColor * (^)(void))cyan;
+ (UIColor * (^)(void))magenta;
+ (UIColor * (^)(void))orange;
+ (UIColor * (^)(void))purple;
+ (UIColor * (^)(void))brown;
+ (UIColor * (^)(void))clear;

@end
