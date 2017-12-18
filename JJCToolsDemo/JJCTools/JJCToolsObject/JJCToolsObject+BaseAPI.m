//
//  JJCToolsObject+BaseAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/10/18.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject+BaseAPI.h"

@implementation JJCToolsObject (BaseAPI)


#pragma mark --------------------
#pragma mark --------------------  快捷存取沙盒数据  --------------------

/**
 快捷存沙盒数据
 */
+ (void)jjc_base_saveValue:(id)value forKey:(NSString *)key {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (value == nil) {
        // 当值为nil时，setObject会报错，setValue会自动移除当前Key；为避免移除，传入一个空对象，而不是nil
        [userDefaults setValue:value forKey:key];
    } else {
        [userDefaults setValue:value forKey:key];
    }
    [userDefaults synchronize];  // 写入磁盘
}


/**
 快捷取沙盒数据
 */
+ (id)jjc_base_getValueForKey:(NSString *)key {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}


/**
 快捷删除沙盒字段
 */
+ (void)jjc_base_removeValueForKey:(NSString *)key {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}




#pragma mark --------------------
#pragma mark --------------------  获取文字尺寸  --------------------

/**
 根据 宽度 获取文字的 Size【非系统字体】
 */
+ (CGSize)jjc_base_getContentSize:(NSString *)content Font:(UIFont *)font ContentWidth:(CGFloat)contentWidth {
    
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(contentWidth, MAXFLOAT)  // 用于计算文本绘制时占据的矩形块
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading          // 文本绘制时的附加选项
                                            attributes:@{NSFontAttributeName: font}        // 文字的属性
                                               context:nil].size;
    return contentSize;
}


/**
 根据 高度 获取文字的 Size【非系统字体】
 */
+ (CGSize)jjc_base_getContentSize:(NSString *)content Font:(UIFont *)font ContentHeight:(CGFloat)contentHeight {
    
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, contentHeight)
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName: font}
                                               context:nil].size;
    return contentSize;
}


/**
 根据 宽度 获取文字的 高度 【非系统字体】
 */
+ (CGFloat)jjc_base_getContentHeight:(NSString *)content Font:(UIFont *)font ContentWidth:(CGFloat)contentWidth {
    
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(contentWidth, MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName: font}
                                               context:nil].size;
    return contentSize.height;
}


/**
 根据 高度 获取文字的 宽度 【非系统字体】
 */
+ (CGFloat)jjc_base_getContentWidth:(NSString *)content Font:(UIFont *)font ContentHeight:(CGFloat)contentHeight {
    
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, contentHeight)
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName: font}
                                               context:nil].size;
    return contentSize.width;
}


/**
 根据 宽度 获取文字的 Size【系统字体】
 */
+ (CGSize)jjc_base_getContentSize:(NSString *)content FontFloat:(CGFloat)fontFloat ContentWidth:(CGFloat)contentWidth {
    
    return [self jjc_base_getContentSize:content Font:[UIFont systemFontOfSize:fontFloat] ContentWidth:contentWidth];
}


/**
 根据 高度 获取文字的 Size【系统字体】
 */
+ (CGSize)jjc_base_getContentSize:(NSString *)content FontFloat:(CGFloat)fontFloat ContentHeight:(CGFloat)contentHeight {
    
    return [self jjc_base_getContentSize:content Font:[UIFont systemFontOfSize:fontFloat] ContentHeight:contentHeight];
}


/**
 根据 宽度 获取文字的 高度 【系统字体】
 */
+ (CGFloat)jjc_base_getContentHeight:(NSString *)content FontFloat:(CGFloat)fontFloat ContentWidth:(CGFloat)contentWidth {
    
    return [self jjc_base_getContentHeight:content Font:[UIFont systemFontOfSize:fontFloat] ContentWidth:contentWidth];
}


/**
 根据 高度 获取文字的 宽度 【系统字体】
 */
+ (CGFloat)jjc_base_getContentWidth:(NSString *)content FontFloat:(CGFloat)fontFloat ContentHeight:(CGFloat)contentHeight {
    
    return [self jjc_base_getContentWidth:content Font:[UIFont systemFontOfSize:fontFloat] ContentHeight:contentHeight];
}




#pragma mark --------------------
#pragma mark --------------------  获取时间相关  --------------------

/**
 获取当前时间
 */
+ (NSString *)jjc_base_getCurrentTime {
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:currentDate];
}


/**
 将 时间戳 转换成通用时间格式 @"yyyy-MM-dd HH:mm:ss" 或 @"2017年10月18日 18:00:00"
 */
