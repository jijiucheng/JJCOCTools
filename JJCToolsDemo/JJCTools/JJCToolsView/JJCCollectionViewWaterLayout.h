//
//  JJCCollectionViewWaterLayout.h
//  LiveHere
//
//  Created by mxgx on 2019/4/9.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCCollectionViewWaterLayout
 创建：2019.07.22
 更新：2019.07.22
 
 
 1、该控件封装了 UICollectionView 瀑布流样式；
 
 
 */
/********************  说明  *******************/




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@class JJCCollectionViewWaterLayout;


@protocol JJCCollectionViewWaterLayoutDelegate <NSObject>

@required
- (CGFloat)jjc_waterFlowLayout:(JJCCollectionViewWaterLayout *)waterFlowLayout heigthForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)jjc_columnCountInWaterFlowLayout:(JJCCollectionViewWaterLayout *)waterFlowLayout;
- (CGFloat)jjc_columnMarginInWaterFlowLayout:(JJCCollectionViewWaterLayout *)waterFlowLayout;
- (CGFloat)jjc_rowMarginInWaterFlowLayout:(JJCCollectionViewWaterLayout *)waterFlowLayout;
- (UIEdgeInsets)jjc_edgeInsetsInWaterFlowLayout:(JJCCollectionViewWaterLayout *)waterFlowLayout;

@end


@interface JJCCollectionViewWaterLayout : UICollectionViewLayout

@property (nonatomic, weak) id<JJCCollectionViewWaterLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
