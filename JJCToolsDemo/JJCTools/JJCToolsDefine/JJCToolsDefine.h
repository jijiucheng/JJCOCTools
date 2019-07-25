//
//  JJCToolsDefine.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/10/18.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 JJCToolsDefine
 创建：2017.10.18
 更新：2019.07.25
 
 
 1、该扩展主要用于收录一些基本常用的 宏定义
 
 
 */
/********************  说明  *******************/





#ifndef JJCToolsDefine_h
#define JJCToolsDefine_h



/** 屏幕尺寸 **/
#define K_Screen_Size       ([UIScreen mainScreen].bounds.size)
#define K_Screen_W          ([UIScreen mainScreen].bounds.size.width)
#define K_Screen_H          ([UIScreen mainScreen].bounds.size.height)
#define K_Screen_Scale      ([UIScreen mainScreen].bounds.size.width / 375.0f)  // 以 iPhone8 作为基准


/** 判断系统是否是iOS8及其以上系统 **/
#define K_iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define K_iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define k_iOS(V)        @available(iOS V, *)


/** 机型尺寸 **/
#define K_iPad          ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define K_iPhone5       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !K_iPad : NO)
#define K_iPhone8       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !K_iPad : NO)
#define K_iPhone8p      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !K_iPad : NO)
#define K_iPhoneX       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !K_iPad : NO)
#define K_iPhoneXr      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !K_iPad : NO)
#define K_iPhoneXs      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !K_iPad : NO)
#define K_iPhoneXsMax   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !K_iPad : NO)

// 刘海系列（iPhone X、iPhone XR、iPhone XS、iPhone XS Max）
#define K_iPhoneXN      (K_iPhoneX || K_iPhoneXr || K_iPhoneXs || K_iPhoneXsMax)


/** 固定控件区域尺寸 **/
#define K_Status_H           (K_iPhoneX ? 44.0f:20.0f)                   // 状态栏
#define K_NavBar_H           (44.0f)                                     // 导航栏
#define K_TabBar_H           (K_iPhoneX ? 83.0f:49.0f)                   // tabBar 栏
#define K_StatusNav_H        (K_Status_H + K_NavBar_H)                   // 状态栏 + 导航栏 高度
#define K_View_H             (K_MainScreen_H - K_Status_H - K_NavBar_H)  // 正常子级 ViewController.view 高度


/** 基础间距尺寸 **/
#define K_Space_X               10.0f
#define K_Space_Y               10.0f
#define K_Label_H               20.0f


/** 固定字体大小 **/
#define K_Font_L                20
#define K_Font_M                16
#define K_Font_S                13


/** 基础色值 **/
#define K_View_BGColor    [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0]  // 基础底色
#define K_Line_Color      [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0]  // 基础线条颜色

#define K_RGBAColor(R, G, B, A)   [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)]  // 设置颜色
#define K_RGBColor(R, G, B)       [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:1.0]  // 设置颜色
#define K_HexColor(HexColor)      [UIColor colorWithRed:((float)((HexColor & 0xFF0000) >> 16))/255.0 green:((float)((HexColor & 0xFF00) >> 8))/255.0 blue:((float)(HexColor & 0xFF))/255.0 alpha:1]                         // 十六进制颜色
#define K_HexColorA(HexColor, A)      [UIColor colorWithRed:((float)((HexColor & 0xFF0000) >> 16))/255.0 green:((float)((HexColor & 0xFF00) >> 8))/255.0 blue:((float)(HexColor & 0xFF))/255.0 alpha:A]                         // 十六进制颜色


/** 其他数据 **/
#define K_KeyWindow         [[UIApplication sharedApplication] keyWindow]
#define K_UserDefaults      [NSUserDefaults standardUserDefaults]


/** 打印日志 **/
// 重新定义 NSLog DEBug状态下打印NSLog信息 release状态下不打印NSLog信息  发布后以节约系统资源
// 重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


/** 自定义相关输入输出 **/
#define K_StringFormat(format, ...)   [NSString stringWithFormat:format, ##__VA_ARGS__]
#define K_LocalString(String)         NSLocalizedString(String, nil)
#define K_Font(F)                     [UIFont systemFontOfSize:F]


/** 获取沙盒相关路径 **/
// 获取沙盒 Document
#define K_Path_Document  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
// 获取沙盒 Cache
#define K_Path_Cache     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


/** 自定义通知相关 **/
// 发送通知
#define K_NotiCenter_Post(_name_, _object_, _userInfo_)  [[NSNotificationCenter defaultCenter] postNotificationName:_name_ object:_object_ userInfo:_userInfo_]
// 接收通知
#define K_NotiCenter_Add(_action_, _name_, _object_)     [[NSNotificationCenter defaultCenter] addObserver:self selector:_action_ name:_name_ object:_object_]
// 移除通知
#define K_NotiCenter_Remove(_name_, _object_)            [[NSNotificationCenter defaultCenter] removeObserver:self name:_name_ object:_object_]


/** 获取本地图片资源 **/
// 直接从系统文件中取，不缓存（适用大文件且使用不频繁）
#define K_ImageName_F(_name_, _type_)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_name_ ofType:_type_]]
#define K_ImageName_F_PNG(_name_)       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_name_ ofType:@"png"]]
// 先查找缓存，否则从文件系统中取（适用适用频繁文件）【该方法默认只加载PNG格式，如果需要加载其他格式，请在文件名中加入文件格式后缀，如"abc.jpg"】
#define K_ImageName(_name_)             [UIImage imageNamed:_name_]
#define K_URL(_url_)                    [NSURL URLWithString:[NSString stringWithFormat:@"%@", _url_]]


/** 圆角切割 **/
//  圆角
#define K_ViewBorderRadius(view, radius)\
[view.layer setCornerRadius:(radius)];\
[view.layer setMasksToBounds:YES];
//  圆角和边框
#define K_ViewBorderRadiusColor(view, radius, width, color)\
[view.layer setCornerRadius:(radius)];\
[view.layer setMasksToBounds:YES];\
[view.layer setBorderWidth:(width)];\
[view.layer setBorderColor:[color CGColor]];


/** 强弱引用宏定义 **/
// 弱引用
#ifndef K_Weakify
#if DEBUG
#if __has_feature(objc_arc)
#define K_Weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define K_Weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define K_Weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define K_Weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

// 强引用
#ifndef K_Strongify
#if DEBUG
#if __has_feature(objc_arc)
#define K_Strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define K_Strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define K_Strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define K_Strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif






#endif /* JJCToolsDefine_h */
