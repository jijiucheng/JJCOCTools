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
- (void)jjc_textField_setPlaceholderColor:(UIColor *)color {
    
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}


/**
 修正苹果原生中文输入法预输入问题（需要在 change 的方法里使用）
 */
- (void)jjc_textField_fixAppleSystemChineseInputMethodWithPreInput {
    
    // 处理苹果中文输入法预输入问题
    NSString *selectString = [self textInRange:self.markedTextRange];
    if (selectString.length > 0) {
        // 判断选中预选中文字是否为中文
        NSString *match = @"(^[\u4e00-\u9fa5]+$)";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
        BOOL isChinese = [predicate evaluateWithObject:selectString];
        if (!isChinese) {
            self.text = [self.text substringToIndex:(self.text.length - selectString.length)];
        }
    }
}

@end
