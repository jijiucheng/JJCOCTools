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
 2017.11.09
 
 
 1、该扩展主要用于快捷设置 UILabel 富文本显示相关；
 
 
 */
/********************  说明  *******************/





#import <UIKit/UIKit.h>

@interface UILabel (AttributedString)


- (void)jjc_label_setText:(NSString *)text lineSpace:(CGFloat)lineSpace characterSpace:(CGFloat)characterSpace;


@end



