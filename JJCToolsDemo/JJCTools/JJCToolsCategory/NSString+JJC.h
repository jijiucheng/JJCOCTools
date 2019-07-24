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

@end

NS_ASSUME_NONNULL_END
