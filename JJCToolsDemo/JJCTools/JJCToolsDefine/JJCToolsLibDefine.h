//
//  JJCToolsLibDefine.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 14/12/2017.
//  Copyright © 2017 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCToolsLibDefine
 创建：2017.12.14
 更新：2017.12.14
 
 
 1、该扩展主要用于收录一些仅限于 JJCTools 库的宏定义；
 2、该扩展主要用于收录获取该库资源的宏定义【用于获取库里自带的资源】；
 
 
 */
/********************  说明  *******************/





#ifndef JJCToolsLibDefine_h
#define JJCToolsLibDefine_h



/** 获取 图片、xib 文件 **/
#define JJCBundleName [NSBundle bundleWithURL:[[NSBundle bundleForClass:self.class] URLForResource:@"JJCTools" withExtension:@"bundle"]]
#define JJCBundleImageNamed(A) [UIImage imageNamed:A inBundle:[NSBundle bundleWithURL:JJCBundleName] compatibleWithTraitCollection:nil]


/** 国际化字符串 **/
#define JJCLocalizedString(key, comment)\
({\
NSString *language = [NSLocale preferredLanguages].firstObject;\
if ([language hasPrefix:@"en"]) {\
language = @"en";\
} else if ([language hasPrefix:@"zh"]) {\
language = @"zh-Hans";\
} else {\
language = @"en";\
}\
NSBundle *bundle = [NSBundle bundleWithPath:[JJCBundleName pathForResource:language ofType:@"lproj"]];\
[bundle localizedStringForKey:key value:@"" table:nil];\
})




#endif /* JJCToolsLibDefine_h */
