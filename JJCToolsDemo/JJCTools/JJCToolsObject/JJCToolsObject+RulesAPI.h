//
//  JJCToolsObject+RulesAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/11/6.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 JJCToolsObject+RulesAPI
 2017.11.06
 
 
 1、该扩展主要用于判断是否符合一些规则
 
 
 */
/********************  说明  *******************/





#import "JJCToolsObject.h"

@interface JJCToolsObject (RulesAPI)


/** 判断当前语言环境是否是中文 **/
+ (BOOL)jjc_base_isChineseLanguageWithCurrentLanguage;

/** 判断是否是正确的手机号码 **/
+ (BOOL)jjc_base_isRightPhoneNumber:(NSString *)PhoneNumber;
/** 判断是否是正确的邮箱【正则表达式】 **/
+ (BOOL)jjc_base_isRightEmail:(NSString *)emailString;

/** 判断是否是纯字母【正则表达式】 **/
+ (BOOL)jjc_base_isOnlyLetterWithString:(NSString *)string;
/** 判断是否是纯数字【正则表达式】 **/
+ (BOOL)jjc_base_isOnlyNumberWithString:(NSString *)string;
/** 判断是否只有字母和数字【正则表达式】；isConcurrence 是否同时存在 **/
+ (BOOL)jjc_base_isOnlyLetterOrNumberWithString:(NSString *)string isConcurrence:(BOOL)isConcurrence;

/** 限制表情输入【UITextView】 **/
+ (void)jjc_base_limitTextEmojiWithTextView:(UITextView *)textView;
/** 判断字符串是否包含表情 **/
+ (BOOL)jjc_base_isIncludeEmojiWithString:(NSString *)string;





@end





