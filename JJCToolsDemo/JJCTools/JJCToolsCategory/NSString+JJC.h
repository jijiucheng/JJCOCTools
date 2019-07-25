//
//  NSString+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 NSString+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 NSString 设置一些属性；
 
 
 */
/********************  说明  *******************/



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JJCToolsEnum.h"



NS_ASSUME_NONNULL_BEGIN

@interface NSString (JJC)

#pragma mark - 基础属性

/**
 判断字符串是否为空
 */
- (BOOL)jjc_string_isEmpty;

/**
 判断 url 是否合法
 */
- (BOOL)jjc_string_isAvailableHTTPURL;

/**
 判断用户名是否合法
 */
- (BOOL)isRightWithRegularExpression:(JJCRegularExpressionType)type;



#pragma mark - 格式化

/**
 清除空格符
 */
- (void)jjc_string_cleanSpaceChatacter;

/**
 清除苹果输入法空格（苹果输入法空格：8198，普通输入法空格：32）
 */
- (void)jjc_string_cleanAppleInputSpaceChatacter;

/**
 处理字符串中的特殊字符
 */
- (NSString *)jjc_getStringWithDeleteCharacters:(NSArray *)deleteCharacters;


- (NSURL *)jjc_string_urlScheme:(NSString *)scheme;



#pragma mark - 获取文字尺寸

/********************  获取文字尺寸  *******************/
/*
 参考链接：
 1、IOS BUG记录 boundingRectWithSize计算内容宽度高度的问题
 https://blog.csdn.net/gloryFlow/article/details/54311751
 2、段落样式 NSMutableParagraphStyle
 https://www.jianshu.com/p/b0afc45bb642
 */

/**
 获取文字的 Size
 
 @param font            文字字体
 @param contentMaxWH    文字宽或高的最大值
 @param isWidth         文字计算宽度或高度
 @param drawingOptions  文字绘制属性
 @param paragraphStyle  文字段落样式
 */
- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentMaxWH:(CGFloat)contentMaxWH isWidth:(BOOL)isWidth drawingOptions:(NSStringDrawingOptions)drawingOptions paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;

- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentWidth:(CGFloat)contentWidth paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;
- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentHeight:(CGFloat)contentHeight paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;

- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentWidth:(CGFloat)contentWidth;
- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentHeight:(CGFloat)contentHeight;

- (CGFloat)jjc_string_getContentHeightWithFont:(UIFont *)font contentWidth:(CGFloat)contentWidth;
- (CGFloat)jjc_string_getContentWidthWithFont:(UIFont *)font contentHeight:(CGFloat)contentHeight;

- (CGFloat)jjc_string_getContentHeightWithFontFloat:(CGFloat)fontFloat contentWidth:(CGFloat)contentWidth;
- (CGFloat)jjc_string_getContentWidthWithFontFloat:(CGFloat)fontFloat contentHeight:(CGFloat)contentHeight;


@end

NS_ASSUME_NONNULL_END
