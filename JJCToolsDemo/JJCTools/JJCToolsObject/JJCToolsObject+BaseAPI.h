//
//  JJCToolsObject+BaseAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/10/18.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCToolsObject+BaseAPI
 创建：2017.10.18
 更新：2019.07.25
 
 
 1、该扩展主要用于快捷设置一些基础共用方法
 
 
 */
/********************  说明  *******************/




#import "JJCToolsObject.h"



/**
 月份转换类型
 */
typedef NS_ENUM(NSInteger, JJCMonthTurnType) {
    JJCMonthTurnTypeEnFullName = 0,     // 英文全称(December)
    JJCMonthTurnTypeEnShortPName,       // 英文简写(Dec.)
    JJCMonthTurnTypeEnShortName,        // 英文简写(Dec)
    JJCMonthTurnTypeChFullName,         // 中文全称(十二月)
    JJCMonthTurnTypeChFolkName,         // 中文农历(涂月)
    JJCMonthTurnTypeChOtherName         // 中文它称(腊月)
};



@interface JJCToolsObject (BaseAPI)


/********************  快捷存取沙盒数据  *******************/


/**
 快捷存沙盒数据
 */
+ (void)jjc_base_saveValue:(id)value forKey:(NSString *)key;

/**
 快捷取沙盒数据
 */
+ (id)jjc_base_getValueForKey:(NSString *)key;

/**
 快捷删除沙盒字段
 */
+ (void)jjc_base_removeValueForKey:(NSString *)key;

/**
 快捷存沙盒数据（归档方式）
 */
+ (void)jjc_base_saveObject:(id)object forKey:(NSString *)key;

/**
 快捷取沙盒数据（归档方式）
 */
+ (id)jjc_base_getObjectForKey:(NSString *)key;




/********************  获取文字尺寸  *******************/
/*
 参考链接：
    1、IOS BUG记录 boundingRectWithSize计算内容宽度高度的问题
        https://blog.csdn.net/gloryFlow/article/details/54311751
    2、段落样式 NSMutableParagraphStyle
        https://www.jianshu.com/p/b0afc45bb642
 */

/**
 获取文字的 Size
 
 @param content         文字内容
 @param font            文字字体
 @param contentMaxWH    文字宽或高的最大值
 @param isWidth         文字计算宽度或高度
 @param drawingOptions  文字绘制属性
 @param paragraphStyle  文字段落样式
 */
+ (CGSize)jjc_base_getContentSize:(NSString *)content font:(UIFont *)font contentMaxWH:(CGFloat)contentMaxWH isWidth:(BOOL)isWidth drawingOptions:(NSStringDrawingOptions)drawingOptions paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;

+ (CGSize)jjc_base_getContentSize:(NSString *)content font:(UIFont *)font contentWidth:(CGFloat)contentWidth paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;
+ (CGSize)jjc_base_getContentSize:(NSString *)content font:(UIFont *)font contentHeight:(CGFloat)contentHeight paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;

+ (CGSize)jjc_base_getContentSize:(NSString *)content font:(UIFont *)font contentWidth:(CGFloat)contentWidth;
+ (CGSize)jjc_base_getContentSize:(NSString *)content font:(UIFont *)font contentHeight:(CGFloat)contentHeight;

+ (CGFloat)jjc_base_getContentHeight:(NSString *)content font:(UIFont *)font contentWidth:(CGFloat)contentWidth;
+ (CGFloat)jjc_base_getContentWidth:(NSString *)content font:(UIFont *)font contentHeight:(CGFloat)contentHeight;

+ (CGFloat)jjc_base_getContentHeight:(NSString *)content fontFloat:(CGFloat)fontFloat contentWidth:(CGFloat)contentWidth;
+ (CGFloat)jjc_base_getContentWidth:(NSString *)content fontFloat:(CGFloat)fontFloat contentHeight:(CGFloat)contentHeight;



/********************  获取时间相关  *******************/


/**
 获取当前时间 格式：@"yyyy-MM-dd HH:mm:ss"
 */
+ (NSString *)jjc_base_getCurrentTime;

