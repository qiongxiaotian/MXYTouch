//
//  UIButton+Extension.h
//  Touch
//
//  Created by mxy on 2017/10/25.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentMaker.h"


typedef void(^TouchBlock)(void);

@interface UIButtonMaker : ParentMaker

- (UIButtonMaker *(^)(NSString *))setTitle;
- (UIButtonMaker *(^)(UIControlState))forState;
- (UIButtonMaker *(^)(UIColor *))setTitleColor;
- (UIButtonMaker *(^)(UIImage *))setImage;
- (UIButtonMaker *(^)(UIImage *))setBackgroundImage;
- (UIButtonMaker *(^)(UIColor *))setBackgroundColor;
- (UIButtonMaker *(^)(UIFont *))setFont;

@end

typedef void(^UIButtonMakerBlock)(UIButtonMaker *);
@interface UIButton (Extension)

+ (UIButton *(^)(CGRect))initWithFrame;
+ (UIButton *(^)(UIButtonType))initWithType;
+ (UIButton *(^)(UIButtonMakerBlock))maker;
- (UIButton *(^)(UIButtonMakerBlock))maker;

+ (UIButton *)initWithType:(UIButtonType)type frame:(CGRect)aframe maker:(void(^)(UIButtonMaker *make))block;

+ (UIButton *)init:(void (^)(UIButtonMaker *make))block;

+ (UIButton *)initWithFrame:(CGRect)aframe maker:(void (^)(UIButtonMaker *make))block;

- (void(^)(TouchBlock))touchUpInside;


@end
