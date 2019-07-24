//
//  UIButton+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "UIButton+JJC.h"

@implementation UIButton (JJC)

#pragma marl - 基础属性

- (void)jjc_btn_setBackgroundImage:(UIImage *)image selectBackgroundImage:(UIImage *)selectImage {
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
    [self setBackgroundImage:selectImage forState:UIControlStateSelected];
}

- (void)jjc_btn_setImage:(NSString *)image selectImage:(NSString *)selectImage {
    
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
}

- (void)jjc_btn_setTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font forState:(UIControlState)state {
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.titleLabel.font = font;
}

- (void)jjc_btn_setTitle:(NSString *)title titleColor:(UIColor *)titleColor fontFloat:(CGFloat)fontFloat forState:(UIControlState)state {
    
    [self jjc_btn_setTitle:title titleColor:titleColor font:[UIFont systemFontOfSize:fontFloat] forState:state];
}

- (void)jjc_btn_setTitle:(NSString *)title titleColor:(UIColor *)titleColor fontFloat:(CGFloat)fontFloat {
    
    [self jjc_btn_setTitle:title titleColor:titleColor font:[UIFont systemFontOfSize:fontFloat] forState:UIControlStateNormal];
}


// 设置阴影
- (void)jjc_btn_setShadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset {
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = shadowOffset;
}


@end
