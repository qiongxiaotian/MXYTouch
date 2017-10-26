//
//  UILabel+Extension.m
//  Touch
//
//  Created by mxy on 2017/10/26.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (UILabel *(^)(UILabelMakerBlock))maker{
    return ^UILabel * (UILabelMakerBlock block){
        UILabel *lable = [[UILabel alloc]init];
        UILabelMaker *maker = [[UILabelMaker alloc]initWith:lable];
        block(maker);
        return lable;
    };
}

+ (UILabel *(^)(CGRect))initWithFrame{
    return ^UILabel *(CGRect rect){
        UILabel *lable = [[UILabel alloc]initWithFrame:rect];
        return lable;
    };
}
- (UILabel *(^)(UILabelMakerBlock))maker{
    return ^UILabel *(UILabelMakerBlock block){
        UILabelMaker *maker = [[UILabelMaker alloc]initWith:self];
        block(maker);
        return self;
    };
}

+ (UILabel *)init:(void (^)(UILabelMaker *))block{
    return [self initWithFrame:CGRectZero maker:block];
}

+ (UILabel *)initWithFrame:(CGRect)aframe maker:(void (^)(UILabelMaker *))block{
    UILabel *label = [[UILabel alloc]initWithFrame:aframe];
    UILabelMaker *maker = [[UILabelMaker alloc]initWith:label];
    block(maker);
    return maker.result;
}

- (void)formatter{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self.text];
    NSRange lastRange = NSMakeRange(self.text.length-1,1);
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:lastRange];
    self.attributedText = attributedStr;
}

@end
@implementation UILabelMaker
{
    UILabel * _lable;
}

- (instancetype)initWith:(id)obj{
    if (self = [super initWith:obj]) {
        _lable = self.result;
    }
    return self;
}

- (UILabelMaker *(^)(NSString *))setText{
    return ^ UILabelMaker * (NSString *text){
        [_lable setText:text];
        return self;
    };
}

- (UILabelMaker *(^)(UIFont *))setFont{
    return ^ UILabelMaker * (UIFont *font){
        [_lable setFont:font];
        return self;
    };
}

- (UILabelMaker *(^)(UIColor *))setTextColor{
    return ^ UILabelMaker * (UIColor * color){
        [_lable setTextColor:color];
        return self;
    };
}

- (UILabelMaker *(^)(UIColor *))setShadowColor{
    return ^ UILabelMaker * (UIColor * color){
        [_lable setShadowColor:color];
        return self;
    };
}

- (UILabelMaker *(^)(CGSize))setShadowOffset{
    return ^ UILabelMaker * (CGSize size){
        [_lable setShadowOffset:size];
        return self;
    };

}

- (UILabelMaker *(^)(NSTextAlignment))setTextAlignment{
    return ^ UILabelMaker * (NSTextAlignment alignment){
        [_lable setTextAlignment:alignment];
        return self;
    };
}

- (UILabelMaker *(^)(NSLineBreakMode))setLineBreakMode{
    return ^ UILabelMaker * (NSLineBreakMode mode){
        [_lable setLineBreakMode:mode];
        return self;
    };
}

- (UILabelMaker *(^)(NSAttributedString *))setAttributedText{
    return ^ UILabelMaker * (NSAttributedString * attributed){
        [_lable setAttributedText:attributed];
        return self;
    };
}

- (UILabelMaker *(^)(UIColor *))setHighlightedTextColor{
    return ^ UILabelMaker * (UIColor *color){
        [_lable setHighlightedTextColor:color];
        return self;
    };
}

- (UILabelMaker *(^)(BOOL))isUserInteractionEnabled{
    return ^ UILabelMaker * (BOOL is){
        [_lable setUserInteractionEnabled:is];
        return self;
    };
}

- (UILabelMaker *(^)(BOOL))isEnabled{
    return ^ UILabelMaker * (BOOL is){
        [_lable setEnabled:is];
        return self;
    };
}

- (UILabelMaker *(^)(NSInteger))numberOfLines{
    return ^ UILabelMaker * (NSInteger number){
        [_lable setNumberOfLines:number];
        return self;
    };
}
@end
