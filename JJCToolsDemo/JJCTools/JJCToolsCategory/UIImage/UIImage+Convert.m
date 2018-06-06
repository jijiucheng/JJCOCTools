//
//  UIImage+Convert.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/6/6.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "UIImage+Convert.h"

@implementation UIImage (Convert)


/**
 颜色转图片（带透明度）
 
 @param color    指定颜色
 @param alpha    透明度
 @return 转换后的图片
 */
+ (UIImage *)jjc_image_getImageWithColor:(UIColor *)color alpha:(CGFloat)alpha {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    if (alpha > 0 && alpha < 1) {
        CGContextScaleCTM(contextRef, 1, -1);
        CGContextTranslateCTM(contextRef, 0, -rect.size.height);
        CGContextSetBlendMode(contextRef, kCGBlendModeMultiply);
        CGContextSetAlpha(contextRef, alpha);
    }
    CGContextFillRect(contextRef, rect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


/**
 颜色转图片（不带透明度）
 
 @param color 指定颜色
 @return 转换后的图片
 */
+ (UIImage *)jjc_image_getImageWithColor:(UIColor *)color {
    
    return [self jjc_image_getImageWithColor:color alpha:1.0f];
}


@end
