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
 更新：2018.06.06
 
 
 1、该扩展主要用于给 UIImage 进行裁剪、截屏处理；
 
 
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


/**
 裁剪图片（不带边框圆形）
 
 @param imageName   所要裁剪图片名称
 @return 返回裁剪后的图片
 */
+ (UIImage *)jjc_image_clipRoundWithImageName:(NSString *)imageName;


/**
 截屏（根据控制器进行整体截屏）
 
 @param viewController 指定控制器
 @return 截屏后的图片
 */
+ (UIImage *)jjc_image_getScreenCaptureWithViewController:(UIViewController *)viewController;


/**
 截屏（根据指定区域Frame进行截取）

 @param viewController 指定控制器
 @param viewFrame      指定区域 View 的 Frame
 @param cornerRadius   圆角角度
 @return 截屏后的图片
 */
+ (UIImage *)jjc_image_getScreenCaptureWithViewController:(UIViewController *)viewController viewFrame:(CGRect)viewFrame cornerRadius:(CGFloat)cornerRadius;


/**
 截屏（截取指定View）

 @param view 指定View
 @return 截屏后的图片
 */
+ (UIImage *)jjc_image_getScreenCaptureWithView:(UIView *)view;






@end
