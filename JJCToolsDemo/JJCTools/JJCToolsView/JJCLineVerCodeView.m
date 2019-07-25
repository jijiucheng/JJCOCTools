//
//  JJCLineVerCodeView.m
//  PetBar
//
//  Created by mxgx on 2019/7/10.
//  Copyright © 2019 mengba. All rights reserved.
//

#import "JJCLineVerCodeView.h"
#import "UIView+Frame.h"
#import "UILabel+JJC.h"
#import "JJCToolsDefine.h"
#import "NSString+JJC.h"


static NSString *const lineVAnimation = @"lineVAnimation";

@interface JJCLineVerCodeView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView      *lineV;

@end

@implementation JJCLineVerCodeView


- (void)jjc_setCompletion {
    
    CGFloat width = (self.frame.size.width + self.jjc_marginSpace) / self.jjc_codeNum - self.jjc_marginSpace;
    
    for (NSInteger i=0; i<self.jjc_codeNum; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((width+self.jjc_marginSpace)*i, 0, width, self.frame.size.height - 1)];
        [label jjc_label_setText:@"" textColor:[UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1.0f] font:self.jjc_font textAlignment:NSTextAlignmentCenter];
        label.tag = 1000 + i;
        [self addSubview:label];
        
        if (i == 0) {
            self.lineV = [[UIView alloc] initWithFrame:CGRectMake(label.centerX-1, K_Space_Y*0.5, 2, label.height-K_Space_Y)];
            self.lineV.backgroundColor = self.jjc_tintColor;
            [self addSubview:self.lineV];
        }
        
        UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(label.x, label.bottom, label.width, 1)];
        lineV.backgroundColor = self.jjc_lineColor;
        [self addSubview:lineV];
    }
    
    
    [self.textField becomeFirstResponder];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)tapGesture {
    [self.textField becomeFirstResponder];
}


- (UITextField *)textField {
    if (!_textField) {
        
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.tintColor = self.jjc_lineColor;
        [_textField addTarget:self action:@selector(textFieldValueChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_textField];
    }
    return _textField;
}


#pragma mark --------------------
#pragma mark --------------------  UITextFieldDelegate  --------------------

- (void)textFieldValueChange:(UITextField *)textField {
    [self updateLabels];
    
    if (self.jjc_getVerCodeCompletionBlock) {
        self.jjc_getVerCodeCompletionBlock(textField.text);
    }
}

- (void)updateLabels {
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *curLabel = (UILabel *)view;

            if (self.textField.text.length == 0) {
                if (curLabel.tag - 1000 == 0) {
                    curLabel.text = @"";
                    self.lineV.frame = CGRectMake(curLabel.centerX-1, K_Space_Y*0.5, 2, curLabel.height-K_Space_Y);
                    return;
                }
            } else if (self.textField.text.length == self.jjc_codeNum) {
                if (curLabel.tag - 1000 == self.jjc_codeNum - 1) {
                    curLabel.text = [self.textField.text substringWithRange:NSMakeRange(curLabel.tag-1000, 1)];
                    self.lineV.frame = CGRectMake(curLabel.centerX-1+7, K_Space_Y*0.5, 2, curLabel.height-K_Space_Y);
                }
            } else {
                if (curLabel.tag - 1000 == self.textField.text.length) {
                    curLabel.text = @"";
                    self.lineV.frame = CGRectMake(curLabel.centerX-1, K_Space_Y*0.5, 2, curLabel.height-K_Space_Y);
                    return;
                } else {
                    curLabel.text = [self.textField.text substringWithRange:NSMakeRange(curLabel.tag-1000, 1)];
                }
            }
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    self.lineV.hidden = NO;
    
    // 闪烁动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(1.0);
    animation.toValue = @(0.0);
    animation.duration = 1;
    animation.autoreverses = YES;
    animation.repeatCount = CGFLOAT_MAX;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.lineV.layer addAnimation:animation forKey:lineVAnimation];
    
    [animation beginTime];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self.lineV.layer removeAnimationForKey:lineVAnimation];
    self.lineV.hidden = YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    [string jjc_string_cleanAppleInputSpaceChatacter];
    BOOL isAdd = range.length == 0;
    BOOL isOutMax = isAdd && (textField.text.length + string.length > self.jjc_codeNum);
    
    if (isOutMax) {
        return NO;
    } else {
        return YES;
    }
}




@end
