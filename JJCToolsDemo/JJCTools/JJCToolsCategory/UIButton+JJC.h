//
//  UIButton+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UIButton+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 UIButton 设置一些属性；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JJC)


#pragma mark - 基础属性

- (void)jjc_btn_setBackgroundImage:(UIImage *)image selectBackgroundImage:(UIImage *)selectImage;
- (void)jjc_btn_setImage:(NSString *)image selectImage:(NSString *)selectImage;

- (void)jjc_btn_setTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font forState:(UIControlState)state;
- (void)jjc_btn_setTitle:(NSString *)title titleColor:(UIColor *)titleColor fontFloat:(CGFloat)fontFloat forState:(UIControlState)state;
- (void)jjc_btn_setTitle:(NSString *)title titleColor:(UIColor *)titleColor fontFloat:(CGFloat)fontFloat;


/**
 设置阴影
 */
- (void)jjc_btn_setShadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset;


@end

NS_ASSUME_NONNULL_END
