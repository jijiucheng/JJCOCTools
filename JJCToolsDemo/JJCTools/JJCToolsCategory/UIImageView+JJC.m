//
//  UIImageView+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "UIImageView+JJC.h"

@implementation UIImageView (JJC)

#pragma mark - 裁剪

- (void)jjc_imageV_clipRoundWithRectCorner:(JJCRectCorner)rectCorner cornerRadius:(CGFloat)cornerRadius {
    
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

- (void)jjc_imageV_clipRoundWithCornerRadius:(CGFloat)cornerRadius {
    
    [self jjc_imageV_clipRoundWithRectCorner:JJCRectCornerAll cornerRadius:cornerRadius];
}

@end
