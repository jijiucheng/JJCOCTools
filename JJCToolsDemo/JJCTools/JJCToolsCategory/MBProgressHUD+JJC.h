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
 更新：2019.02.13
 
 
 1、该扩展主要用于给 MBProgressHUD 添加不同类型的扩展方式；
 2、该类是对 MBProgressHUB 的扩展，需要进行依赖；
 
 
 */
/********************  说明  *******************/





#import "MBProgressHUD.h"

@interface MBProgressHUD (JJC)


/**
 显示带有文字、图标到 View【最基础】
 
 @param text            文字信息
 @param textColor       文字颜色
 @param font            字号
 @param backgroundColor 背景色
 @param icon            图标
 @param view            指定View
 @param isAutoHide      是否自动隐藏
 @param afterDelay      延迟隐藏时间
 */
+ (void)jjc_hud_showText:(NSString *)text
               textColor:(UIColor *)textColor
                    font:(UIFont *)font
         backgroundColor:(UIColor *)backgroundColor
                    icon:(NSString *)icon
                    view:(UIView *)view
              isAutoHide:(BOOL)isAutoHide
              afterDelay:(CGFloat)afterDelay;


/**
 显示带有文字、图标到 View【无法设置延迟消失时间】
 
 @param text            文字信息
 @param textColor       文字颜色
 @param font            字号
 @param backgroundColor 背景色
 @param icon            图标
 @param view            指定View
 @param isAutoHide      是否自动隐藏
 */
+ (void)jjc_hud_showText:(NSString *)text
               textColor:(UIColor *)textColor
                    font:(UIFont *)font
         backgroundColor:(UIColor *)backgroundColor
                    icon:(NSString *)icon
                    view:(UIView *)view
              isAutoHide:(BOOL)isAutoHide;


/**
 显示带有文字、图标到 View【无法设置延迟消失时间，是否自动隐藏】
 
 @param text            文字信息
 @param textColor       文字颜色
 @param font            字号
 @param backgroundColor 背景色
 @param icon            图标
 @param view            指定View
 */
+ (void)jjc_hud_showText:(NSString *)text
               textColor:(UIColor *)textColor
                    font:(UIFont *)font
         backgroundColor:(UIColor *)backgroundColor
                    icon:(NSString *)icon
                    view:(UIView *)view;


/**
 显示带有文字、图标到 View

 @param text 文字信息
 @param icon 图标
 @param view 指定View
 */
+ (void)jjc_hud_showText:(NSString *)text icon:(NSString *)icon view:(UIView *)view;

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


/**
 显示信息到 View
 
 @param message 文字信息
 @param toView  指定View
 */
+ (MBProgressHUD *)jjc_hud_showMessage:(NSString *)message toView:(UIView *)toView;

/**
 快捷显示信息(带图标)
 
 @param message 文字信息
 */
+ (MBProgressHUD *)jjc_hud_showMessage:(NSString *)message;



#pragma mark - 特用于进度条类型
/**
 显示圆环进度条【最基础】
 
 @param backgroundColor     背景色
 @param bezelViewColor      圆环颜色
 @param bezelViewStyle      圆环类型
 @param label               主标题
 @param labelColor          主标题文字颜色
 @param labelFont           主标题文字字体大小
 @param detailLabel         副标题
 @param detailLabelColor    副标题文字颜色
 @param detailLabelFont     副标题文字字体大小
 @param toView              指定 view
 */
+ (void)jjc_hud_showHUDProgressBackgroundColor:(UIColor *)backgroundColor
                                bezelViewColor:(UIColor *)bezelViewColor
                                bezelViewStyle:(MBProgressHUDBackgroundStyle)bezelViewStyle
                                         label:(NSString *)label
                                    labelColor:(UIColor *)labelColor
                                     labelFont:(UIFont *)labelFont
                                   detailLabel:(NSString *)detailLabel
                              detailLabelColor:(UIColor *)detailLabelColor
                               detailLabelFont:(UIFont *)detailLabelFont
                                        toView:(UIView *)toView;

/**
 显示圆环进度条【设置内容，字号默认 14】
 
 @param backgroundColor     背景色
 @param bezelViewColor      圆环颜色
 @param bezelViewStyle      圆环类型
 @param label               主标题
 @param detailLabel         副标题
 @param contentColor        内容颜色
 @param toView              指定 view
 */
+ (void)jjc_hud_showHUDProgressBackgroundColor:(UIColor *)backgroundColor
                                bezelViewColor:(UIColor *)bezelViewColor
                                bezelViewStyle:(MBProgressHUDBackgroundStyle)bezelViewStyle
                                         label:(NSString *)label
                                   detailLabel:(NSString *)detailLabel
                                  contentColor:(UIColor *)contentColor
                                        toView:(UIView *)toView;

/**
 更新圆环进度
 
 @param progress        进度值
 @param progressScale   进度值倍数
 @param toView          指定 view
 */
+ (void)jjc_hud_updateHUDProgress:(CGFloat)progress
                    progressScale:(NSInteger)progressScale
                           toView:(UIView *)toView;

/**
 隐藏圆环进度
 */
+ (void)jjc_hud_hideHUDProgressToView:(UIView *)toView;


@end












