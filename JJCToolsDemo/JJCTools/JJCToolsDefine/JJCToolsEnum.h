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
 更新：2018.06.06
 
 
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




#endif /* JJCToolsEnum_h */
