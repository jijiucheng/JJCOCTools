//
//  UITabBar+Badge.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/8.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "UITabBar+Badge.h"


#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height

#define kTag        888


@implementation UITabBar (Badge)


/**
 显示小红点
 
 @param index 要显示的小红点
 */
- (void)jjc_tabBar_showBadgeOnItemIndex:(NSInteger)index {
    
    // 移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    
    // 新建小红点
    UIView *badgeView = [[UIView alloc] init];
    badgeView.backgroundColor = [UIColor redColor];
    badgeView.tag = kTag + index;
    badgeView.layer.cornerRadius = 5;
    
    CGRect tabFrame = self.frame;
    
    NSInteger i = 0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index == i) {
                badgeView.frame = CGRectMake(view.frame.origin.x + view.frame.size.width*0.5 + 5, 1, 10, 10);
                [self addSubview:badgeView];
            }
            
            i++;
        }
    }
    
    if (kScreenW > kScreenH) {
        tabFrame.size.width = kScreenH;
    }
}


/**
 隐藏小红点
 
 @param index 要隐藏的小红点
 */
- (void)jjc_tabBar_hideBadgeOnItemIndex:(NSInteger)index {
    
    // 移除小红点
    [self removeBadgeOnItemIndex:index];
}


/**
 移除小红点

 @param index 要移除的小红点
 */
- (void)removeBadgeOnItemIndex:(NSInteger)index {
    
    // 按照 tag 值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == kTag + index) {
            [subView removeFromSuperview];
        }
    }
}


@end
