//
//  JJCLineVerCodeView.h
//  PetBar
//
//  Created by mxgx on 2019/7/10.
//  Copyright © 2019 mengba. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 JJCLineVerCodeView
 创建：2019.07.22
 更新：2019.07.22
 
 
 1、该控件封装了 输入验证码样式，仅为只有间距下划线的样式；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJCLineVerCodeView : UIView

@property (nonatomic, assign) NSUInteger jjc_codeNum;
@property (nonatomic, assign) CGFloat    jjc_marginSpace;
@property (nonatomic, strong) UIColor   *jjc_lineColor;
@property (nonatomic, strong) UIColor   *jjc_tintColor;
@property (nonatomic, strong) UIFont    *jjc_font;

@property (nonatomic, strong) void(^jjc_getVerCodeCompletionBlock)(NSString *verCodeString);


- (void)jjc_setupCompletion;

@end

NS_ASSUME_NONNULL_END
