//
//  UITabBar+Badge.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/8.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 UITabBar+Badge
 2017.09.08
 
 
 1、该扩展主要用于设置 tabBar 的小红点的显示与隐藏；
 
 
 */
/********************  说明  *******************/




#import <UIKit/UIKit.h>

@interface UITabBar (Badge)


/**
 显示小红点

 @param index 要显示的小红点
 */
- (void)jjc_tabBar_showBadgeOnItemIndex:(NSInteger)index;


/**
 隐藏小红点

 @param index 要隐藏的小红点
 */
- (void)jjc_tabBar_hideBadgeOnItemIndex:(NSInteger)index;


@end
