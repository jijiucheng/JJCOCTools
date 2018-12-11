//
//  JJCToolsObject+AlertAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 14/12/2017.
//  Copyright © 2017 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject+AlertAPI.h"

#import "JJCToolsObject+BaseAPI.h"
#import "NSBundle+JJCToolsResource.h"


@implementation JJCToolsObject (AlertAPI)


#pragma mark --------------------
#pragma mark --------------------  UIAlertController  --------------------

/**
 AlertControler 快捷显示提示语（包含按钮事件处理）
 
 @param message     提示语
 @param leftString  左侧按钮标题
 @param rightString 右侧按钮标题
 @param actionBlock 按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message leftString:(NSString *)leftString rightString:(NSString *)rightString actionBlock:(void (^)(BOOL isRight))actionBlock {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:[NSBundle jjc_bundle_getLocalizedStringForKey:@"JJCTools_Tips"] message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (leftString.length > 0) {
        UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            actionBlock(NO);
        }];
        [alertVC addAction:leftAction];
    }
    
    if (rightString.length > 0) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            actionBlock(YES);
        }];
        [alertVC addAction:rightAction];
    }
    
    UIViewController *rootVC = [self jjc_base_getCurrentViewController];
    [rootVC presentViewController:alertVC animated:YES completion:nil];
}


/**
 AlertControler 快捷显示提示语（包含按钮事件处理）
 
 @param message      提示语
 @param enSureString 自定义确定按钮
 @param actionBlock  按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message enSureString:(NSString *)enSureString actionBlock:(void (^)(void))actionBlock {
    
    [self jjc_alert_showAlertViewWithMessage:message leftString:nil rightString:enSureString actionBlock:^(BOOL isRight) {
        
        if (isRight) {
            actionBlock();
        }
    }];
}


/**
 AlertControler 快捷显示提示语
 
 @param message      提示语
 @param enSureString 自定义确定按钮
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message enSureString:(NSString *)enSureString {
    
    [self jjc_alert_showAlertViewWithMessage:message leftString:nil rightString:enSureString actionBlock:nil];
}

/**
 AlertControler 快捷显示提示语  确定（包含按钮事件处理）
 
 @param message      提示语
 @param actionBlock  按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message actionBlock:(void (^)(void))actionBlock {
    
    [self jjc_alert_showAlertViewWithMessage:message leftString:nil rightString:[NSBundle jjc_bundle_getLocalizedStringForKey:@"JJCTools_Confirm"] actionBlock:^(BOOL isRight) {
        
        if (isRight) {
            actionBlock();
        }
    }];
}

/**
 AlertControler 快捷显示提示语  确定
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message {
    
    [self jjc_alert_showAlertViewWithMessage:message actionBlock:nil];
}







@end
