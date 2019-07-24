//
//  UIView+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "UIView+JJC.h"
#import <objc/runtime.h>


@implementation UIView (JJC)

#pragma mark - 点击事件

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


- (void)tapGestureAction {
    
    void (^block)(void) = objc_getAssociatedObject(self, UIView_key_tapGestureBlock);
    
    if (block) {
        block();
    }
}


#pragma mark - 裁剪

/**
 View 裁剪（默认四个角）
 
 @param rectCorner   选定四角上的某角
 @param cornerRadius 裁剪弧度
 */
- (void)jjc_view_clipRoundWithRectCorner:(JJCRectCorner)rectCorner cornerRadius:(CGFloat)cornerRadius {
    
    UIRectCorner endRectCorner;
    switch (rectCorner) {
        case JJCRectCornerAll: {
            endRectCorner = UIRectCornerAllCorners;
        }
            break;
        case JJCRectCornerTopLeft: {
            endRectCorner = UIRectCornerTopLeft;
        }
            break;
        case JJCRectCornerTopRight: {
            endRectCorner = UIRectCornerTopRight;
        }
            break;
        case JJCRectCornerBottomLeft: {
            endRectCorner = UIRectCornerBottomLeft;
        }
            break;
        case JJCRectCornerBottomRight: {
            endRectCorner = UIRectCornerBottomRight;
        }
            break;
        case JJCRectCornerTop: {
            endRectCorner = UIRectCornerTopLeft | UIRectCornerTopRight;
        }
            break;
        case JJCRectCornerBottom: {
            endRectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        }
            break;
        case JJCRectCornerLeft: {
            endRectCorner = UIRectCornerTopLeft | UIRectCornerBottomLeft;
        }
            break;
        case JJCRectCornerRight: {
            endRectCorner = UIRectCornerTopRight | UIRectCornerBottomRight;
        }
            break;
        default:
            break;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:endRectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}


/**
 View 裁剪（默认四个角）
 
 @param cornerRadius 裁剪弧度
 */
- (void)jjc_view_clipRoundWithCornerRadius:(CGFloat)cornerRadius {
    
    [self jjc_view_clipRoundWithRectCorner:JJCRectCornerAll cornerRadius:cornerRadius];
}



@end
