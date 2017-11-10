//
//  UILabel+AttributedString.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/11/9.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "UILabel+AttributedString.h"

@implementation UILabel (AttributedString)


- (void)jjc_label_setText:(NSString *)text lineSpace:(CGFloat)lineSpace characterSpace:(CGFloat)characterSpace {
    
    if (lineSpace < 0.01 || characterSpace < 0.01 || !text || [text description].length == 0) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttributes:@{NSFontAttributeName: self.font,
                                      NSKernAttributeName: [NSNumber numberWithFloat:characterSpace]}
                              range:NSMakeRange(0, [text length])];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}


@end
