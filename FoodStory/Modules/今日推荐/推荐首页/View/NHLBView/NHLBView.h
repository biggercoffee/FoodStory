//
//  NHLBView.h
//  NHLBView
//
//  Created by niuhu on 17/2/8.
//  Copyright © 2017年 NiuHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NHLBView;

@protocol NHLBViewDelegate <NSObject>

@required
/**
 
 注意：如果控制器有NavigationBar，请设置self.automaticallyAdjustsScrollViewInsets = NO;
 
 */
//设置页数
- (NSInteger)numberOfCellInEveryCollectionView;
//每页之间的间隔
- (NSInteger)returnPageControlScrollTime;
//设置每个cell
- (void)lbView:(NHLBView *)lbView setCell:(UICollectionViewCell *)cell withIndexPath:(NSInteger )indexPath;

@optional
//点击cell之后，触发响应
- (void)didSelectItemAtIndexPath:(NSInteger)indexPath;

@end

@interface NHLBView : UIView

@property (nonatomic,assign)id <NHLBViewDelegate> delegate;
//选择滚动的方向 --上下 或者 左右
@property (nonatomic,assign)UICollectionViewScrollDirection scrollType;

- (instancetype)initWithDelegate:(id <NHLBViewDelegate>)delegate;
//注册cell
-(void)registerCellForUICollectionVew:(UICollectionView *)collectionView;
- (UICollectionViewCell *)dequeueReusableCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath;
@end
