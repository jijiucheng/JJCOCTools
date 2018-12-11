//
//  UIViewController+JJCBaseAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/7/30.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "UIViewController+JJCBaseAPI.h"

@implementation UIViewController (JJCBaseAPI)


/**
 返回到指定控制器
 
 @param controllerClassName 指定控制器名称
 @param animated            是否带有动画效果
 */
- (void)popToViewController:(NSString *)controllerClassName animated:(BOOL)animated {
    
    if (self.navigationController) {
        NSArray *controllers = self.navigationController.viewControllers;
        NSArray *result = [controllers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            return [evaluatedObject isKindOfClass:NSClassFromString(controllerClassName)];
        }]];
        
        if (result.count > 0) {
            [self.navigationController popToViewController:[result firstObject] animated:animated];
        }
    }
}


@end
