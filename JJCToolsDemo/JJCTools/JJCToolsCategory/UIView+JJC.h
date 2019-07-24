//
//  UIView+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UIView+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于对于 View 的属性设置；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "JJCToolsEnum.h"



NS_ASSUME_NONNULL_BEGIN

@interface UIView (JJC)


#pragma mark - 点击事件

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




#pragma mark - 裁剪

/**
 View 裁剪（默认四个角）
 
 @param rectCorner   选定四角上的某角
 @param cornerRadius 裁剪弧度
 */
- (void)jjc_view_clipRoundWithRectCorner:(JJCRectCorner)rectCorner cornerRadius:(CGFloat)cornerRadius;


/**
 View 裁剪（默认四个角）
 
 @param cornerRadius 裁剪弧度
 */
- (void)jjc_view_clipRoundWithCornerRadius:(CGFloat)cornerRadius;


@end

NS_ASSUME_NONNULL_END
