//
//  UITableView+JJC.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 UITableView+JJC
 创建：2019.07.19
 更新：2019.07.19
 
 
 1、该扩展主要用于给 UITableView 设置一些属性；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (JJC)

#pragma mark - 基础属性

/**
 填充分割线
 */
- (void)jjc_tableV_setFillSeparator;
- (void)jjc_tableV_setSeparatorLeft:(CGFloat)left right:(CGFloat)right;


#pragma mark - 兼容适配

/**
 兼容适配 iOS11 (修复底部位置偏移问题)
 */
- (void)jjc_tableV_fixBottomPositionOffsetProblemWithIsSectionHeaderOrFooter:(BOOL)isSectionHeaderOrFooter;
- (void)jjc_tableV_fixBottomPositionOffsetProblem;


@end

NS_ASSUME_NONNULL_END
