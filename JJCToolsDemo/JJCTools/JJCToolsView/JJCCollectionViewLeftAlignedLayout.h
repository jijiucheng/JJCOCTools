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
 2、该控件封装是抄录于 "UICollectionViewLeftAlignedLayout"，在此改名仅仅是为了方便自己这边使用，如果作者认为侵权，可联系删除
 
 
 */
/********************  说明  *******************/




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UICollectionViewDelegateLeftAlignedLayout <UICollectionViewDelegateFlowLayout>

@end

@interface JJCCollectionViewLeftAlignedLayout : UICollectionViewFlowLayout

@end

NS_ASSUME_NONNULL_END
