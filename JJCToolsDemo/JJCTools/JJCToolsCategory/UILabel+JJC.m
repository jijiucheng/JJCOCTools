//
//  UILabel+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "UILabel+JJC.h"

@implementation UILabel (JJC)

#pragma mark - 基本设置

- (void)jjc_label_setText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment {
    
    self.text = text;
    self.textColor = textColor;
    self.font = font;
    self.textAlignment = textAlignment;
}

- (void)jjc_label_setText:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font {
    
    [self jjc_label_setText:text textColor:textColor font:[UIFont systemFontOfSize:font] textAlignment:self.textAlignment];
}

/**
 设置阴影
 */
- (void)jjc_label_setShadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset {
    
    self.shadowColor = shadowColor;
    self.shadowOffset = shadowOffset;
}


#pragma mark - 富文本

/**
 调整 Label 文本间距
 
 @param text            文本内容
 @param lineSpace       上下行间距
 @param characterSpace  左右字体间距
 */
- (void)jjc_label_setText:(NSString *)text lineSpace:(CGFloat)lineSpace characterSpace:(CGFloat)characterSpace {
    
    if (lineSpace < 0.01 || characterSpace < 0.01 || !text || [text description].length == 0) {
        self.text = text;
        return;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttributes:@{NSFontAttributeName: self.font,
                                      NSKernAttributeName: [NSNumber numberWithFloat:characterSpace],
                                      NSParagraphStyleAttributeName: paragraphStyle}
                              range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}


@end
