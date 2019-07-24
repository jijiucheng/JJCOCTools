//
//  UIImage+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UIImage+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 UIImage 设置一些属性；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JJC)


#pragma mark - 裁剪

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




#pragma mark - 转换

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


/**
 图片不渲染（使用原始图片，iOS7之后，导航栏默认渲染）
 
 @param imageName 图片名称
 @return 不渲染的图片
 */
+ (UIImage *)jjc_image_getImageWithRenderOriginalName:(NSString *)imageName;


/**
 图片不渲染（使用原始图片，iOS7之后，导航栏默认渲染）
 
 @return 不渲染的图片
 */
- (UIImage *)jjc_image_getRenderOriginal;


@end

NS_ASSUME_NONNULL_END
