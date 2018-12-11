//
//  UILabel+AttributedString.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/11/9.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 UILabel+AttributedString
 创建：2017.11.09
 更新：2017.11.10
 
 
 1、该扩展主要用于快捷设置 UILabel 富文本显示相关；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>

@interface UILabel (AttributedString)


/**
 调整 Label 文本间距

 @param text            文本内容
 @param lineSpace       上下行间距
 @param characterSpace  左右字体间距
 */
- (void)jjc_label_setText:(NSString *)text lineSpace:(CGFloat)lineSpace characterSpace:(CGFloat)characterSpace;


@end



