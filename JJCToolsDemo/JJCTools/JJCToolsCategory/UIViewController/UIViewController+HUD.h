//
//  UIViewController+HUD.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/5/15.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 UIViewController+HUD
 创建：2018.05.15
 更新：2018.05.15
 
 
 1、该扩展主要用于给 UIViewController 添加弹框显示；
 2、该类是对 MBProgressHUB 的扩展，需要进行依赖；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>

@interface UIViewController (HUD)


/**
 对某个 View 添加提示信息

 @param view 要添加的对象
 @param hint 提示信息
 */
- (void)jjc_vc_showHudInView:(UIView *)view hint:(NSString *)hint;


/**
 添加提示信息

 @param hint 提示信息
 */
- (void)jjc_vc_showHint:(NSString *)hint;


/**
 隐藏提示信息
 */
- (void)jjc_vc_hideHud;


/**
 从固定位置显示提示信息

 @param hint    提示信息
 @param yOffset 固定位置
 */
- (void)jjc_vc_showHint:(NSString *)hint yOffset:(CGFloat)yOffset;




@end
















