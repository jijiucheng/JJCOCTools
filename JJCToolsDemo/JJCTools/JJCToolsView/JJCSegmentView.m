//
//  JJCSegmentView.m
//  LiveHere
//
//  Created by 苜蓿鬼仙 on 2018/12/24.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "JJCSegmentView.h"
#import "UIView+Frame.h"


static NSInteger baseTag = 200;


@interface JJCSegmentView ()

@property (nonatomic, strong) NSArray  *items;
@property (nonatomic, strong) UIColor  *normalTitleColor;
@property (nonatomic, strong) UIFont   *normalTitleFont;
@property (nonatomic, strong) UIColor  *selectedTitleColor;
@property (nonatomic, strong) UIFont   *selectedTitleFont;
@property (nonatomic, assign) CGFloat   lineViewHeight;
@property (nonatomic, strong) UIColor  *lineViewColor;
@property (nonatomic, assign) CGFloat   lineViewWidthScale;
@property (nonatomic, strong) UIColor  *bottomLineVColor;
@property (nonatomic, assign) CGFloat   bottomLineVH;


@property (nonatomic, strong) NSMutableArray *itemsArrayM;
@property (nonatomic, strong) UIScrollView   *segmentScrollView;
@property (nonatomic, strong) UIView         *lineView;
@property (nonatomic, strong) UIView         *bottomLineView;
@property (nonatomic, strong) UIButton       *curSelectBtn;

@end

@implementation JJCSegmentView

- (instancetype)init {
    if (self = [super init]) {
        
        // 初始化默认参数
        self.normalTitleColor = [UIColor grayColor];
        self.normalTitleFont = [UIFont systemFontOfSize:14.0f];
        self.selectedTitleColor = [UIColor blackColor];
        self.selectedTitleFont = [UIFont systemFontOfSize:16.0f];
        self.lineViewHeight = 2.0f;
        self.lineViewColor = [UIColor redColor];
        self.lineViewWidthScale = 1.0f;
        self.bottomLineVColor = [UIColor clearColor];
        self.bottomLineVH = 0.5;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 初始化默认参数
        self.normalTitleColor = [UIColor grayColor];
        self.normalTitleFont = [UIFont systemFontOfSize:14.0f];
        self.selectedTitleColor = [UIColor blackColor];
        self.selectedTitleFont = [UIFont systemFontOfSize:16.0f];
        self.lineViewHeight = 2.0f;
        self.lineViewColor = [UIColor redColor];
        self.lineViewWidthScale = 1.0f;
        self.bottomLineVColor = [UIColor clearColor];
        self.bottomLineVH = 0.5;
    }
    return self;
}


#pragma mark --------------------
#pragma mark --------------------  Method  --------------------

/** 设置标题数组 **/
- (void)jjc_setupItems:(NSArray *)items {
    self.items = items;
}

/** 设置非选中状态下文字样式 **/
- (void)jjc_setupNormalTitleColor:(UIColor *)titleColor font:(UIFont *)font {
    self.normalTitleColor = titleColor;
    self.normalTitleFont = font;
}

/** 设置选中状态下文字样式 **/
- (void)jjc_setupSelectedTitleColor:(UIColor *)titleColor font:(UIFont *)font {
    self.selectedTitleColor = titleColor;
    self.selectedTitleFont = font;
}

/** 设置下划线高度 **/
- (void)jjc_setupLineViewHeight:(CGFloat)lineViewHeight {
    self.lineViewHeight = lineViewHeight;
}

/** 设置下划线颜色 **/
- (void)jjc_setupLineViewColor:(UIColor *)lineViewColor {
    self.lineViewColor = lineViewColor;
}

/** 设置下划线宽度样式， 1.0~2.0，最低为文字宽度，最高为等比分宽度**/
- (void)jjc_setupLineViewWidthScale:(CGFloat)scale {
    self.lineViewWidthScale = scale;
}

/** 设置底部分割线颜色和高度 **/
- (void)jjc_setupBottomLineViewColor:(UIColor *)bottomLineViewColor height:(CGFloat)height {
    self.bottomLineVColor = bottomLineViewColor;
    self.bottomLineVH = height;
}