+ (NSString *)jjc_base_turnStandardTimeWithTimeStampString:(NSString *)timeStampString isChinese:(BOOL)isChinese {
    
    NSDate *date = nil;
    NSUInteger timeIntervalInMilliSecond = [timeStampString longLongValue];
    
    double timeInterval = timeIntervalInMilliSecond;
    if(timeIntervalInMilliSecond > 140000000000) {
        timeInterval = timeIntervalInMilliSecond / 1000;
    }
    
    date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    if (isChinese) {
        [formatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    } else {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    NSString *timeString = [formatter stringFromDate:date];
    
    return timeString;
}


/**
 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 时间戳
 */
+ (long long)jjc_base_turnTimeStampStringByStandardTimeString:(NSString *)standardTimeString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *lastTime = [dateFormatter dateFromString:standardTimeString];
    NSTimeInterval interval = [lastTime timeIntervalSince1970];
    
    long long date = (long long)interval * 1000;    //注意 环信的时间是毫秒
    return date;
}


/**
 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 NSDae 类型
 */
+ (NSDate *)jjc_base_turnFormateDateTimeByStandardTimeString:(NSString *)standardTimeString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *newStr = [standardTimeString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *lastTime = [dateFormatter dateFromString:newStr];
    return lastTime;
}


/**
 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 时间差
 */
+ (NSString *)jjc_base_turnTimeDifferenceByStandardTimeString:(NSString *)standardTimeString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *nowStr = [[NSString alloc] init];
    nowStr = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *nowDate = [dateFormatter dateFromString:nowStr];
    NSDate *lastDate = [dateFormatter dateFromString:standardTimeString];
    
    NSTimeInterval time = [nowDate timeIntervalSinceDate:lastDate];
    
    // 时间转换 ---
    int days    = ((int)time) / (3600*24);
    int hours   = ((int)time) % (3600*24) / 3600;
    int minutes = ((int)time) % (3600*24) % 3600 / 60;
    int secs    = ((int)time) % (3600*24) % 3600 % 60;
    NSString *dateContent;
    
    if (days==0 && hours==0 && minutes==0 && secs==0) {
        dateContent = @"刚刚";
    } else if (days==0 && hours==0 && minutes==0) {
        dateContent = [NSString stringWithFormat:@"%i 秒前", abs(secs)];
    } else if (days==0 && hours==0){
        dateContent = [NSString stringWithFormat:@"%i 分钟前", abs(minutes)];
    } else if(days==0) {
        dateContent = [NSString stringWithFormat:@"%i 小时前", abs(hours)];
    } else if(days<=3) {
        dateContent = [NSString stringWithFormat:@"%i 天前", abs(days)];
    } else if (days>=7 && days<=15){
        dateContent = [NSString stringWithFormat:@"%i 天前", abs(days)];
    } else if (days >=15 && days <=20) {
        dateContent = [NSString stringWithFormat:@"%i 天前", abs(days)];
    } else if(days >=30) {
        dateContent = [NSString stringWithFormat:@"%i 月前", abs(days) / 30];
    } else {
        dateContent = [standardTimeString substringToIndex:10];
    }
    
    return dateContent;
}




#pragma mark --------------------
#pragma mark --------------------  获取颜色图片相关  --------------------

/**
 将颜色转换成图片
 */
+ (UIImage *)jjc_base_turnImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


/**
 设置拍照相册截取压缩头像
 */
+ (UIImage *)jjc_base_createThumbImage:(UIImage *)image Boundary:(CGFloat)boundary {
    
    CGSize imageSize = image.size;
    CGFloat originWidth = imageSize.width;
    CGFloat originHeight = imageSize.height;
    CGFloat scale = 0.0;
    CGFloat scaleWidth = imageSize.width / boundary;
    CGFloat scaleHeight = imageSize.height / boundary;
    if (scaleWidth > scaleHeight)
    {
        scale = scaleWidth;
    }else
    {
        scale = scaleHeight;
    }
    CGRect thumbRect = CGRectZero;
    thumbRect.origin = CGPointMake(0.0, 0.0);
    thumbRect.size.width  = originWidth / scale;
    thumbRect.size.height = originHeight / scale;
    UIGraphicsBeginImageContext(thumbRect.size);
    
    [image drawInRect:thumbRect];
    
    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return thumbImage;
}


/**
 压缩图片
 */
+ (UIImage *)imageByScalingProportionallyWithImage:(UIImage*)image targetSize:(CGSize)targetSize {
    
    UIImage *sourceImage   = image;
    UIImage *newImage      = nil;
    
    CGSize  imageSize      = sourceImage.size;
    CGFloat width          = imageSize.width;
    CGFloat height         = imageSize.height;
    
    CGFloat targetWidth    = targetSize.width;
    CGFloat targetHeight   = targetSize.height;
    
    CGFloat scaleFactor    = 0.0;
    CGFloat scaledWidth    = targetWidth;
    CGFloat scaledHeight   = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        
        CGFloat widthFactor  = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor < heightFactor) {
            scaleFactor = widthFactor;
        } else {
            scaleFactor = heightFactor;
        }
        
        scaledWidth  = width  * scaleFactor;
        scaledHeight = height * scaleFactor;
    }
    
    // this is actually the interesting part:
    targetSize = CGSizeMake(scaledWidth, scaledHeight);
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin      = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (newImage == nil) {
        NSLog(@"could not scale image");
    }
    
    return newImage ;
}


