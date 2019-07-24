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




@end
