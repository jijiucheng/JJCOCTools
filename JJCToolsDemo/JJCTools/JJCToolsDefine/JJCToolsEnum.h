//
//  JJCToolsEnum.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/6/6.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCToolsEnum
 创建：2018.06.06
 更新：2019.07.25
 
 
 1、该扩展主要用于收录枚举定义
 
 
 */
/********************  说明  *******************/




#ifndef JJCToolsEnum_h
#define JJCToolsEnum_h



/**
 重新宏定义 UIRectCorner
 */
typedef NS_ENUM(NSInteger, JJCRectCorner) {
    JJCRectCornerAll = 1,           // 四个角
    JJCRectCornerTopLeft,           // 左上角
    JJCRectCornerTopRight,          // 右上角
    JJCRectCornerBottomLeft,        // 左下角
    JJCRectCornerBottomRight,       // 右下角
    JJCRectCornerTop,               // 左上角 + 右上角
    JJCRectCornerBottom,            // 左下角 + 右下角
    JJCRectCornerLeft,              // 左上角 + 左下角
    JJCRectCornerRight              // 右上角 + 右下角
};


typedef NS_ENUM(NSInteger, JJCRegularExpressionType) {
    JJCRegularExpressionTypeCN = 0,              // 中文               ^[\u4e00-\u9fa5]+$
    JJCRegularExpressionTypeEN,                  // 英文               ^[a-zA-Z]+$
    JJCRegularExpressionTypeNumber,              // 数字               ^[0-9]+$
    JJCRegularExpressionTypeCNENNumber,          // 中英文 + 数字       ^[\u4e00-\u9fa5a-zA-Z0-9]+$
    JJCRegularExpressionTypeCNENNumber_          // 中英文 + 数字 + _   ^[\u4e00-\u9fa5_a-zA-Z0-9]+$
};



#endif /* JJCToolsEnum_h */
