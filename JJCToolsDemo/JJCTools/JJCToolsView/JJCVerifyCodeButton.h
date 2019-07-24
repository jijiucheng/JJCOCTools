//
//  JJCVerifyCodeButton.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/22.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 JJCVerifyCodeButton
 创建：2019.07.22
 更新：2019.07.22
 
 
 1、该控件封装了 获取验证码按钮；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJCVerifyCodeButton : UIButton

@property (nonatomic, strong) void(^jjc_verifyCodeBtnActionBlock)(void);


- (void)jjc_setupTitle:(NSString *)title titleColor:(UIColor *)titleColor;
- (void)jjc_setupCountDownTitle:(NSString *)title titleColor:(UIColor *)titleColor;
- (void)jjc_setupTotalTimeNum:(NSInteger)totalTimeNum;

/** 开始倒计时 **/
- (void)jjc_startCountdown;

@end

NS_ASSUME_NONNULL_END
