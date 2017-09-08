//
//  UIView+Animation.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/8.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)


#pragma mark -----
#pragma mark ---------------  呼吸心跳 动画  ---------------

/**
 添加 呼吸心跳 动画
 
 默认：maxSize = 1.0f; minSize = 0.7f; durationPerBeat = 2.0f;
 */
- (void)addAnimationWithHeartAnimation {
    
    [[self class] heartbeatView:self maxSize:1.0f minSize:0.7f durationPerBeat:2.0f];
}


/**
 添加 呼吸心跳 动画
 
 @param maxSize             最大尺寸
 @param minSize             最小尺寸
 @param durationPerBeat     单次时间
 */
- (void)addAnimationWithHeartAnimationWithMaxSize:(CGFloat)maxSize minSize:(CGFloat)minSize durationPerBeat:(CGFloat)durationPerBeat {
    
    [[self class] heartbeatView:self maxSize:maxSize minSize:minSize durationPerBeat:durationPerBeat];
}


/**
 呼吸动画 实现

 @param heartView       当前View
 @param maxSize         最大尺寸
 @param minSize         最小尺寸
 @param durationPerBeat 单次时间
 */
+ (void)heartbeatView:(UIView *)heartView maxSize:(CGFloat)maxSize minSize:(CGFloat)minSize durationPerBeat:(CGFloat)durationPerBeat {
    
    if (heartView && (durationPerBeat > 0.1f)) {
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        
        CATransform3D scale1 = CATransform3DMakeScale(minSize, minSize, 1);
        CATransform3D scale2 = CATransform3DMakeScale(maxSize, maxSize, 1);
        CATransform3D scale3 = CATransform3DMakeScale(minSize, minSize, 1);
        
        NSValue *value1 = [NSValue valueWithCATransform3D:scale1];
        NSValue *value2 = [NSValue valueWithCATransform3D:scale2];
        NSValue *value3 = [NSValue valueWithCATransform3D:scale3];
        
        NSArray *frameValues = [NSArray arrayWithObjects:value1, value2, value3, nil];
        [animation setValues:frameValues];
        
        
        animation.fillMode = kCAFillModeForwards;
        animation.duration = durationPerBeat;
        animation.repeatCount = CGFLOAT_MAX;
        
        
        [heartView.layer removeAllAnimations];
        [heartView.layer addAnimation:animation forKey:@"heartbeatView"];
    }
}





@end
