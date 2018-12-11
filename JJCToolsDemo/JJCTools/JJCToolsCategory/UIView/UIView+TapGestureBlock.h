//
//  UIView+TapGestureBlock.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/8.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 UIView+TapGestureBlock
 创建：2017.09.08
 更新：2017.11.10
 
 
 1、该扩展主要用于给 UIView 添加点击事件；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>

@interface UIView (TapGestureBlock)


/**
 添加点击事件 -- Target

 @param target target
 @param action action
 */
- (void)jjc_view_addTapGestureWithTarget:(nullable id)target action:(SEL _Nullable )action;


/**
 添加点击事件 -- Block

 @param block block
 */
- (void)jjc_view_addTapGestureWithBlock:(void(^_Nullable)(void))block;


@end





