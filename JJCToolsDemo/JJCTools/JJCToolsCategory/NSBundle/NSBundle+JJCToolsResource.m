//
//  NSBundle+JJCToolsResource.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 15/12/2017.
//  Copyright © 2017 苜蓿鬼仙. All rights reserved.
//

#import "NSBundle+JJCToolsResource.h"

@implementation NSBundle (JJCToolsResource)


/**
 初始化获取 bundle 资源文件
 */
+ (instancetype)jjc_bundle_shareBundle {
    
    static NSBundle *shareBundle = nil;
    if (shareBundle == nil) {
        shareBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"JJCTools" ofType:@"bundle"]];
    }
    return shareBundle;
}


/**
 快速获取 本地图片资源
 
 @param imageName 图片名称
 @param imageType 图片类型
 */
+ (UIImage *)jjc_bundle_getImageName:(NSString *)imageName imageType:(NSString *)imageType {
    
    static UIImage *image = nil;
    if (image == nil) {
        image = [UIImage imageWithContentsOfFile:[[self jjc_bundle_shareBundle] pathForResource:imageName ofType:imageType]];
    }
    return image;
}


/**
 快速获取 本地图片资源【png格式】
 
 @param imageName 图片名称
 */
+ (UIImage *)jjc_bundle_getImageName:(NSString *)imageName {
    
    return [self jjc_bundle_getImageName:imageName imageType:@"png"];
}


/**
 快速获取 本地语言话字符串
 
 @param key   本地语言字符串
 @param value 注释
 
 en 英文；  zh-Hans 简体中文；  zh-Hant 繁體中文；  zh-HK；  zh-TW
 */
+ (NSString *)jjc_bundle_getLocalizedStringForKey:(NSString *)key value:(NSString *)value {
    
    static NSBundle *localizedBundle = nil;
    if (localizedBundle == nil) {
        // （iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理
        NSString *language = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) {
            language = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans";      // 简体中文
            } else {
                language = @"zh-Hant";      // 繁體中文
            }
        } else {
            language = @"en";
        }
        
        // 从 JJCTools.bundle 中查找资源
        localizedBundle = [NSBundle bundleWithPath:[[NSBundle jjc_bundle_shareBundle] pathForResource:language ofType:@"lproj"]];
    }
    
    value = [localizedBundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}


/**
 快速获取 本地语言话字符串【无注释版】
 
 @param key 本地语言字符串
 */
+ (NSString *)jjc_bundle_getLocalizedStringForKey:(NSString *)key {
    
    return [self jjc_bundle_getLocalizedStringForKey:key value:nil];
}



@end
