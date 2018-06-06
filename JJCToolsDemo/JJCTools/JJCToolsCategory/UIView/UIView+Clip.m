//
//  UIView+Clip.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/6/6.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "UIView+Clip.h"

@implementation UIView (Clip)


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
