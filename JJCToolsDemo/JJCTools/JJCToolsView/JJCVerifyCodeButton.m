//
//  JJCVerifyCodeButton.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/22.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "JJCVerifyCodeButton.h"


@interface JJCVerifyCodeButton ()

@property (nonatomic, assign) NSInteger totalTimeNum;

@property (nonatomic, strong) NSString *normalTitle;
@property (nonatomic, strong) UIColor  *normalTitleColor;
@property (nonatomic, strong) NSString *countDownTitle;
@property (nonatomic, strong) UIColor  *countDownTitleColor;

@end

@implementation JJCVerifyCodeButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addTarget:self action:@selector(verifyCodeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)jjc_setupTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (!self.normalTitle) {
        self.normalTitle = title;
        self.normalTitleColor = titleColor;
    }
}

- (void)jjc_setupCountDownTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    
    self.countDownTitle = title;
    self.countDownTitleColor = titleColor;
}

- (void)jjc_setupTotalTimeNum:(NSInteger)totalTimeNum {
    self.totalTimeNum = totalTimeNum;
}


#pragma mark - 按钮点击事件
/** 按钮点击事件 **/
- (void)verifyCodeBtnAction {
    
    if (self.jjc_verifyCodeBtnActionBlock) {
        self.jjc_verifyCodeBtnActionBlock();
    }
}


#pragma mark - 开始倒计时
/** 开始倒计时 **/
- (void)jjc_startCountdown {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    
    NSTimeInterval seconds = self.totalTimeNum;
    // 最后期限
    CFTimeInterval endTime = CACurrentMediaTime() + seconds;
    
    dispatch_source_set_event_handler(_timer, ^{
        CFTimeInterval interval = endTime - CACurrentMediaTime();
        if (interval > 0) {
            // 更新倒计时
            NSString *timeStr = [NSString stringWithFormat:@"%@ %.0fs", self.countDownTitle, interval];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = NO;
                [self jjc_setupTitle:timeStr titleColor:self.countDownTitleColor];
            });
        } else {
            // 倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = YES;
                [self jjc_setupTitle:self.normalTitle titleColor:self.normalTitleColor];
            });
        }
    });
    dispatch_resume(_timer);
}

@end
