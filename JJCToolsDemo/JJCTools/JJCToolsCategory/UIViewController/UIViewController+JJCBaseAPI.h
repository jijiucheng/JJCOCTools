//
//  UIViewController+JJCBaseAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/7/30.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UIViewController+JJCBaseAPI
 创建：2018.07.30
 更新：2018.07.30
 
 
 1、该扩展主要用于给 UIViewController 添加基础扩展方法；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

@interface UIViewController (JJCBaseAPI)


/**
 返回到指定控制器

 @param controllerClassName 指定控制器名称
 @param animated            是否带有动画效果
 */
- (void)popToViewController:(NSString *)controllerClassName animated:(BOOL)animated;


@end
