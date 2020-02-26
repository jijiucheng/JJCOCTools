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

/*

使用方法：在需要使用的地方，引入下面两句即可：
   K_Singleton_Interface(MySingle)
   K_Singleton_Implementation(MySingle)
 
使用单例示例：MySingle *single = [MySingle sharedMySingle];

**/

/// interface
#define K_Singleton_Interface(className) \
@interface className : NSObject \
+ (className *)shared##className; \
@end



// implementation
#define K_Singleton_Implementation(className) \
@implementation className \
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
} \
@end


#endif /* JJCToolsSingleton_h */