/** 属性设置完成后调用 **/
- (void)jjc_setupEnd {
    
    self.itemsArrayM = [NSMutableArray array];
    CGFloat totalW = 0;
    CGFloat margin = 10.0f;
    for (NSString *title in self.items) {
        CGFloat titleWidth = [self getContentWidth:title Font:self.selectedTitleFont ContentHeight:20];
        totalW += (titleWidth + margin);
    }
    
    
    for (NSInteger i=0; i<self.items.count; i++) {
        NSString *title = self.items[i];
        CGFloat titleWidth = [self getContentWidth:title Font:self.selectedTitleFont ContentHeight:20];
        CGFloat buttonWidth;
        if (totalW <= self.segmentScrollView.frame.size.width) {
            buttonWidth = self.segmentScrollView.frame.size.width / self.items.count;
        } else {
            buttonWidth = [self getContentWidth:title Font:self.selectedTitleFont ContentHeight:20] + margin;
        }
        CGFloat lineViewW = titleWidth + (buttonWidth-titleWidth)*0.5*0.5*(self.lineViewWidthScale-1) + margin;

        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:title forKey:@"title"];
        [dict setObject:[NSNumber numberWithFloat:titleWidth] forKey:@"titleWidth"];
        [dict setObject:[NSNumber numberWithFloat:buttonWidth] forKey:@"buttonWidth"];
        [dict setObject:[NSNumber numberWithFloat:lineViewW] forKey:@"lineViewWidth"];
        [dict setObject:[NSNumber numberWithInteger:(baseTag+i)] forKey:@"tag"];
        [self.itemsArrayM addObject:dict];
    }

    
    CGFloat btnX = 0;
    for (NSInteger i=0; i<self.itemsArrayM.count; i++) {
        NSDictionary *dict = self.itemsArrayM[i];
        CGFloat buttonWidth = [dict[@"buttonWidth"] floatValue];
        CGFloat lineViewW   = [dict[@"lineViewWidth"] floatValue];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, 0, buttonWidth, self.segmentScrollView.frame.size.height-self.lineViewHeight);
        [btn setTitle:dict[@"title"] forState:UIControlStateNormal];
        [btn setTitle:dict[@"title"] forState:UIControlStateSelected];
        [btn setTitleColor:self.normalTitleColor forState:UIControlStateNormal];
        [btn setTitleColor:self.selectedTitleColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.normalTitleFont;
        btn.tag = [dict[@"tag"] integerValue];
        btn.selected = NO;
        [btn addTarget:self action:@selector(buttonTitleAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.segmentScrollView addSubview:btn];
        
        btnX += buttonWidth;
        
        if (i == 0) {
            btn.selected = YES;
            btn.titleLabel.font = self.selectedTitleFont;
            self.curSelectBtn = btn;
            
            self.lineView.frame = CGRectMake(self.curSelectBtn.centerX-lineViewW*0.5, self.segmentScrollView.frame.size.height-self.lineViewHeight, lineViewW, self.lineViewHeight);
        }
    }
    
    self.bottomLineView.frame = CGRectMake(0, self.segmentScrollView.frame.size.height-self.bottomLineVH, self.segmentScrollView.frame.size.width, self.bottomLineVH);
}


#pragma mark - 按钮点击事件
- (void)buttonTitleAction:(UIButton *)button {
    
    self.curSelectBtn.selected = NO;
    self.curSelectBtn.titleLabel.font = self.normalTitleFont;
    
    self.curSelectBtn = button;
    self.curSelectBtn.selected = YES;
    self.curSelectBtn.titleLabel.font = self.selectedTitleFont;
    
    CGFloat lineViewW = [[self.itemsArrayM[button.tag-baseTag] objectForKey:@"lineViewWidth"] floatValue];
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.frame = CGRectMake(self.curSelectBtn.centerX-lineViewW*0.5, self.segmentScrollView.frame.size.height-self.lineViewHeight, lineViewW, self.lineViewHeight);
    }];
    
    if (self.jjc_segmentViewSelectIndexBlock) {
        self.jjc_segmentViewSelectIndexBlock(self.curSelectBtn.tag-baseTag);
    }
}


#pragma mark - 选中第几个
/** 选中第几个 **/
- (void)setupSelectIndex:(NSInteger)selectIndex {
    
    self.curSelectBtn.selected = NO;
    self.curSelectBtn.titleLabel.font = self.normalTitleFont;
    
    for (UIView *subV in self.segmentScrollView.subviews) {
        if ([subV isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)subV;
            if (selectIndex == btn.tag - baseTag) {
                
                self.curSelectBtn = btn;
                self.curSelectBtn.selected = YES;
                self.curSelectBtn.titleLabel.font = self.selectedTitleFont;
                
                CGFloat lineViewW = [[self.itemsArrayM[selectIndex] objectForKey:@"lineViewWidth"] floatValue];
                [UIView animateWithDuration:0.5 animations:^{
                    self.lineView.frame = CGRectMake(self.curSelectBtn.centerX-lineViewW*0.5, self.segmentScrollView.bottom-self.lineViewHeight, lineViewW, self.lineViewHeight);
                }];
            }
        }
    }
}

/** 获取当前选中第几个 **/
- (NSInteger)getCurSelectedIndex:(NSInteger)index {
    return (self.curSelectBtn.tag - baseTag);
}


#pragma mark --------------------
#pragma mark --------------------  Lazy Loading  --------------------

- (UIScrollView *)segmentScrollView {
    if (!_segmentScrollView) {
        
        _segmentScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:_segmentScrollView];
    }
    return _segmentScrollView;
}

- (UIView *)lineView {
    if (!_lineView) {
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = self.lineViewColor;
        [self addSubview:_lineView];
    }
    return _lineView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = self.bottomLineVColor;
        [self addSubview:_bottomLineView];
    }
    return _bottomLineView;
}


#pragma mark --------------------
#pragma mark --------------------  Other Method  --------------------

- (CGFloat)getContentWidth:(NSString *)content Font:(UIFont *)font ContentHeight:(CGFloat)contentHeight {
    
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, contentHeight)
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName: font}
                                               context:nil].size;
    return contentSize.width;
}


@end



