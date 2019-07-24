//
//  UITextField+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "UITextField+JJC.h"

@implementation UITextField (JJC)

/**
 设置占位符颜色
 */
- (void)setupPlaceholderColor:(UIColor *)color {
    
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end
