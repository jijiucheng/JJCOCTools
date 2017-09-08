//
//  UIView+Animation.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/8.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 UIView+Animation
 2017.09.08
 
 
 1、该扩展主要用于给 UIView 添加动画效果；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>

@interface UIView (Animation)


/**
 添加 呼吸心跳 动画
 
 默认：maxSize = 1.0f; minSize = 0.7f; durationPerBeat = 2.0f;
 */
- (void)addAnimationWithHeartAnimation;


/**
 添加 呼吸心跳 动画

 @param maxSize             最大尺寸
 @param minSize             最小尺寸
 @param durationPerBeat     单次时间
 */
- (void)addAnimationWithHeartAnimationWithMaxSize:(CGFloat)maxSize minSize:(CGFloat)minSize durationPerBeat:(CGFloat)durationPerBeat;




@end









