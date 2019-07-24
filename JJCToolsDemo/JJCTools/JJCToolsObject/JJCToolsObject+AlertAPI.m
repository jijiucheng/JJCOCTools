//
//  JJCToolsObject+AlertAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 14/12/2017.
//  Copyright © 2017 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject+AlertAPI.h"
#import "JJCToolsObject+BaseAPI.h"


@implementation JJCToolsObject (AlertAPI)


#pragma mark --------------------
#pragma mark --------------------  UIAlertController  --------------------


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
                             actionBlock:(void (^)(BOOL isRight))actionBlock {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (leftString.length > 0) {
        UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftString style:leftActionStyle handler:^(UIAlertAction * _Nonnull action) {
            actionBlock(NO);
        }];
        [alertVC addAction:leftAction];
    }
    
    if (rightString.length > 0) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightString style:rightActionStyle handler:^(UIAlertAction * _Nonnull action) {
            actionBlock(YES);
        }];
        [alertVC addAction:rightAction];
    }
    
    [curController presentViewController:alertVC animated:YES completion:nil];
    
    
    /**
     备注：
     
     修改 title 和 message 属性需要在 UIAlertController 创建成功 present 后才可以通过 runtime 进行动态更改，否则会出现 title 和 message 的显示问题，比如这两个控件字体大小粗细等属性的变更
     */
    // 设置 title 位置
    NSMutableAttributedString *titleAttributeStr = [[NSMutableAttributedString alloc] initWithString:title];
    NSMutableParagraphStyle *titleParagraph = [[NSMutableParagraphStyle alloc] init];
    titleParagraph.alignment = titleAlignment;
    [titleAttributeStr setAttributes:@{NSParagraphStyleAttributeName:titleParagraph} range:NSMakeRange(0, titleAttributeStr.length)];
    [alertVC setValue:titleAttributeStr forKey:@"attributedTitle"];
    
    // 设置 message 位置
    NSMutableAttributedString *messageAttributeStr = [[NSMutableAttributedString alloc] initWithString:message];
    NSMutableParagraphStyle *messageParagraph = [[NSMutableParagraphStyle alloc] init];
    messageParagraph.alignment = messageAlignment;
    [messageAttributeStr setAttributes:@{NSParagraphStyleAttributeName:messageParagraph} range:NSMakeRange(0, messageAttributeStr.length)];
    [alertVC setValue:messageAttributeStr forKey:@"attributedMessage"];
}


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
                             actionBlock:(void (^)(BOOL isRight))actionBlock {
    
    [self jjc_alert_showAlertViewWithTitle:title titleAlignment:NSTextAlignmentCenter message:message messageAlignment:NSTextAlignmentCenter leftString:leftString rightString:rightString leftActionStyle:leftActionStyle rightActionStyle:rightActionStyle curController:curController actionBlock:actionBlock];
}


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
                             actionBlock:(void (^)(BOOL isRight))actionBlock {
    
    [self jjc_alert_showAlertViewWithTitle:title message:message leftString:leftString rightString:rightString leftActionStyle:leftActionStyle rightActionStyle:rightActionStyle curController:[self jjc_base_getCurrentViewController] actionBlock:actionBlock];
}

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
                               actionBlock:(void (^)(BOOL isRight))actionBlock {
    
    [self jjc_alert_showAlertViewWithTitle:[self getLocalizedStringForKey:@"JJCTools_Tips"] message:message leftString:leftString rightString:rightString leftActionStyle:UIAlertActionStyleDefault rightActionStyle:UIAlertActionStyleDefault actionBlock:actionBlock];
}

/**
 AlertControler 快捷显示提示语（包含按钮事件处理）
 
 @param message      提示语
 @param enSureString 自定义确定按钮
 @param actionBlock  按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message
                              enSureString:(NSString *)enSureString
                               actionBlock:(void (^)(void))actionBlock {
    
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
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message
                              enSureString:(NSString *)enSureString {
    
    [self jjc_alert_showAlertViewWithMessage:message leftString:nil rightString:enSureString actionBlock:nil];
}

/**
 AlertControler 快捷显示提示语  确定（包含按钮事件处理）
 
 @param message      提示语
 @param actionBlock  按钮点击事件
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message
                               actionBlock:(void (^)(void))actionBlock {
    
    [self jjc_alert_showAlertViewWithMessage:message leftString:nil rightString:[self getLocalizedStringForKey:@"JJCTools_Confirm"] actionBlock:nil];
}

/**
 AlertControler 快捷显示提示语  确定
 */
+ (void)jjc_alert_showAlertViewWithMessage:(NSString *)message {
    
    [self jjc_alert_showAlertViewWithMessage:message actionBlock:nil];
}



#pragma mark --------------------
#pragma mark --------------------  解决 podspec 子文件夹相互引用问题  --------------------

/**
 #import "NSBundle+JJCToolsResource.h"
 */
+ (NSString *)getLocalizedStringForKey:(NSString *)key {
    
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"JJCTools" ofType:@"bundle"]];
    if (bundle == nil) {
        // （iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理
        NSString *language = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) {
            language = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans";      // 简体中文
            } else {
                language = @"zh-Hant";      // 繁體中文
            }
        } else {
            language = @"en";
        }
        
        // 从 JJCTools.bundle 中查找资源
        bundle = [NSBundle bundleWithPath:[bundle pathForResource:language ofType:@"lproj"]];
    }
    
    return [bundle localizedStringForKey:key value:nil table:nil];
}




@end
