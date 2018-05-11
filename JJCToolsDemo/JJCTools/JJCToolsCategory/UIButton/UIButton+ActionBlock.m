//
//  UIButton+ActionBlock.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/5/11.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "UIButton+ActionBlock.h"

#import <objc/runtime.h>



@implementation UIButton (ActionBlock)

static char overViewKey;


/**
 添加点击事件 -- Target
 
 @param action         响应事件
 @param controlEvents  响应类型
 */
- (void)jjc_button_addAction:(SEL _Nullable )action forControlEvents:(UIControlEvents)controlEvents {
    
    [self addTarget:self action:action forControlEvents:controlEvents];
}


/**
 添加点击事件 -- Block
 
 @param controlEvents 响应类型
 @param actionBlock   响应block
 */
- (void)jjc_button_addControlEvents:(UIControlEvents)controlEvents actionBlock:(ButtonActionBlock)actionBlock {
    
    objc_setAssociatedObject(self, &overViewKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:controlEvents];
}

- (void)callActionBlock:(id)sender {
    
    ButtonActionBlock actionBlock = (ButtonActionBlock)objc_getAssociatedObject(self, &overViewKey);
    if (actionBlock) {
        actionBlock();
    }
}



@end