/**
 将 时间戳 转换成通用时间格式 @"yyyy-MM-dd HH:mm:ss" 或 @"2017年10月18日 18:00:00"
 */
+ (NSString *)jjc_base_turnStandardTimeWithTimeStampString:(NSString *)timeStampString isChinese:(BOOL)isChinese;

/**
 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 时间戳
 */
+ (long long)jjc_base_turnTimeStampStringByStandardTimeString:(NSString *)standardTimeString;

/**
 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 NSDae 类型
 */
+ (NSDate *)jjc_base_turnFormateDateTimeByStandardTimeString:(NSString *)standardTimeString;

/**
 将 通用时间格式 @"yyyy-MM-dd HH:mm:ss" 转换成 时间差
 */
+ (NSString *)jjc_base_turnTimeDifferenceByStandardTimeString:(NSString *)standardTimeString;




/********************  获取颜色图片相关  *******************/


/**
 将颜色转换成图片
 */
+ (UIImage *)jjc_base_turnImageWithColor:(UIColor *)color;

/**
 设置拍照相册截取压缩头像
 */
+ (UIImage *)jjc_base_createThumbImage:(UIImage *)image Boundary:(CGFloat)boundary;

/**
 压缩图片
 */
+ (UIImage *)jjc_base_imageByScalingProportionallyWithImage:(UIImage*)image targetSize:(CGSize)targetSize;




/********************  数字、汉字转换相关  *******************/


/**
 将阿拉伯数字转换成中文数字
 */
+ (NSString *)jjc_base_turnArabicNumToChineseNumWithArabicNum:(NSInteger)arabicNum;

/**
 月份转换，将阿拉伯数字月份，转换成英文状态或中文状态
 
 @param arabicNum       传入的阿拉伯数字月份
 @param monthTurnType   所需要转换的月份类型
 */
+ (NSString *)jjc_base_turnMonthWithArabicNum:(NSInteger)arabicNum monthTurnType:(JJCMonthTurnType)monthTurnType;

/**
 将中文转换成首字母(不仅限于中文汉字，可以是数字等)；isUppercase 是否首字母大写【多用于用户名首字母排序】
 */
+ (NSString *)jjc_base_turnFirstCharacterWithChineseString:(NSString *)chineseString isUppercase:(BOOL)isUppercase;




/********************  文本输入显示相关  *******************/


/**
 UILable显示带标签的字符串
 */
+ (NSAttributedString *)jjc_base_getLabelWithHTMLString:(NSString *)htmlString;

/**
 过滤 HTML 标签
 */
+ (NSString *)jjc_base_removeHTMLCharacterWithHTMLString:(NSString *)htmlString;




/***************************  获取当前状态  ***************************/

/**
 获取当前视图控制器 UIViewController
 */
+ (UIViewController *)jjc_base_getCurrentViewController;




/***************************  获取坐标  ***************************/

/**
 根据圆心坐标、直径、角度计算圆上的坐标
 x1=x+r*cos(角度值*PI/180)
 y1=y-r*sin(角度值*PI/180)
 
 @param center      圆圈在IOS视图中的中心坐标，即该圆视图的center属性
 @param angle       角度值，是0～360之间的值，角度是逆时针转的，从x轴中心(0,0)往右是0度角（或360度角），往左是180度角，往上是90度角，往下是270度角
 @param radius      圆周半径
 */
+ (CGPoint)jjc_base_getCircleCoordinateWithCenter:(CGPoint)center radius:(CGFloat)radius angle:(CGFloat)angle;

/**
 转换坐标（根据圆心、半径、触点计算圆上坐标）
 注：这里要注意 有时拖拽按钮不在圆上，但是只要算出拖拽点与圆心的连线和水平方向的夹角的余弦值，再乘上半径，就是我们想要的值
 
 @param center     圆心坐标
 @param radius     圆半径
 @param touchPoint 手指触点
 @return           圆周上坐标
 */
+ (CGPoint)jjc_base_getCircleCoordinateWithCenter:(CGPoint)center radius:(CGFloat)radius touchPoint:(CGPoint)touchPoint;




@end
