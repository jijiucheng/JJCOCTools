//
//  MBProgressHUD+JJC.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/5/15.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "MBProgressHUD+JJC.h"

@implementation MBProgressHUD (JJC)


/**
 显示带有文字、图标到 View
 
 @param text 文字信息
 @param icon 图标
 @param view 指定View
 */
+ (void)jjc_hud_showText:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 设置弹框背景色
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;  // 此处必须这样设置
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0.15 alpha:1.0];
    
    hud.label.text = text;
    hud.contentColor = [UIColor whiteColor];  // 设置文本颜色
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"JJCTools.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}


/**
 显示信息到 View
 
 @param message 文字信息
 @param toView  指定View
 */
+ (MBProgressHUD *)jjc_hud_showMessage:(NSString *)message toView:(UIView *)toView {
    
    if (toView == nil) toView = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:toView animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
//    hud.backgroundColor = [UIColor clearColor];
    
    // YES代表需要蒙版效果
//    hud.dimBackground = NO;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor clearColor];
    
    return hud;
}

/**
 显示成功信息到 View
 
 @param success 成功文字信息
 @param toView  指定View
 */
+ (void)jjc_hud_showSuccess:(NSString *)success toView:(UIView *)toView {
    [self jjc_hud_showText:success icon:@"success.png" view:toView];
}

/**
 显示错误信息到 View
 
 @param error  错误文字信息
 @param toView 指定View
 */
+ (void)jjc_hud_showError:(NSString *)error toView:(UIView *)toView {
    [self jjc_hud_showText:error icon:@"error.png" view:toView];
}


/**
 快捷显示信息(带图标)
 
 @param message 文字信息
 */
+ (MBProgressHUD *)jjc_hud_showMessage:(NSString *)message {
    return [self jjc_hud_showMessage:message toView:nil];
}

/**
 快捷显示信息(不带图标)
 
 @param message 文字信息
 */
+ (void)jjc_hud_showOnlyMessage:(NSString *)message {
    [self jjc_hud_showText:message icon:nil view:nil];
}

/**
 快捷显示成功信息
 
 @param success 成功文字信息
 */
+ (void)jjc_hud_showSuccess:(NSString *)success {
    [self jjc_hud_showSuccess:success toView:nil];
}

/**
 快捷显示失败信息
 
 @param error 失败文字信息
 */
+ (void)jjc_hud_showError:(NSString *)error {
    [self jjc_hud_showError:error toView:nil];
}


/**
 从 View 上隐藏提示信息
 
 @param view 指定View
 */
+ (void)jjc_hud_hideView:(UIView *)view {
    [self hideHUDForView:view animated:YES];
}

/**
 隐藏提示信息
 */
+ (void)jjc_hud_hidden {
    [self jjc_hud_hideView:nil];
}


@end
