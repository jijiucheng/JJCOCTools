//
//  JJCToolsObject+BaseAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/10/18.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCToolsObject+BaseAPI
 2017.10.18
 
 
 1、该扩展主要用于快捷设置一些基础共用方法
 
 
 */
/********************  说明  *******************/




#import "JJCToolsObject.h"

@interface JJCToolsObject (BaseAPI)


/********************  快捷存取沙盒数据  *******************/

/** 快捷存沙盒数据 **/
+ (void)jjc_base_saveValue:(id)value forKey:(NSString *)key;
/** 快捷取沙盒数据 **/
+ (id)jjc_base_getValueForKey:(NSString *)key;
/** 快捷删除沙盒字段 **/
+ (void)jjc_base_removeValueForKey:(NSString *)key;


/********************  获取文字尺寸  *******************/

/** 根据 宽度 获取文字的 Size【非系统字体】 **/
+ (CGSize)jjc_base_getContentSize:(NSString *)content Font:(UIFont *)font ContentWidth:(CGFloat)contentWidth;
/** 根据 高度 获取文字的 Size【非系统字体】 **/
+ (CGSize)jjc_base_getContentSize:(NSString *)content Font:(UIFont *)font ContentHeight:(CGFloat)contentHeight;
/** 根据 宽度 获取文字的 高度 【非系统字体】 **/
+ (CGFloat)jjc_base_getContentHeight:(NSString *)content Font:(UIFont *)font ContentWidth:(CGFloat)contentWidth;
/** 根据 高度 获取文字的 宽度 【非系统字体】 **/
+ (CGFloat)jjc_base_getContentWidth:(NSString *)content Font:(UIFont *)font ContentHeight:(CGFloat)contentHeight;

/** 根据 宽度 获取文字的 Size【系统字体】 **/
+ (CGSize)jjc_base_getContentSize:(NSString *)content FontFloat:(CGFloat)fontFloat ContentWidth:(CGFloat)contentWidth;
/** 根据 高度 获取文字的 Size【系统字体】 **/
+ (CGSize)jjc_base_getContentSize:(NSString *)content FontFloat:(CGFloat)fontFloat ContentHeight:(CGFloat)contentHeight;
/** 根据 宽度 获取文字的 高度 【系统字体】 **/
+ (CGFloat)jjc_base_getContentHeight:(NSString *)content FontFloat:(CGFloat)fontFloat ContentWidth:(CGFloat)contentWidth;
/** 根据 高度 获取文字的 宽度 【系统字体】 **/
+ (CGFloat)jjc_base_getContentWidth:(NSString *)content FontFloat:(CGFloat)fontFloat ContentHeight:(CGFloat)contentHeight;


/********************  获取时间相关  *******************/

/** 获取当前时间 **/
+ (NSString *)jjc_base_getCurrentTime;
/** 将 时间戳 转换成通用时间格式 @"yyyy-MM-dd HH:mm:ss" 或 @"2017年10月18日 18:00:00" **/
+ (NSString *)jjc_base_turnStandardTimeWithTimeStampString:(NSString *)timeStampString isChinese:(BOOL)isChinese;
/** 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 时间戳 **/
+ (long long)jjc_base_turnTimeStampStringByStandardTimeString:(NSString *)standardTimeString;
/** 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 NSDae 类型 **/
+ (NSDate *)jjc_base_turnFormateDateTimeByStandardTimeString:(NSString *)standardTimeString;


/********************  获取颜色图片相关  *******************/

/** 将颜色转换成图片 **/
+ (UIImage *)jjc_base_turnImageWithColor:(UIColor *)color;
/** 设置拍照相册截取压缩头像 **/
+ (UIImage *)jjc_base_createThumbImage:(UIImage *)image Boundary:(CGFloat)boundary;
/** 压缩图片 **/
+ (UIImage *)imageByScalingProportionallyWithImage:(UIImage*)image targetSize:(CGSize)targetSize;


/********************  数字转换相关  *******************/

/** 将阿拉伯数字转换成中文数字 **/
+ (NSString *)jjc_base_turnArabicNumToChineseNumWithArabicNum:(NSInteger)arabicNum;


/********************  文本输入显示相关  *******************/

/** UILable显示带标签的字符串 **/
+ (NSAttributedString *)jjc_base_getLabelWithHTMLString:(NSString *)htmlString;
/** 过滤 HTML 标签 **/
+ (NSString *)jjc_base_removeHTMLCharacterWithHTMLString:(NSString *)htmlString;

/** 判断当前语言环境是否是中文 **/
+ (BOOL)jjc_base_isChineseLanguageWithCurrentLanguage;
/** 判断是否是正确的手机号码 **/
+ (BOOL)jjc_base_isRightPhoneNumber:(NSString *)PhoneNumber;

/** 限制表情输入【UITextView】 **/
+ (void)jjc_base_limitTextEmojiWithTextView:(UITextView *)textView;
/** 判断字符串是否包含表情 **/
+ (BOOL)jjc_base_isIncludeEmojiWithString:(NSString *)string;




@end
