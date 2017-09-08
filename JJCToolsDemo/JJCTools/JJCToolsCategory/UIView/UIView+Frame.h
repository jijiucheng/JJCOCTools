//
//  UIView+Frame.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/8.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 UIView+Frame
 2017.09.08
 
 
 1、该扩展主要用于快捷获取 Frame 属性；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>

@interface UIView (Frame)


/** 距离顶部间距 y **/
@property (nonatomic, assign) CGFloat top;
/** 距离左侧间距 x **/
@property (nonatomic, assign) CGFloat left;
/** 距离底部间距 y + height **/
@property (nonatomic, assign) CGFloat bottom;
/** 距离右侧间距 x + width **/
@property (nonatomic, assign) CGFloat right;


/** 中心点 x **/
@property (nonatomic, assign) CGFloat centerX;
/** 中心点 y **/
@property (nonatomic, assign) CGFloat centerY;


/** 距离左侧间距 x **/
@property (nonatomic, assign) CGFloat x;
/** 距离顶部间距 y **/
@property (nonatomic, assign) CGFloat y;
/** 宽度 **/
@property (nonatomic, assign) CGFloat width;
/** 高度 **/
@property (nonatomic, assign) CGFloat height;


/** 左上角坐标 **/
@property (nonatomic, assign) CGPoint origin;
/** 宽高尺寸 **/
@property (nonatomic, assign) CGSize  size;



@end
