//
//  UITextView+JJC.m
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/19.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "UITextView+JJC.h"
#import <objc/runtime.h>


static const void *jjc_placeholderKey;

@interface UITextView ()

@property (nonatomic, readonly) UILabel *jjc_placeholderLabel;

@end

@implementation UITextView (JJC)

+ (void)load {
    [super load];
    
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(placeholder_swizzling_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(placeholder_swizzled_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(placeholder_swizzled_setText:)));
}

#pragma mark - swizzled

- (void)placeholder_swizzled_dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self placeholder_swizzled_dealloc];
}

- (void)placeholder_swizzling_layoutSubviews {
    
    if (self.jjc_placeholder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.jjc_placeholderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.jjc_placeholderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self placeholder_swizzling_layoutSubviews];
}

- (void)placeholder_swizzled_setText:(NSString *)text {
    
    [self placeholder_swizzled_setText:text];
    if (self.jjc_placeholder) {
        [self updatePlaceholder];
    }
}

#pragma mark - associated

- (NSString *)jjc_placeholder {
    
    return objc_getAssociatedObject(self, &jjc_placeholderKey);
}

- (void)setJjc_placeholder:(NSString *)jjc_placeholder {
    
    objc_setAssociatedObject(self, &jjc_placeholderKey, jjc_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceholder];
}

- (UIColor *)jjc_placeholderColor {
    
    return self.jjc_placeholderLabel.textColor;
}

- (void)setJjc_placeholderColor:(UIColor *)jjc_placeholderColor {
    
    self.jjc_placeholderLabel.textColor = jjc_placeholderColor;
}

- (NSString *)placeholder {
    
    return self.jjc_placeholder;
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    self.jjc_placeholder = placeholder;
}

#pragma mark - update

- (void)updatePlaceholder {
    
    if (self.text.length) {
        [self.jjc_placeholderLabel removeFromSuperview];
        return;
    }
    
    self.jjc_placeholderLabel.font = self.font?self.font:self.cacutDefaultFont;
    self.jjc_placeholderLabel.textAlignment = self.textAlignment;
    self.jjc_placeholderLabel.text = self.jjc_placeholder;
    [self insertSubview:self.jjc_placeholderLabel atIndex:0];
}

#pragma mark - lazzing

- (UILabel *)jjc_placeholderLabel {
    
    UILabel *placeholderLab = objc_getAssociatedObject(self, @selector(jjc_placeholderLabel));
    if (!placeholderLab) {
        
        placeholderLab = [[UILabel alloc] init];
        placeholderLab.numberOfLines = 0;
        placeholderLab.textColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(jjc_placeholderLabel), placeholderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceholder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeholderLab;
}

- (UIFont *)cacutDefaultFont {
    
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}


@end
