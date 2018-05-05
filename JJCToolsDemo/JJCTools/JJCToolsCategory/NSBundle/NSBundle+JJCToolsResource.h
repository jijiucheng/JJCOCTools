//
//  NSBundle+JJCToolsResource.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 15/12/2017.
//  Copyright © 2017 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 NSBundle+JJCToolsResource
 创建：2017.12.15
 更新：2018.05.05
 
 
 1、该扩展主要用于设置获取 JJCToolsResource 中资源的快捷方法；
 
 
 */
/********************  说明  *******************/





#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSBundle (JJCToolsResource)


/**
 初始化获取 bundle 资源文件
 */
+ (instancetype)jjc_bundle_shareBundle;


/**
 快速获取 本地图片资源

 @param imageName 图片名称
 @param imageType 图片类型
 */
+ (UIImage *)jjc_bundle_getImageName:(NSString *)imageName imageType:(NSString *)imageType;


/**
 快速获取 本地图片资源【png格式】
 
 @param imageName 图片名称
 */
+ (UIImage *)jjc_bundle_getImageName:(NSString *)imageName;


/**
 快速获取 本地语言话字符串

 @param key   本地语言字符串
 @param value 注释
 
 en 英文；  zh-Hans 简体中文；  zh-Hant 繁體中文；  zh-HK；  zh-TW
 */
+ (NSString *)jjc_bundle_getLocalizedStringForKey:(NSString *)key value:(NSString *)value;


/**
 快速获取 本地语言话字符串【无注释版】

 @param key 本地语言字符串
 */
+ (NSString *)jjc_bundle_getLocalizedStringForKey:(NSString *)key;




/***************************  以下为快捷版  ***************************/

/**
 快速获取 本地图片资源【png格式】
 
 @param imageName 图片名称
 */
+ (UIImage *)jjc_ImageName:(NSString *)imageName;


/**
 快速获取 本地语言话字符串【无注释版】
 
 @param key 本地语言字符串
 */
+ (NSString *)jjc_LocalKey:(NSString *)key;


@end
