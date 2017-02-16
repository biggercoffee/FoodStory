//
//  FSRecommendVC.m
//  FoodStory
//
//  Created by xiaoping on 2017/2/14.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "FSRecommendVC.h"
#import "NHLBViewPicture.h"
#import "FSNHMenuView.h"

@interface FSRecommendVC ()<NHLBViewDelegate>
@property (nonatomic,strong)UIView            * statueView;
@property (nonatomic,strong)NHLBViewPicture   * lbViewPicture;
@end

@implementation FSRecommendVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"今日推荐";
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:nil selectedImage:nil];
        self.tabBarItem = tabBarItem;
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
        
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    _statueView.hidden = NO;
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    _statueView.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _statueView = [[UIView alloc]   initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, 20)];
    _statueView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_statueView];
    
    /**
     * 横向滚动
     * 也可以竖向滚动，设置scrollType为UICollectionViewScrollDirectionVertical即可
     */
    
    _lbViewPicture = [[NHLBViewPicture alloc]initWithDelegate:self];
    _lbViewPicture.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200);
    _lbViewPicture.scrollType = UICollectionViewScrollDirectionHorizontal;
    [self.view addSubview:_lbViewPicture];
    
    /**
     * menu button type
     * btn的个数 必须跟 title的个数 相对应
     * title字体颜色可以不设置，默认为黑色，API：
     * initWithtitleArray:(NSArray <NSString *>*)titleArray array:(NSArray <FSMenuButton *>*)buttonArray;
     */
    
    FSMenuButton *btn1 = [[FSMenuButton alloc]initWithImage:[UIImage imageNamed:@"清淡"] and:^(FSMenuButton *menuButton) {
        NSLog(@"点击了1");
    }];
    FSMenuButton *btn2 = [[FSMenuButton alloc]initWithImage:[UIImage imageNamed:@"火锅"] and:^(FSMenuButton *menuButton) {
        NSLog(@"点击了2");
    }];
    FSMenuButton *btn3 = [[FSMenuButton alloc]initWithImage:[UIImage imageNamed:@"烧烤"] and:^(FSMenuButton *menuButton) {
        NSLog(@"点击了3");
    }];
    FSMenuButton *btn4 = [[FSMenuButton alloc]initWithImage:[UIImage imageNamed:@"清汤"] and:^(FSMenuButton *menuButton) {
        NSLog(@"点击了4");
    }];
    FSMenuButton *btn5 = [[FSMenuButton alloc]initWithImage:[UIImage imageNamed:@"乱炖"] and:^(FSMenuButton *menuButton) {
        NSLog(@"点击了5");
    }];
    FSMenuButton *btn6 = [[FSMenuButton alloc]initWithImage:[UIImage imageNamed:@"传统"] and:^(FSMenuButton *menuButton) {
        NSLog(@"点击了6");
    }];
    FSMenuButton *btn7 = [[FSMenuButton alloc]initWithImage:[UIImage imageNamed:@"更多"] and:^(FSMenuButton *menuButton) {
        NSLog(@"点击了7");
    }];
    NSArray *titleArr = @[@"清淡",@"火锅",@"烧烤",@"清汤",@"乱炖",@"传统",@"更多"];
    NSArray *btnArray = @[btn1,btn2,btn3,btn4,btn5,btn6,btn7];
    if (titleArr.count != btnArray.count) {
        NSAssert(NO, @"title与btn要对应");
    }else{
        FSNHMenuView *menuView = [[FSNHMenuView alloc]initWithtitleArray:titleArr
                                                              titleColor:[UIColor orangeColor]
                                                                   array:btnArray];
        menuView.frame = CGRectMake(0, CGRectGetMaxY(_lbViewPicture.frame)+2, SCREEN_WIDTH, 75);
        menuView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:menuView];
    }
    
}
#pragma mark NHLBViewDelegate
//cell内容
- (void)lbView:(NHLBView *)lbView setCell:(UICollectionViewCell *)cell withIndexPath:(NSInteger)indexPath{
    
    if (lbView == _lbViewPicture) {
        NHLBViewPictureCell *lbViewPictureCell = (NHLBViewPictureCell *)cell;
        // lbViewPictureCell.textLabel.text = [NSString stringWithFormat:@"第%ld页",indexPath];
        if (indexPath == 0) {
            lbViewPictureCell.imageView.image = [UIImage imageNamed:@"1"];
        }else if(indexPath == 1){
            lbViewPictureCell.imageView.image = [UIImage imageNamed:@"2"];
        }else if (indexPath == 2){
            lbViewPictureCell.imageView.image = [UIImage imageNamed:@"3"];
        }else{
            lbViewPictureCell.imageView.image = [UIImage imageNamed:@"4"];
        }
    }
}
//需要展示的页数
- (NSInteger)numberOfCellInEveryCollectionView{
    return 4;
}
//每页之间的间隔时间
- (NSInteger)returnPageControlScrollTime{
    return 3;
}
//轮播图点击响应
- (void)didSelectItemAtIndexPath:(NSInteger)indexPath{
    NSLog(@"点击了第%ld个",indexPath-1);
    /*
     此处可以跳转页面 或者 广告网页 之类的
     */
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
