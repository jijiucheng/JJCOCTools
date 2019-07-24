//
//  JJCCollectionViewLeftAlignedLayout.h
//  JJCToolsDemo
//
//  Created by mxgx on 2019/7/22.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCCollectionViewLeftAlignedLayout
 创建：2019.07.22
 更新：2019.07.22
 
 
 1、该控件封装了 UICollectionView 居左样式；
 
 
 */
/********************  说明  *******************/




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UICollectionViewDelegateLeftAlignedLayout <UICollectionViewDelegateFlowLayout>

@end

@interface JJCCollectionViewLeftAlignedLayout : UICollectionViewFlowLayout

@end

NS_ASSUME_NONNULL_END
