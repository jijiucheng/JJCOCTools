//
//  UITableView+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "UITableView+JJC.h"

@implementation UITableView (JJC)

#pragma mark - 基础属性

/**
 填充分割线
 */
- (void)jjc_tableV_setFillSeparator {
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)jjc_tableV_setSeparatorLeft:(CGFloat)left right:(CGFloat)right {
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0, left, 0, right)];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0, left, 0, right)];
    }
}


#pragma mark - 兼容适配

/**
 兼容适配 iOS11 (修复底部位置偏移问题)
 */
- (void)jjc_tableV_fixBottomPositionOffsetProblemWithIsSectionHeaderOrFooter:(BOOL)isSectionHeaderOrFooter {
    
#ifdef __IPHONE_11_0
    if (@available(iOS 11, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.estimatedRowHeight = 1;
        if (isSectionHeaderOrFooter) {
            self.estimatedSectionHeaderHeight = 1;
            self.estimatedSectionFooterHeight = 1;
        }
    }
#endif
}

- (void)jjc_tableV_fixBottomPositionOffsetProblem {
    
    [self jjc_tableV_fixBottomPositionOffsetProblemWithIsSectionHeaderOrFooter:NO];
}


@end
