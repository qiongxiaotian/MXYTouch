//
//  UIImage+Extension.m
//  Touch
//
//  Created by mxy on 2017/10/25.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)


+ (UIImage *)imageWithColor:(UIColor *)color{

    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //创建一个基于位图的上下文，并将其设置为当前上下文
    UIGraphicsBeginImageContext(rect.size);

    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);//设置填充颜色
    CGContextFillRect(contextRef, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//创建图形位图
    UIGraphicsGetCurrentContext();

    return image;
}

+ (UIImage *(^)(UIColor *))withColor{
    return ^(UIColor * color){
        return [UIImage imageWithColor:color];
    };
}

@end
