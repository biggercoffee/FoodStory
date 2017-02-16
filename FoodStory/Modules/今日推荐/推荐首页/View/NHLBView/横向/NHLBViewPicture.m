//
//  NHLBViewPicture.m
//  NHLBView
//
//  Created by niuhu on 17/2/8.
//  Copyright © 2017年 NiuHu. All rights reserved.
//

#import "NHLBViewPicture.h"


static NSString * const cellID = @"Identifier";

@implementation NHLBViewPicture

- (instancetype)initWithDelegate:(id<NHLBViewDelegate>)delegate{
    if (self = [super initWithDelegate:delegate]) {
    }
    return self;
}
//子类重写父类注册方法
- (void)registerCellForUICollectionVew:(UICollectionView *)collectionView{
    [super registerCellForUICollectionVew:collectionView];
    [collectionView registerClass:[NHLBViewPictureCell class] forCellWithReuseIdentifier:cellID];
}
- (UICollectionViewCell *)dequeueReusableCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath{
    [super dequeueReusableCellForCollectionView:collectionView withIndexPath:indexPath];
    NHLBViewPictureCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}
@end
