//
//  JJCToolsSingleton.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/5/7.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//





/********************  说明  *******************/
/*
 
 
 JJCToolsDefine
 创建：2018.05.07
 更新：2018.05.07
 
 
 1、该扩展主要用于收录单例类 宏定义
 
 
 */
/********************  说明  *******************/






#ifndef JJCToolsSingleton_h
#define JJCToolsSingleton_h




/***************************  宏定义单例类  ***************************/

// @interface
#define K_Singleton_Interface(className) \
+ (className *)shared##className;


// @implementation
#define K_Singleton_Implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}









#endif /* JJCToolsSingleton_h */
