//
//  JJCDropMemuController.h
//  LiveHere
//
//  Created by mxgx on 2019/4/11.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//



/********************  说明  *******************/
/*
 
 
 JJCDropMemuController
 创建：2019.07.22
 更新：2019.07.22
 
 
 1、该控件封装了 输入验证码样式，仅为只有间距下划线的样式；
 
 
 */
/********************  说明  *******************/



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/** 弹拉框类型 **/
typedef NS_ENUM(NSInteger, JJCDropMemuType) {
    JJCDropMemuTypeDown = 0,    // 向下
    JJCDropMemuTypeUp           // 向上
};


@interface JJCDropMemuController : UIViewController

@property (nonatomic, assign) JJCDropMemuType  jjc_type;                // 弹拉框类型
@property (nonatomic, assign) CGPoint          jjc_startPoint;          // 起始点位置
@property (nonatomic, strong) NSArray         *jjc_dataArray;               // 数据，格式 [{@"image":, @"title":, @"tag": }]

@property (nonatomic, strong) UIColor         *jjc_backgroundColor;     // 背景色
@property (nonatomic, strong) UIColor         *jjc_separatorColor;      // 分割线颜色
@property (nonatomic, assign) CGFloat          jjc_cornerRadius;        // 圆角度数
@property (nonatomic, assign) CGFloat          jjc_maxWidth;            // 显示最大宽度
@property (nonatomic, assign) NSInteger        jjc_maxRowNum;           // 显示最大行数
@property (nonatomic, assign) CGFloat          jjc_rowHeight;           // 行高
@property (nonatomic, assign) CGFloat          jjc_separatorLeftSpace;  // 分割线左侧间距
@property (nonatomic, assign) CGFloat          jjc_separatorRightSpace; // 分割线右侧间距
@property (nonatomic, strong) UIColor         *jjc_textColor;           // 文字颜色
@property (nonatomic, assign) NSTextAlignment  jjc_textAlignment;       // 文字居左居右
@property (nonatomic, strong) UIFont          *jjc_textFont;            // 文字字号



@property (nonatomic, strong) void(^jjc_dropMemuActionBlock)(NSInteger selectIndex);


@end

NS_ASSUME_NONNULL_END
