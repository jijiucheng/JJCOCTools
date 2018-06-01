//
//  UIImage+Clip.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/6/1.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "UIImage+Clip.h"

@implementation UIImage (Clip)


/**
 裁剪图片（不带边框圆形与带边框圆形）
 
 @param imageName   所要裁剪图片名称
 @param borderWidth 边框宽度（不带边框时传 0）
 @param borderColor 边框颜色（不带边框时传 nil）
 @return 返回裁剪后的图片
 */
+ (UIImage *)jjc_image_clipRoundWithImageName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    // 1、计算上下文尺寸，并开启上下文（参数：上下文尺寸，设置透明，缩放比）
    CGSize contextSize;
    if (borderWidth == 0) {
        contextSize = image.size;
    } else {
        contextSize = CGSizeMake(image.size.width+borderWidth*2, image.size.height+borderWidth*2);
    }
    UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0);
    
    // 设置裁剪区域起点坐标
    // 不带边框时默认是从左上角开始；带边框则要考虑到边框的间隙，此时坐标有偏移，且为边框宽度
    CGPoint clipPoint;
    if (borderWidth == 0) {
        clipPoint = CGPointZero;
    } else {
        clipPoint = CGPointMake(borderWidth, borderWidth);
        // 带边框时，绘制底部大圆并填充显示
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, contextSize.width, contextSize.height)];
        [borderColor set];
        [path fill];
    }
    
    // 2、根据贝塞尔曲线路径设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(clipPoint.x, clipPoint.y, image.size.width, image.size.height)];
    [clipPath addClip];
    // 3、将图片绘制到上下文中（超过裁剪区域以外的内容都给裁剪掉）
    [image drawAtPoint:clipPoint];
    
    // 4、从上下文中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5、关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end



