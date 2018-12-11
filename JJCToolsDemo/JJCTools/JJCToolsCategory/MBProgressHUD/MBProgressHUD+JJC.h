//
//  MBProgressHUD+JJC.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/5/15.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 MBProgressHUD+JJC
 创建：2018.05.15
 更新：2018.05.15
 
 
 1、该扩展主要用于给 MBProgressHUD 添加不同类型的扩展方式；
 2、该类是对 MBProgressHUB 的扩展，需要进行依赖；
 
 
 */
/********************  说明  *******************/





#import "MBProgressHUD.h"

@interface MBProgressHUD (JJC)


/**
 显示带有文字、图标到 View

 @param text 文字信息
 @param icon 图标
 @param view 指定View
 */
+ (void)jjc_hud_showText:(NSString *)text icon:(NSString *)icon view:(UIView *)view;


/**
 显示信息到 View

 @param message 文字信息
 @param toView  指定View
 */
+ (MBProgressHUD *)jjc_hud_showMessage:(NSString *)message toView:(UIView *)toView;

/**
 显示成功信息到 View
 
 @param success 成功文字信息
 @param toView  指定View
 */
+ (void)jjc_hud_showSuccess:(NSString *)success toView:(UIView *)toView;

/**
 显示错误信息到 View
 
 @param error  错误文字信息
 @param toView 指定View
 */
+ (void)jjc_hud_showError:(NSString *)error toView:(UIView *)toView;


/**
 快捷显示信息(带图标)

 @param message 文字信息
 */
+ (MBProgressHUD *)jjc_hud_showMessage:(NSString *)message;

/**
 快捷显示信息(不带图标)
 
 @param message 文字信息
 */
+ (void)jjc_hud_showOnlyMessage:(NSString *)message;

/**
 快捷显示成功信息
 
 @param success 成功文字信息
 */
+ (void)jjc_hud_showSuccess:(NSString *)success;

/**
 快捷显示失败信息
 
 @param error 失败文字信息
 */
+ (void)jjc_hud_showError:(NSString *)error;


/**
 从 View 上隐藏提示信息

 @param view 指定View
 */
+ (void)jjc_hud_hideView:(UIView *)view;

/**
 隐藏提示信息
 */
+ (void)jjc_hud_hidden;


@end












