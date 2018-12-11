//
//  JJCToolsObject+RulesAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/11/6.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject+RulesAPI.h"

@implementation JJCToolsObject (RulesAPI)


/**
 判断当前语言环境是否是中文
 */
+ (BOOL)jjc_rules_isChineseLanguageWithCurrentLanguage {
    
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if ([currentLanguage isEqualToString:@"zh-Hans-CN"] || [currentLanguage isEqualToString:@"zh-Hans"] || [currentLanguage isEqualToString:@"zh-Hant-CN"] || [currentLanguage isEqualToString:@"zh-Hant"]) {
        return YES;
    }
    return NO;
}


/**
 判断是否是正确的手机号码
 */
+ (BOOL)jjc_rules_isRightPhoneNumber:(NSString *)PhoneNumber {
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09]|77)[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:PhoneNumber] == YES)
        || ([regextestcm evaluateWithObject:PhoneNumber] == YES)
        || ([regextestct evaluateWithObject:PhoneNumber] == YES)
        || ([regextestcu evaluateWithObject:PhoneNumber] == YES))
    {
        return YES;
    } else {
        return NO;
    }
}


/**
 判断是否是正确的邮箱【正则表达式】
 */
+ (BOOL)jjc_rules_isRightEmail:(NSString *)emailString {
    
    // 邮箱正则
    NSString *emailRule = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    // 进行 NSPredicate（谓词）匹配
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRule];
    // 进行规则判断
    if ([predicate evaluateWithObject:emailString]) {
        return YES;
    } else {
        return NO;
    }
}


/**
 判断是否是纯字母【正则表达式】
 */
+ (BOOL)jjc_rules_isOnlyLetterWithString:(NSString *)string {
    
    // 纯字母正则
    NSString *letterRule = @"[a-zA-Z]";
    // 进行 NSPredicate（谓词）匹配
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", letterRule];
    // 进行规则判断
    if ([predicate evaluateWithObject:string]) {
        return YES;
    } else {
        return NO;
    }
}


/**
 判断是否是纯数字【正则表达式】
 */
+ (BOOL)jjc_rules_isOnlyNumberWithString:(NSString *)string {
    
    // 纯数字正则
    NSString *numberRule = @"[0-9]";
    // 进行 NSPredicate（谓词）匹配
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRule];
    // 进行规则判断
    if ([predicate evaluateWithObject:string]) {
        return YES;
    } else {
        return NO;
    }
}


/**
 判断是否只有字母和数字【正则表达式】
 
 @param isConcurrence  是否同时存在
 */
+ (BOOL)jjc_rules_isOnlyLetterOrNumberWithString:(NSString *)string isConcurrence:(BOOL)isConcurrence {
    
    // 字母数字规则设置
    NSString *letterOrNumberRule;
    if (isConcurrence) {    // 限定同时存在
        letterOrNumberRule = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]$";
    } else {    // 不限定同时存在
        letterOrNumberRule = @"[a-zA-Z0-9]";
    }
    
    // 进行 NSPredicate（谓词）匹配
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", letterOrNumberRule];
    // 进行规则判断
    if ([predicate evaluateWithObject:string]) {
        return YES;
    } else {
        return NO;
    }
}


/**
 限制表情输入【UITextView】
 */
+ (void)jjc_rules_limitTextEmojiWithTextView:(UITextView *)textView {
    
    [textView.text enumerateSubstringsInRange:NSMakeRange(0, textView.text.length)
                                      options:NSStringEnumerationByComposedCharacterSequences
                                   usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                                       if (substring.length > 1){
                                           textView.text = [textView.text stringByReplacingOccurrencesOfString:substring withString:@""];
                                           return ;
                                       }
                                   }];
}


/**
 判断字符串是否包含表情
 */
+ (BOOL)jjc_rules_isIncludeEmojiWithString:(NSString *)string {
    
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                
                                const unichar high = [substring characterAtIndex: 0];
                                
                                // Surrogate pair (U+1D000-1F9FF)
                                if (0xD800 <= high && high <= 0xDBFF) {
                                    const unichar low = [substring characterAtIndex: 1];
                                    const int codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
                                    
                                    if (0x1D000 <= codepoint && codepoint <= 0x1F9FF){
                                        returnValue = YES;
                                    }
                                    // Not surrogate pair (U+2100-27BF)
                                } else {
                                    if (0x2100 <= high && high <= 0x27BF){
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}



@end


