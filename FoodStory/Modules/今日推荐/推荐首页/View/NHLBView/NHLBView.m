//
//  NHLBView.m
//  NHLBView
//
//  Created by niuhu on 17/2/8.
//  Copyright © 2017年 NiuHu. All rights reserved.
//

#import "NHLBView.h"
@interface NHLBView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
//只读--页数
@property (nonatomic,assign,readonly)NSInteger pages;
//只读--时间间隔
@property (nonatomic,assign,readonly)NSInteger pageScrollTime;
//计时器
@property (nonatomic,strong)NSTimer          * timer;
//记录当前页
@property (nonatomic,assign)NSInteger          currentPage;

//  UI------
@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)UIPageControl    * pageControl;
@property (strong, nonatomic) UICollectionViewFlowLayout *collectionViewLayout;
@end

@implementation NHLBView

- (instancetype)initWithDelegate:(id<NHLBViewDelegate>)delegate{
    if (self = [super init]) {
        _delegate = delegate;
        [self initWithUI];
    }
    return  self;
}
- (void)initWithUI{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfCellInEveryCollectionView)]) {
        _pages = [self.delegate numberOfCellInEveryCollectionView];
    }else{
        NSAssert(NO, @"小伙子,是不是忘记实现某个代理了？");
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(returnPageControlScrollTime)]) {
        _pageScrollTime = [self.delegate returnPageControlScrollTime];
    }else{
        NSAssert(NO, @"小伙子,是不是忘记设置时间了？");
    }
    _scrollType = UICollectionViewScrollDirectionHorizontal;
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
    
    //注册cell
    [self registerCellForUICollectionVew:self.collectionView];
    
    [self startTimer];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _collectionView.frame = self.bounds;
    _pageControl.frame = CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width, 20);
}
- (void)drawRect:(CGRect)rect{
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}
#pragma mark Timer
- (void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:_pageScrollTime target:self selector:@selector(changeCollectViewContentOffSet) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
- (void)stopTimer{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
#pragma mark method
- (void)changeCollectViewContentOffSet{
    if (_scrollType == UICollectionViewScrollDirectionHorizontal) {
        [self.collectionView setContentOffset:CGPointMake(self.collectionView.contentOffset.x + self.collectionView.bounds.size.width, 0) animated:YES];
    }else{
        [self.collectionView setContentOffset:CGPointMake(0, self.collectionView.contentOffset.y + self.collectionView.bounds.size.height) animated:YES];
    }
    

}
- (void)setPages:(NSInteger)pages{
    _pages = pages;
}
- (void)setScrollType:(UICollectionViewScrollDirection)scrollType{
    _scrollType = scrollType;
    _collectionViewLayout.scrollDirection = _scrollType;
}
// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}
// 松开手
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //横向滚定
    if (_scrollType == UICollectionViewScrollDirectionHorizontal) {
        _pageControl.currentPage = (scrollView.contentOffset.x / self.bounds.size.width)-1;
        if (_collectionView.contentOffset.x >= self.bounds.size.width * (_pages + 1)) {
            [_collectionView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
        }
        if (_collectionView.contentOffset.x <= 0) {
            [_collectionView setContentOffset:CGPointMake(self.bounds.size.width * _pages, 0) animated:NO];
        }
    }else{
     //竖向滚动
        _pageControl.currentPage = (scrollView.contentOffset.y / self.bounds.size.height)-1;
        if (_collectionView.contentOffset.y >= self.bounds.size.height * (_pages + 1)) {
            [_collectionView setContentOffset:CGPointMake(0, self.bounds.size.height) animated:NO];
        }
        if (_collectionView.contentOffset.y <= 0) {
            [_collectionView setContentOffset:CGPointMake(0, self.bounds.size.height * _pages) animated:NO];
        }
    }
    
}
#pragma mark 子类会重写下面的方法-父类不用管
-(void)registerCellForUICollectionVew:(UICollectionView *)collectionView{
    
}
- (UICollectionViewCell *)dequeueReusableCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
#pragma mark CollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _pages + 2;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSIndexPath *newIndexPath = indexPath;
    if (indexPath.row == _pages+1) {
        newIndexPath  = [NSIndexPath indexPathForRow:1 inSection:indexPath.section];
    }
    if (indexPath.row == 0) {
        newIndexPath  = [NSIndexPath indexPathForRow:_pages inSection:indexPath.section];
    }
    UICollectionViewCell *cell = [self dequeueReusableCellForCollectionView:collectionView withIndexPath:newIndexPath];
    if (self.delegate && [self.delegate respondsToSelector:@selector(lbView:setCell:withIndexPath:)]) {
        [self.delegate lbView:self setCell:cell withIndexPath:newIndexPath.row];
    }
    return cell;

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSIndexPath *newIndexPath = indexPath;
    if (indexPath.row == _pages) {
        newIndexPath  = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItemAtIndexPath:)]) {
        [self.delegate didSelectItemAtIndexPath:indexPath.row+1];
    }
    
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.bounds.size;
}

#pragma mark init UI
- (UICollectionViewFlowLayout *)collectionViewLayout{
    if (!_collectionViewLayout) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = _scrollType;
        layout.minimumLineSpacing = 0;
        layout.minimumLineSpacing = 0;
        _collectionViewLayout = layout;
    }
    return _collectionViewLayout;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.collectionViewLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView = collectionView;
    }
    return _collectionView;
}
- (UIPageControl *)pageControl{
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc]init];
        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.alpha = 1;
        pageControl.numberOfPages = _pages;
        _pageControl = pageControl;
    }
    return _pageControl;
}
@end
