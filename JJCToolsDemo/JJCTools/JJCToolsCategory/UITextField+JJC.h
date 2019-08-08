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
- (void)jjc_textField_setPlaceholderColor:(UIColor *)color;

/**
 修正苹果原生中文输入法预输入问题（需要在 change 的方法里使用）
 */
- (void)jjc_textField_fixAppleSystemChineseInputMethodWithPreInput;



@end

NS_ASSUME_NONNULL_END
