//
//  UITextView+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UITextView+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 UITextView 设置一些属性；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (JJC)

/**
 *  UITextView+placeholder
 */
@property (nonatomic, copy) NSString *jjc_placeholder;

/**
 *  placeHolder颜色
 */
@property (nonatomic, strong) UIColor *jjc_placeholderColor;

/**
 *  IQKeyboardManager等第三方框架会读取placeholder属性并创建UIToolbar展示
 */
@property (nonatomic, copy) NSString *placeholder;


@end

NS_ASSUME_NONNULL_END
