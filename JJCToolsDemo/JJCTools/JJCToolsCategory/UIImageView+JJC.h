//
//  UIImageView+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UIImageView+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 UIImageView 设置一些属性；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIView+JJC.h"


NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JJC)


#pragma mark - 裁剪

- (void)jjc_imageV_clipRoundWithRectCorner:(JJCRectCorner)rectCorner cornerRadius:(CGFloat)cornerRadius;
- (void)jjc_imageV_clipRoundWithCornerRadius:(CGFloat)cornerRadius;


@end

NS_ASSUME_NONNULL_END
