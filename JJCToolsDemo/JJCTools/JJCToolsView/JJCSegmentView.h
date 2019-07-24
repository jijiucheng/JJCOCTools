//
//  JJCSegmentView.h
//  LiveHere
//
//  Created by 苜蓿鬼仙 on 2018/12/24.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 JJCSegmentView
 创建：2019.07.22
 更新：2019.07.22
 
 
 1、该控件封装了 类似网易头条首页分类切换；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

@interface JJCSegmentView : UIView

@property (nonatomic, strong) void(^jjc_segmentViewSelectIndexBlock)(NSInteger curSelectIndex);


/** 设置标题数组 **/
- (void)jjc_setupItems:(NSArray *)items;
/** 设置非选中状态下文字样式 **/
- (void)jjc_setupNormalTitleColor:(UIColor *)titleColor font:(UIFont *)font;
/** 设置选中状态下文字样式 **/
- (void)jjc_setupSelectedTitleColor:(UIColor *)titleColor font:(UIFont *)font;
/** 设置下划线高度 **/
- (void)jjc_setupLineViewHeight:(CGFloat)lineViewHeight;
/** 设置下划线颜色 **/
- (void)jjc_setupLineViewColor:(UIColor *)lineViewColor;
/** 设置下划线宽度样式， 1.0~2.0，最低为文字宽度，最高为等比分宽度**/
- (void)jjc_setupLineViewWidthScale:(CGFloat)scale;
/** 设置底部分割线颜色和高度 **/
- (void)jjc_setupBottomLineViewColor:(UIColor *)bottomLineViewColor height:(CGFloat)height;


/** 属性设置完成后调用【必须调用】 **/
- (void)jjc_setupEnd;

/** 选中第几个 **/
- (void)jjc_setupSelectIndex:(NSInteger)selectIndex;
/** 获取当前选中第几个 **/
- (NSInteger)jjc_getCurSelectedIndex:(NSInteger)index;

@end
