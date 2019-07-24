//
//  UITextField+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UITextField+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 UITextField 设置一些属性；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JJC)

/**
 设置占位符颜色
 */
- (void)setupPlaceholderColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