#pragma mark --------------------
#pragma mark --------------------  数字、汉字转换相关  --------------------

/**
 将阿拉伯数字转换成中文数字
 */
+ (NSString *)jjc_base_turnArabicNumToChineseNumWithArabicNum:(NSInteger)arabicNum {
    
    NSString *arabicNumStr = [NSString stringWithFormat:@"%ld", (long)arabicNum];
    NSArray *arabicNumeralsArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0"];
    NSArray *chineseNumeralsArray = @[@"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"零"];
    NSArray *digits = @[@"个", @"十", @"百", @"千", @"万", @"十", @"百", @"千", @"亿", @"十", @"百", @"千", @"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chineseNumeralsArray forKeys:arabicNumeralsArray];
    
    if (arabicNum < 20 && arabicNum > 9) {
        if (arabicNum == 10) {
            return @"十";
        } else {
            NSString *subStr1 = [arabicNumStr substringWithRange:NSMakeRange(1, 1)];
            NSString *a1 = [dictionary objectForKey:subStr1];
            NSString *chinese1 = [NSString stringWithFormat:@"十%@", a1];
            return chinese1;
        }
    } else {
        NSMutableArray *sums = [NSMutableArray array];
        for (int i = 0; i < arabicNumStr.length; i ++) {
            NSString *substr = [arabicNumStr substringWithRange:NSMakeRange(i, 1)];
            NSString *a = [dictionary objectForKey:substr];
            NSString *b = digits[arabicNumStr.length -i-1];
            NSString *sum = [a stringByAppendingString:b];
            if ([a isEqualToString:chineseNumeralsArray[9]]) {
                if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]]) {
                    sum = b;
                    if ([[sums lastObject] isEqualToString:chineseNumeralsArray[9]]) {
                        [sums removeLastObject];
                    }
                } else {
                    sum = chineseNumeralsArray[9];
                }
                
                if ([[sums lastObject] isEqualToString:sum]) {
                    continue;
                }
            }
            
            [sums addObject:sum];
        }
        
        NSString *sumStr = [sums  componentsJoinedByString:@""];
        NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
        return chinese;
    }
}


/**
 将中文转换成首字母(不仅限于中文汉字，可以是数字等)；isUppercase 是否首字母大写【多用于用户名首字母排序】
 */
+ (NSString *)jjc_base_turnFirstCharacterWithChineseString:(NSString *)chineseString isUppercase:(BOOL)isUppercase {
    
    // 将中文字符转换成可变字符串
    NSMutableString *mutableString = [NSMutableString stringWithString:chineseString];
    // 转换成带声调的拼音
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformMandarinLatin, NO);
    // 转换成不带声调的拼音
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformStripDiacritics, NO);
    // 转换成首字母大写
    NSString *pinYin = [mutableString capitalizedString];
    // 判断是否转换成首字母小写并返回该字母
    if (isUppercase) {
        return [pinYin substringToIndex:1];
    } else {
        return [[pinYin lowercaseString] substringToIndex:1];
    }
}




#pragma mark --------------------
#pragma mark --------------------  文本输入显示相关  --------------------

/**
 UILable显示带标签的字符串
 */
+ (NSAttributedString *)jjc_base_getLabelWithHTMLString:(NSString *)htmlString {
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    return attributedString;
}


/**
 过滤 HTML 标签
 */
+ (NSString *)jjc_base_removeHTMLCharacterWithHTMLString:(NSString *)htmlString {
    
    NSScanner *theScanner;
    NSString *text = nil;
    theScanner = [NSScanner scannerWithString:htmlString];
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        htmlString = [htmlString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text]withString:@" "];
    }
    return htmlString;
}




#pragma mark --------------------
#pragma mark --------------------  获取当前状态  --------------------

/**
 获取当前视图控制器 UIViewController
 */
+ (UIViewController *)jjc_base_getCurrentViewController {
    
    // 定义一个变量存放当前屏幕显示的 viewController
    UIViewController *currentVC = nil;
    // 得到当前应用程序的主窗口（需要在 viewDidLoad 加载完成才会有值）
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    // windowLevel 是在 Z轴 方向上的窗口位置，默认值是 UIWindowLevelNormal
    if (keyWindow.windowLevel != UIWindowLevelNormal) {
        // 获取应用程序所有的窗口
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *window in windows) {
            // 找到程序的默认窗口（正在显示的窗口）
            if (window.windowLevel == UIWindowLevelNormal) {
                // 将关键窗口赋值为默认窗口
                keyWindow = window;
                break;
            }
        }
    }
    
    // 获取窗口的当前显示视图
    UIView *frontView = [[keyWindow subviews] objectAtIndex:0];
    
    // 获取视图的下一个响应者，UIView 视图调用这个方法的返回值为 UIViewController 或它的父视图
    id nextResponder = [frontView nextResponder];
    
    // 判断显示视图的下一个响应者是否为一个 UIViewController 的类对象
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        currentVC = nextResponder;
    } else {
        currentVC = keyWindow.rootViewController;
    }
    
    return currentVC;
}




@end








