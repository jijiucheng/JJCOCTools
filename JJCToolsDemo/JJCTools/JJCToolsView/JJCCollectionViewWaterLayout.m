//
//  JJCCollectionViewWaterLayout.m
//  LiveHere
//
//  Created by mxgx on 2019/4/9.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "JJCCollectionViewWaterLayout.h"


/** 默认的列数 */
static const NSInteger JJCDefaultColumnCount = 2;
/** 每一列之间的间距 */
static const CGFloat JJCDefaultColumnMargin = 10;
/** 每一行之间的间距 */
static const CGFloat JJCDefaultRowMargin = 10;
/** 边缘间距 */
static const UIEdgeInsets JJCDefaultEdgeInsets = {10, 10, 10, 10};


@interface JJCCollectionViewWaterLayout ()

@property (nonatomic, strong) NSMutableArray *columnHeightArrayM;
@property (nonatomic, strong) NSMutableArray *attributesArrayM;
@property (nonatomic, assign) CGFloat         rowMargin;
@property (nonatomic, assign) CGFloat         columnMargin;
@property (nonatomic, assign) NSInteger       columnCount;
@property (nonatomic, assign) UIEdgeInsets    edgeInsets;

@end

@implementation JJCCollectionViewWaterLayout

/** 进行初始化 **/
- (void)prepareLayout {
    [super prepareLayout];
    
    // 清除以前计算的所有高度
    [self.columnHeightArrayM removeAllObjects];
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeightArrayM addObject:@(self.edgeInsets.top)];
    }
    
    // 清除之前所有的布局属性
    [self.attributesArrayM removeAllObjects];
    
    // 开始创建新的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取 indexPath 位置对应的 cell 布局属性
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributesArrayM addObject:attributes];
    }
}


/** 返回布局数组 **/
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArrayM;
}


/** 返回每个indexPath对应的cell的布局属性 **/
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // collectionView的宽度
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    // 布局的宽度和高度
    CGFloat width = (collectionViewWidth - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1)*self.columnMargin) / self.columnCount;
    CGFloat height = [self.delegate jjc_waterFlowLayout:self heigthForItemAtIndex:indexPath.item itemWidth:width];
    
    // 查找对短的一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeightArrayM[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
        // 第i列高度
        CGFloat columnHeight = [self.columnHeightArrayM[i] doubleValue];
        if (columnHeight < minColumnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    CGFloat x = self.edgeInsets.left + destColumn*(width + self.columnMargin);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top) {
        y += self.rowMargin;
    }
    attributes.frame = CGRectMake(x, y, width, height);
    
    // 更新最短那列的高度
    self.columnHeightArrayM[destColumn] = @(CGRectGetMaxY(attributes.frame));
    return attributes;
}


/** 返回内容的大小 **/
- (CGSize)collectionViewContentSize {
    
    CGFloat maxColumnHeight = [self.columnHeightArrayM[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
        // 取得第i列的高度
        CGFloat columnHeight = [self.columnHeightArrayM[i] doubleValue];
        if (maxColumnHeight < columnHeight) {
            maxColumnHeight = columnHeight;
        }
    }
    return CGSizeMake(0, maxColumnHeight + self.edgeInsets.bottom);
}


#pragma mark - 懒加载
- (NSMutableArray *)columnHeightArrayM {
    if (!_columnHeightArrayM) {
        _columnHeightArrayM = [[NSMutableArray alloc] init];
    }
    return _columnHeightArrayM;
}

- (NSMutableArray *)attributesArrayM {
    if (!_attributesArrayM) {
        _attributesArrayM = [[NSMutableArray alloc] init];
    }
    return _attributesArrayM;
}

- (CGFloat)rowMargin {
    if ([self.delegate respondsToSelector:@selector(jjc_rowMarginInWaterFlowLayout:)]) {
        return [self.delegate jjc_rowMarginInWaterFlowLayout:self];
    } else {
        return JJCDefaultRowMargin;
    }
}

- (CGFloat)columnMargin {
    if ([self.delegate respondsToSelector:@selector(jjc_columnMarginInWaterFlowLayout:)]) {
        return [self.delegate jjc_columnMarginInWaterFlowLayout:self];
    } else {
        return JJCDefaultColumnMargin;
    }
}

- (NSInteger)columnCount {
    if ([self.delegate respondsToSelector:@selector(jjc_columnCountInWaterFlowLayout:)]) {
        return [self.delegate jjc_columnCountInWaterFlowLayout:self];
    } else {
        return JJCDefaultColumnCount;
    }
}

- (UIEdgeInsets)edgeInsets {
    if ([self.delegate respondsToSelector:@selector(jjc_edgeInsetsInWaterFlowLayout:)]) {
        return [self.delegate jjc_edgeInsetsInWaterFlowLayout:self];
    } else {
        return JJCDefaultEdgeInsets;
    }
}

@end
