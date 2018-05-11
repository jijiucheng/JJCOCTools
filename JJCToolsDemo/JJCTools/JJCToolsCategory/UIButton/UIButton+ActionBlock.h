//
//  UIButton+ActionBlock.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/5/11.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 UIButton+ActionBlock
 创建：2018.05.11
 更新：2018.05.11
 
 
 1、该扩展主要用于给 UIButton 添加点击事件；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>



typedef void(^ButtonActionBlock)(void);


@interface UIButton (ActionBlock)


/**
 添加点击事件 -- Target
 
 @param action         响应事件
 @param controlEvents  响应类型
 */
- (void)jjc_button_addAction:(SEL _Nullable )action forControlEvents:(UIControlEvents)controlEvents;


/**
 添加点击事件 -- Block
 
 @param controlEvents 响应类型
 @param actionBlock   响应block
 */
- (void)jjc_button_addControlEvents:(UIControlEvents)controlEvents actionBlock:(ButtonActionBlock)actionBlock;


@end






