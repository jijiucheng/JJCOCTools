//
//  UIImage+Clip.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/6/1.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 UIImage+Clip
 创建：2018.06.01
 更新：2018.06.01
 
 
 1、该扩展主要用于给 UIImage 进行裁剪处理；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

@interface UIImage (Clip)

/**
 裁剪图片（不带边框圆形与带边框圆形）

 @param imageName   所要裁剪图片名称
 @param borderWidth 边框宽度（不带边框时传 0）
 @param borderColor 边框颜色（不带边框时传 nil）
 @return 返回裁剪后的图片
 */
+ (UIImage *)jjc_image_clipRoundWithImageName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


@end
