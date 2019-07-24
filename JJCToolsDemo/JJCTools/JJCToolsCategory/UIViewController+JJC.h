//
//  UIViewController+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UIViewController+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 UIViewController 添加基础扩展方法；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JJC)

/**
 返回到指定控制器
 
 @param controllerClassName 指定控制器名称
 @param animated            是否带有动画效果
 */
- (void)jjc_vc_popToViewController:(NSString *)controllerClassName animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
