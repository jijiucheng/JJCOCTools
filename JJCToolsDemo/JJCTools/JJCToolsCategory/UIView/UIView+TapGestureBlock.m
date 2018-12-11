//
//  UIView+TapGestureBlock.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/8.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "UIView+TapGestureBlock.h"
#import <objc/runtime.h>


@implementation UIView (TapGestureBlock)


static const void *UIView_key_tapGestureBlock = &UIView_key_tapGestureBlock;


/**
 添加点击事件 -- Target
 
 @param target target
 @param action action
 */
- (void)jjc_view_addTapGestureWithTarget:(nullable id)target action:(SEL _Nullable )action {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tapGesture];
}


/**
 添加点击事件 -- Block
 
 @param block block
 */
- (void)jjc_view_addTapGestureWithBlock:(void(^_Nullable)(void))block {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction)];
    [self addGestureRecognizer:tapGesture];
    
    
    objc_setAssociatedObject(self, UIView_key_tapGestureBlock, block, OBJC_ASSOCIATION_COPY);
}


#pragma mark -----
#pragma mark ---------------  Method  ---------------

- (void)tapGestureAction {
    
    void (^block)(void) = objc_getAssociatedObject(self, UIView_key_tapGestureBlock);
    
    if (block) {
        block();
    }
}





@end




