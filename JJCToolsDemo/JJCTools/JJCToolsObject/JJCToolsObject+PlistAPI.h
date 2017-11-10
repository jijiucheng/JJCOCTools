//
//  JJCToolsObject+PlistAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/11/6.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCToolsObject+PlistAPI
 创建：2017.11.06
 更新：2017.11.10
 
 
 1、该扩展主要用于获取系统属性及 Plist 文件属性；
 
 
 */
/********************  说明  *******************/





#import "JJCToolsObject.h"

@interface JJCToolsObject (PlistAPI)


/**
 获取 AppIcon 图片
 
 备注：CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles
 */
+ (NSString *)jjc_plist_getAppIconImageString;


/**
 获取 应用名称（手机显示名称）
 
 备注：CFBundleDisplayName
 */
+ (NSString *)jjc_plist_getAppBundleDisplayNameString;


/**
 获取 应用名称（.api显示名称）
 
 备注：CFBundleName
 */
+ (NSString *)jjc_plist_getAppBundleNameString;


/**
 获取 应用当前版本号（release 版本号）
 
 备注：CFBundleShortVersionString
 */
+ (NSString *)jjc_plist_getAppBundleShortVersionString;


/**
 获取 应用当前版本号（debug 版本号）
 
 备注：CFBundleVersion
 */
+ (NSString *)jjc_plist_getAppBundleVersionString;


/**
 获取 应用标识
 
 备注：CFBundleIdentifier
 */
+ (NSString *)jjc_plist_getAppBundleIdentifierString;


@end
