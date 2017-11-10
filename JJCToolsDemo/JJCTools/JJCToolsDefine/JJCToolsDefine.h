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
 更新：2017.11.10
 
 
 1、该扩展主要用于收录一些基本常用的 宏定义
 
 
 */
/********************  说明  *******************/





#ifndef JJCToolsDefine_h
#define JJCToolsDefine_h



/** 屏幕尺寸 **/
#define K_MainScreen_W          ([UIScreen mainScreen].bounds.size.width)
#define K_MainScreen_H          ([UIScreen mainScreen].bounds.size.height)
#define K_MainScreen_SizeScale  ([UIScreen mainScreen].bounds.size.width / 375.0f)  // 以 iPhone8 作为基准


/** 判断系统是否是iOS8及其以上系统 **/
#define K_iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define K_iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


/** 机型尺寸 **/
#define K_iPhone5       ([UIScreen mainScreen].bounds.size.width == 320)
#define K_iPhone8       ([UIScreen mainScreen].bounds.size.width == 375)
#define K_iPhone8p      ([UIScreen mainScreen].bounds.size.width == 414)
#define K_iPhoneX       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


/** 固定控件区域尺寸 **/
#define K_Status_H              (K_iPhoneX ? 44.0f:20.0f)                   // 状态栏
#define K_NavBar_H              (44.0f)                                     // 导航栏
#define K_TabBar_H              (K_iPhoneX ? 83.0f:49.0f)                   // tabBar 栏
#define K_VC_StatusNav_H        (K_Status_H + K_NavBar_H)                   // 状态栏 + 导航栏 高度
#define K_VC_View_H             (K_MainScreen_H - K_Status_H - K_NavBar_H)  // 正常子级 ViewController.view 高度


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
#define K_HexColor(hexColor)      [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1]                         // 十六进制颜色


/** 其他数据 **/
#define K_KeyWindow         [[UIApplication sharedApplication] keyWindow]
#define K_UserDefaults  [NSUserDefaults standardUserDefaults]


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
#define K_ImageName(_name_, _type_)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_name_ ofType:_type_]]
#define K_ImageName_PNG(_name_)       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_name_ ofType:@"png"]]
#define K_URL(_url_)                  [NSURL URLWithString:[NSString stringWithFormat:@"%@", _url_]]


/** 自定义弹框 **/
// 温馨提示 - 知道了
#define K_ShowAlert_Message(_message_)   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:_message_ delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil]; \
[alert show]; \

// MBProgressHUD 消息提示
#define K_ShowHUD_Message(_message_) [MBProgressHUD showOnlyMessage:_message_]
// MBProgressHUD 成功提示
#define K_ShowHUD_Success(_message_) [MBProgressHUD showSuccess:_message_]
// MBProgressHUD 失败提示
#define K_ShowHUD_Error(_message_) [MBProgressHUD showError:_message_]








#endif /* JJCToolsDefine_h */
