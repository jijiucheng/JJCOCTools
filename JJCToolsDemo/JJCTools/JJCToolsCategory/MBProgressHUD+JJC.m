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
              afterDelay:(CGFloat)afterDelay {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 设置弹框背景色
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;  // 此处必须这样设置
    if (backgroundColor) {
        hud.bezelView.backgroundColor = backgroundColor;
    } else {
        hud.bezelView.backgroundColor = [UIColor colorWithWhite:0.15 alpha:1.0];
    }
    
    hud.detailsLabel.text = text;
    if (font) {
        hud.detailsLabel.font = font;
    }
    if (textColor) {
        hud.contentColor = textColor;
    } else {
        hud.contentColor = [UIColor whiteColor];  // 设置文本颜色
    }
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"JJCTools.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    if (isAutoHide) {
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:afterDelay];
    }
}


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
              isAutoHide:(BOOL)isAutoHide {
    
    [self jjc_hud_showText:text textColor:textColor font:font backgroundColor:backgroundColor icon:icon view:view isAutoHide:isAutoHide afterDelay:1.5];
}


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
                    view:(UIView *)view {
    
    [self jjc_hud_showText:text textColor:textColor font:font backgroundColor:backgroundColor icon:icon view:view isAutoHide:YES];
}


/**
 显示带有文字、图标到 View
 
 @param text 文字信息
 @param icon 图标
 @param view 指定View
 */
+ (void)jjc_hud_showText:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    
    [self jjc_hud_showText:text textColor:[UIColor whiteColor] font:nil backgroundColor:[UIColor colorWithWhite:0.15 alpha:1.0] icon:icon view:view];
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
 快捷显示信息(带图标)
 
 @param message 文字信息
 */
+ (MBProgressHUD *)jjc_hud_showMessage:(NSString *)message {
    return [self jjc_hud_showMessage:message toView:nil];
}


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
                                        toView:(UIView *)toView {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:toView animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.backgroundView.color = backgroundColor;
    hud.bezelView.style = bezelViewStyle;
    hud.bezelView.color = bezelViewColor;
    hud.label.text = label;
    hud.label.textColor = labelColor;
    hud.label.font = labelFont;
    hud.detailsLabel.text = detailLabel;
    hud.detailsLabel.textColor = detailLabelColor;
    hud.detailsLabel.font = detailLabelFont;
}

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
                                        toView:(UIView *)toView {
    
    [self jjc_hud_showHUDProgressBackgroundColor:backgroundColor bezelViewColor:bezelViewColor bezelViewStyle:bezelViewStyle label:label labelColor:contentColor labelFont:[UIFont systemFontOfSize:14.0f] detailLabel:detailLabel detailLabelColor:contentColor detailLabelFont:[UIFont systemFontOfSize:14.0f] toView:toView];
}

/**
 更新圆环进度
 
 @param progress        进度值
 @param progressScale   进度值倍数
 @param toView          指定 view
 */
+ (void)jjc_hud_updateHUDProgress:(CGFloat)progress
                    progressScale:(NSInteger)progressScale
                           toView:(UIView *)toView {
    
    MBProgressHUD *hud = [MBProgressHUD HUDForView:toView];
    hud.progress = progress;
    if (progressScale > 1) {
        hud.detailsLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)(progress * progressScale)];
    } else {
        hud.detailsLabel.text = [NSString stringWithFormat:@"%02lf%%", progress * 100];
    }
}

/**
 隐藏圆环进度
 */
+ (void)jjc_hud_hideHUDProgressToView:(UIView *)toView {
    
    [self hideHUDForView:toView animated:YES];
}




@end
