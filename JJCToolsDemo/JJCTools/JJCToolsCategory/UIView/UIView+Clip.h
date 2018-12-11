//
//  UIView+Clip.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/6/6.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UIView+Clip
 创建：2018.06.06
 更新：2018.06.06
 
 
 1、该扩展主要用于对于 View 的各式裁剪；
 
 
 */
/********************  说明  *******************/




#import <UIKit/UIKit.h>
#import "JJCToolsEnum.h"

@interface UIView (Clip)


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









