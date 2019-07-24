//
//  JJCToolsObject+AlertAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 14/12/2017.
//  Copyright © 2017 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 JJCToolsObject+AlertAPI
 创建：2017.12.14
 更新：2019.07.19
 
 
 1、该扩展主要用于快捷显示提示语；
 
 
 */
/********************  说明  *******************/






#import "JJCToolsObject.h"

@interface JJCToolsObject (AlertAPI)


/***************************  UIAlertController  ***************************/


/**
 AlertControler 快捷显示提示语（包含按钮事件处理）【最基础】
 
 @param title            标题
 @param titleAlignment   标题位置
 @param message          提示语
 @param messageAlignment 提示语位置
 @param leftString       左侧按钮标题
 @param rightString      右侧按钮标题
 @param leftActionStyle  左侧按钮类型
 @param rightActionStyle 右侧按钮类型
 @param actionBlock      按钮点击事件
 @param curController    当前控制器
 */
+ (void)jjc_alert_showAlertViewWithTitle:(NSString *)title
                          titleAlignment:(NSTextAlignment)titleAlignment
                                 message:(NSString *)message
                        messageAlignment:(NSTextAlignment)messageAlignment
                              leftString:(NSString *)leftString
                             rightString:(NSString *)rightString
                         leftActionStyle:(UIAlertActionStyle)leftActionStyle
                        rightActionStyle:(UIAlertActionStyle)rightActionStyle
                           curController:(UIViewController *)curController
                             actionBlock:(void (^)(BOOL isRight))actionBlock;


/**
 AlertControler 快捷显示提示语（包含按钮事件处理）【无法设置 title 和 message 位置】
 
 @param title            标题
 @param message          提示语
 @param leftString       左侧按钮标题
 @param rightString      右侧按钮标题
 @param leftActionStyle  左侧按钮类型
 @param rightActionStyle 右侧按钮类型
 @param actionBlock      按钮点击事件
 @param curController    当前控制器
 */
+ (void)jjc_alert_showAlertViewWithTitle:(NSString *)title
                                 message:(NSString *)message
                              leftString:(NSString *)leftString
                             rightString:(NSString *)rightString
                         leftActionStyle:(UIAlertActionStyle)leftActionStyle
                        rightActionStyle:(UIAlertActionStyle)rightActionStyle
                           curController:(UIViewController *)curController
                             actionBlock:(void (^)(BOOL isRight))actionBlock;


/**
AlertControler 快捷显示提示语（包含按钮事件处理）【无法设置 title 和 message 位置，当前控制器】

@param title            标题
@param message          提示语
@param leftString       左侧按钮标题
@param rightString      右侧按钮标题
@param leftActionStyle  左侧按钮类型
@param rightActionStyle 右侧按钮类型
@param actionBlock      按钮点击事件
*/
+ (void)jjc_alert_showAlertViewWithTitle:(NSString *)title
                                 message:(NSString *)message
                              leftString:(NSString *)leftString
                             rightString:(NSString *)rightString
                         leftActionStyle:(UIAlertActionStyle)leftActionStyle
                        rightActionStyle:(UIAlertActionStyle)rightActionStyle
                             actionBlock:(void (^)(BOOL isRight))actionBlock;

/**
 AlertControler 快捷显示提示语（包含按钮事件处理）【设置 message、leftString、rightString】
 
 @param message     提示语
 @param leftString  左侧按钮标题
 @param rightString 右侧按钮标题
 @param actionBlock 按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message
                                leftString:(NSString *)leftString
                               rightString:(NSString *)rightString
                               actionBlock:(void (^)(BOOL isRight))actionBlock;

/**
 AlertControler 快捷显示提示语（包含按钮事件处理）
 
 @param message      提示语
 @param enSureString 自定义确定按钮
 @param actionBlock  按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message
                              enSureString:(NSString *)enSureString
                               actionBlock:(void (^)(void))actionBlock;

/**
 AlertControler 快捷显示提示语
 
 @param message      提示语
 @param enSureString 自定义确定按钮
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message
                              enSureString:(NSString *)enSureString;

/**
 AlertControler 快捷显示提示语  确定（包含按钮事件处理）
 
 @param message      提示语
 @param actionBlock  按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message
                               actionBlock:(void (^)(void))actionBlock;

/**
 AlertControler 快捷显示提示语  确定
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message;





@end
