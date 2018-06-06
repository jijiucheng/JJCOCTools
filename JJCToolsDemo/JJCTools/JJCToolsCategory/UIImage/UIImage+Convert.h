//
//  UIImage+Convert.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/6/6.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 UIImage+Convert
 创建：2018.06.06
 更新：2018.06.06
 
 
 1、该扩展主要用于给 UIImage 进行一些转换处理；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>

@interface UIImage (Convert)


/**
 颜色转图片（带透明度）

 @param color    指定颜色
 @param alpha    透明度
 @return 转换后的图片
 */
+ (UIImage *)jjc_image_getImageWithColor:(UIColor *)color alpha:(CGFloat)alpha;


/**
 颜色转图片（不带透明度）
 
 @param color 指定颜色
 @return 转换后的图片
 */
+ (UIImage *)jjc_image_getImageWithColor:(UIColor *)color;

@end
