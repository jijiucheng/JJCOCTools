//
//  NSString+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "NSString+JJC.h"


@implementation NSString (JJC)


#pragma mark - 基础属性

/**
 判断字符串是否为空
 */
- (BOOL)jjc_string_isEmpty {
    
    if (self.length == 0) {
        return YES;
    }
    if ([self isEqualToString:@"null"] || [self isEqualToString:@"(null)"] || [self isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {     // 去除空格和换行符
        return YES;
    }
    
    return NO;
}

/**
 判断 url 是否合法
 */
- (BOOL)jjc_string_isAvailableHTTPURL {
    
    if ([self jjc_string_isEmpty]) {
        return NO;
    }
    if ([self hasPrefix:@"https://"] || [self hasPrefix:@"http://"]) {
        return YES;
    }
    
    return NO;
}

/**
 判断用户名是否合法
 */
- (BOOL)isRightWithRegularExpression:(JJCRegularExpressionType)type {
    
    NSString *ruleString;
    switch (type) {
        case JJCRegularExpressionTypeCN: {   // 中文
            ruleString = @"^[\u4e00-\u9fa5]+$";
        }
            break;
        case JJCRegularExpressionTypeEN: {   // 英文
            ruleString = @"^[a-zA-Z]+$";
        }
            break;
        case JJCRegularExpressionTypeNumber: {   // 数字
            ruleString = @"^[a-zA-Z]+$";
        }
            break;
        case JJCRegularExpressionTypeCNENNumber: {   // 中英文 + 数字
            ruleString = @"^[\u4e00-\u9fa5a-zA-Z0-9]+$";
        }
            break;
        case JJCRegularExpressionTypeCNENNumber_: {  // 中英文 + 数字 + _
            ruleString = @"^[\u4e00-\u9fa5_a-zA-Z0-9]+$";
        }
            break;
        default:
            break;
    }
    
    NSPredicate *rulePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ruleString];
    if ([rulePredicate evaluateWithObject:self]) {
        return YES;
    } else {
        return NO;
    }
}



#pragma mark - 格式化

/**
 清除空格符
 */
- (void)jjc_string_cleanSpaceChatacter {
    
    [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
 清除苹果输入法空格（苹果输入法空格：8198，普通输入法空格：32）
 */
- (void)jjc_string_cleanAppleInputSpaceChatacter {
    
    NSString *appleInputSpaceChatacter = [NSString stringWithFormat:@"%c", 8198];
    if ([self rangeOfString:appleInputSpaceChatacter].length > 0) {
        [self stringByReplacingOccurrencesOfString:appleInputSpaceChatacter withString:@""];
    }
}

/**
 处理字符串中的特殊字符
 */
- (NSString *)jjc_getStringWithDeleteCharacters:(NSArray *)deleteCharacters {

    NSString *oldString = self;
    for (NSString *str in deleteCharacters) {
        oldString = [oldString stringByReplacingOccurrencesOfString:str withString:@""];
    }
    return oldString;
}



- (NSURL *)jjc_string_urlScheme:(NSString *)scheme {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:[NSURL URLWithString:self] resolvingAgainstBaseURL:NO];
    components.scheme = scheme;
    return [components URL];
}



#pragma mark - 获取文字尺寸

/*
 参考链接：
 1、IOS BUG记录 boundingRectWithSize计算内容宽度高度的问题
 https://blog.csdn.net/gloryFlow/article/details/54311751
 2、段落样式 NSMutableParagraphStyle
 https://www.jianshu.com/p/b0afc45bb642
 */


/**
 获取文字的 Size
 
 @param font            文字字体
 @param contentMaxWH    文字宽或高的最大值
 @param isWidth         文字计算宽度或高度
 @param drawingOptions  文字绘制属性
 @param paragraphStyle  文字段落样式
 */
- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentMaxWH:(CGFloat)contentMaxWH isWidth:(BOOL)isWidth drawingOptions:(NSStringDrawingOptions)drawingOptions paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle {
    
    CGSize size;
    if (isWidth) {
        size = CGSizeMake(contentMaxWH, MAXFLOAT);
    } else {
        size = CGSizeMake(MAXFLOAT, contentMaxWH);
    }
    
    CGSize contentSize = [self boundingRectWithSize:size
                                            options:drawingOptions
                                         attributes:@{NSFontAttributeName: font,
                                                      NSParagraphStyleAttributeName : paragraphStyle}
                                            context:nil].size;
    return contentSize;
}


- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentWidth:(CGFloat)contentWidth paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle {
    
    return [self jjc_string_getContentSizeWithFont:font contentMaxWH:contentWidth isWidth:YES drawingOptions:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading paragraphStyle:paragraphStyle];
}

- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentHeight:(CGFloat)contentHeight paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle {
    
    return [self jjc_string_getContentSizeWithFont:font contentMaxWH:contentHeight isWidth:NO drawingOptions:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading paragraphStyle:paragraphStyle];
}

- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentWidth:(CGFloat)contentWidth {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    return [self jjc_string_getContentSizeWithFont:font contentWidth:contentWidth paragraphStyle:paragraphStyle];
}

- (CGSize)jjc_string_getContentSizeWithFont:(UIFont *)font contentHeight:(CGFloat)contentHeight {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    return [self jjc_string_getContentSizeWithFont:font contentWidth:contentHeight paragraphStyle:paragraphStyle];
}

- (CGFloat)jjc_string_getContentHeightWithFont:(UIFont *)font contentWidth:(CGFloat)contentWidth {
    
    return [self jjc_string_getContentSizeWithFont:font contentWidth:contentWidth].height;
}

- (CGFloat)jjc_string_getContentWidthWithFont:(UIFont *)font contentHeight:(CGFloat)contentHeight {
    
    return [self jjc_string_getContentSizeWithFont:font contentHeight:contentHeight].width;
}

- (CGFloat)jjc_string_getContentHeightWithFontFloat:(CGFloat)fontFloat contentWidth:(CGFloat)contentWidth {
    
    return [self jjc_string_getContentHeightWithFont:[UIFont systemFontOfSize:fontFloat] contentWidth:contentWidth];
}

- (CGFloat)jjc_string_getContentWidthWithFontFloat:(CGFloat)fontFloat contentHeight:(CGFloat)contentHeight {
    
    return [self jjc_string_getContentWidthWithFont:[UIFont systemFontOfSize:fontFloat] contentHeight:contentHeight];
}




@end
