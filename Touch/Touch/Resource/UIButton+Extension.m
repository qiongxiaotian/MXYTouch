//
//  UIButton+Extension.m
//  Touch
//
//  Created by mxy on 2017/10/25.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "UIButton+Extension.h"
#import "UIImage+Extension.h"
#import <objc/runtime.h>
//这是一个静态无类型指针touchKey然后用指针滴地址赋给touchKey就是一个初始化了。也就是一个指向指针滴指针。
static void * touchKey = &touchKey;

@implementation UIButton (Extension)

+ (UIButton *)init:(void (^)(UIButtonMaker *))block{
    return [self initWithType:UIButtonTypeSystem frame:CGRectZero maker:block];
}

+ (UIButton *)initWithType:(UIButtonType)type frame:(CGRect)aframe maker:(void (^)(UIButtonMaker *))block{
    UIButton *button = [UIButton buttonWithType:type];
    [button setFrame:aframe];
    UIButtonMaker * instance = [[UIButtonMaker alloc]initWith:button];
    block(instance);
    return button;
}

+ (UIButton *)initWithFrame:(CGRect)aframe maker:(void (^)(UIButtonMaker *))block{
    return [self initWithType:UIButtonTypeSystem frame:aframe maker:block];
}

+ (UIButton *(^)(CGRect))initWithFrame{
    return ^UIButton *(CGRect rect){
        UIButton *button = [[UIButton alloc]initWithFrame:rect];
        return button;
    };
}

+ (UIButton *(^)(UIButtonType))initWithType{
    return ^UIButton *(UIButtonType type){
        UIButton *button = [UIButton buttonWithType:type];
        return button;
    };

}
- (UIButton *(^)(UIButtonMakerBlock))maker{
    return ^UIButton * (UIButtonMakerBlock block){
        UIButtonMaker *instance = [[UIButtonMaker alloc]initWith:self];
        block(instance);
        return self;
    };
}
+ (UIButton *(^)(UIButtonMakerBlock))maker{
    return ^UIButton * (UIButtonMakerBlock block){
        UIButton *button = [[UIButton alloc]init];
        UIButtonMaker *instance = [[UIButtonMaker alloc]initWith:button];
        block(instance);
        return button;
    };
}

- (void (^)(TouchBlock))touchUpInside{
    return ^(TouchBlock block){
        //将self和block关联起来
        objc_setAssociatedObject(self, touchKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(touchUpInSide:) forControlEvents: UIControlEventTouchUpInside];
        return ;
    };
}
- (void)touchUpInSide:(UIButton *)button{
    //根据关联获取block
    TouchBlock block = objc_getAssociatedObject(self, touchKey);
    if (block) {
        block();
    }
}
@end

@implementation UIButtonMaker
{
    NSString * _title;
    UIColor * _titleColor;
    UIImage * _backgroundImage;
    UIImage * _iconImage;
    UIButton * _button;
}

- (instancetype)initWith:(id)obj{
    if (self = [super initWith:obj]) {
        _button = obj;
    }
    return self;
}

- (UIButtonMaker *(^)(UIFont *))setFont{
    return ^UIButtonMaker * (UIFont *font){
        [_button.titleLabel setFont:font];
        return self;
    };
}

- (UIButtonMaker *(^)(NSString *))setTitle{
    return ^UIButtonMaker * (NSString *title){
        _title = title;
        return self;
    };
}
- (UIButtonMaker *(^)(UIColor *))setTitleColor{
    return ^UIButtonMaker * (UIColor *color){
        _titleColor = color;
        return self;
    };
}

- (UIButtonMaker *(^)(UIImage *))setImage{
    return ^UIButtonMaker * (UIImage *image){
        _iconImage = image;
        return self;
    };
}

- (UIButtonMaker *(^)(UIImage *))setBackgroundImage{
    return ^UIButtonMaker * (UIImage *image){
        _backgroundImage = image;
        return self;
    };
}

- (UIButtonMaker *(^)(UIColor *))setBackgroundColor{
    return ^UIButtonMaker *(UIColor *color){
        _backgroundImage = UIImage.withColor(color);
        return self;
    };
}

- (UIButtonMaker *(^)(UIControlState))forState{
    return ^UIButtonMaker * (UIControlState state){
        if (_title) {
            [_button setTitle:_title forState:state];
            _title = nil;
        }else{
            assert(@"SetTitle or Color need for state");
        }

        if (_titleColor) {
            [_button setTitleColor:_titleColor forState:state];
            _titleColor = nil;
        }
        if (_backgroundImage) {
            [_button setBackgroundImage:_backgroundImage forState:state];
            _backgroundImage = nil;
        }
        if (_iconImage) {
            [_button setImage:_iconImage forState:state];
            _iconImage = nil;
        }
        return self;
    };
}



@end
