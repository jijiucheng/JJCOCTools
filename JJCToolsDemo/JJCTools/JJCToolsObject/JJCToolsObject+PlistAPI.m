//
//  JJCToolsObject+PlistAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/11/6.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject+PlistAPI.h"

@implementation JJCToolsObject (PlistAPI)


/**
 获取 AppIcon 图片
 
 备注：CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles
 */
+ (NSString *)jjc_plist_getAppIconImageString {
    
    NSString *appIconImageString = [[[[NSBundle mainBundle] infoDictionary] valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    return appIconImageString;
}


/**
 获取 应用名称（手机显示名称）
 
 备注：CFBundleDisplayName
 */
+ (NSString *)jjc_plist_getAppBundleDisplayNameString {
    
    NSString *displayNameString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    return displayNameString;
}


/**
 获取 应用名称（.api显示名称）
 
 备注：CFBundleName
 */
+ (NSString *)jjc_plist_getAppBundleNameString {
    
    NSString *bundleNameString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    return bundleNameString;
}


/**
 获取 应用当前版本号（release 版本号）
 
 备注：CFBundleShortVersionString
 */
+ (NSString *)jjc_plist_getAppBundleShortVersionString {
    
    NSString *shortVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return shortVersionString;
}


/**
 获取 应用当前版本号（debug 版本号）
 
 备注：CFBundleVersion
 */
+ (NSString *)jjc_plist_getAppBundleVersionString {
    
    NSString *bundleVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    return bundleVersionString;
}


/**
 获取 应用标识
 
 备注：CFBundleIdentifier
 */
+ (NSString *)jjc_plist_getAppBundleIdentifierString {
    
    NSString *bundleIdentifierString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
    return bundleIdentifierString;
}


@end


