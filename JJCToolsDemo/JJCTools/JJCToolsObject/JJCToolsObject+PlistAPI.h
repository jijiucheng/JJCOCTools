//
//  JJCToolsObject+PlistAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/11/6.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject.h"

@interface JJCToolsObject (PlistAPI)


/**
 获取 AppIcon 图片
 
 备注：CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles
 */
+ (NSString *)jjc_getAppIconImageString;


/**
 获取 应用名称（手机显示名称）
 
 备注：CFBundleDisplayName
 */
+ (NSString *)jjc_getAppBundleDisplayNameString;


/**
 获取 应用名称（.api显示名称）
 
 备注：CFBundleName
 */
+ (NSString *)jjc_getAppBundleNameString;


/**
 获取 应用当前版本号（release 版本号）
 
 备注：CFBundleShortVersionString
 */
+ (NSString *)jjc_getAppBundleShortVersionString;


/**
 获取 应用当前版本号（debug 版本号）
 
 备注：CFBundleVersion
 */
+ (NSString *)jjc_getAppBundleVersionString;


/**
 获取 应用标识
 
 备注：CFBundleIdentifier
 */
+ (NSString *)jjc_getAppBundleIdentifierString;


@end
