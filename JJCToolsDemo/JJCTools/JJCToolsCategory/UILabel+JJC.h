//
//  UILabel+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UILabel+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于快捷设置 UILabel 部分属性；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JJC)

#pragma mark - 基本设置

/**
 快捷设置 UILabel 基本属性
 */
- (void)jjc_label_setText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;
- (void)jjc_label_setText:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font;

/**
 设置阴影
 */
- (void)jjc_label_setShadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset;



#pragma mark - 富文本

/**
 调整 Label 文本间距
 
 @param text            文本内容
 @param lineSpace       上下行间距
 @param characterSpace  左右字体间距
 */
- (void)jjc_label_setText:(NSString *)text lineSpace:(CGFloat)lineSpace characterSpace:(CGFloat)characterSpace;

@end

NS_ASSUME_NONNULL_END
