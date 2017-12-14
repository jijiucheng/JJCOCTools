//
//  JJCToolsObject+AlertAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 14/12/2017.
//  Copyright © 2017 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject+AlertAPI.h"

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
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Tips", nil) message:message preferredStyle:UIAlertControllerStyleAlert];
    
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
    
    UIViewController *rootVC = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootVC presentViewController:alertVC animated:YES completion:nil];
}

/**
 AlertControler 快捷显示提示语
 
 @param message      提示语
 @param enSureString 自定义确定按钮
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message enSureString:(NSString *)enSureString {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Tips", nil) message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:enSureString style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC addAction:confirmAction];
    
    UIViewController *rootVC = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootVC presentViewController:alertVC animated:YES completion:nil];
}

/**
 AlertControler 快捷显示提示语  确定
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message {
    
    [self jjc_alert_showAlertViewWithMessage:message enSureString:NSLocalizedString(@"Confirm", nil)];
}







@end
