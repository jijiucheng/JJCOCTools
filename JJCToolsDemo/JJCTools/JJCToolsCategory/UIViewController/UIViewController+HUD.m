//
//  UIViewController+HUD.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/5/15.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "UIViewController+HUD.h"

#import <objc/runtime.h>
#import "MBProgressHUD.h"


#define K_Iphone5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

static const void *HudKey = &HudKey;


@implementation UIViewController (HUD)


/**
 对某个 View 添加提示信息
 
 @param view 要添加的对象
 @param hint 提示信息
 */
- (void)jjc_vc_showHudInView:(UIView *)view hint:(NSString *)hint {
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = hint;
    [view addSubview:hud];
    [hud showAnimated:YES];
    [self setHUD:hud];
}


/**
 添加提示信息
 
 @param hint 提示信息
 */
- (void)jjc_vc_showHint:(NSString *)hint {
    
    UIView *view = [UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.customView.backgroundColor = [UIColor blackColor];
    hud.label.text = hint;
    hud.margin = 10.0f;
    hud.yOffset = K_Iphone5 ? 200.f:150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.0];
}


/**
 隐藏提示信息
 */
- (void)jjc_vc_hideHud {
    [[self HUD] hideAnimated:YES];
}


/**
 从固定位置显示提示信息
 
 @param hint    提示信息
 @param yOffset 固定位置
 */
- (void)jjc_vc_showHint:(NSString *)hint yOffset:(CGFloat)yOffset {
    
    UIView *view = [UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
//    hud.customView.backgroundColor = [UIColor blackColor];
    hud.label.text = hint;
    hud.margin = 10.0f;
    hud.yOffset = K_Iphone5 ? 200.f:150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2.0];
}




#pragma mark --------------------
#pragma mark --------------------  Method  --------------------

- (MBProgressHUD *)HUD {
    return objc_getAssociatedObject(self, HudKey);
}

- (void)setHUD:(MBProgressHUD *)HUD {
    objc_setAssociatedObject(self, HudKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}











@end
