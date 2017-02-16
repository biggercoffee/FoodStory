//
//  FSNHMenuView.m
//  FoodStory
//
//  Created by niuhu on 17/2/15.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "FSNHMenuView.h"

@interface FSNHMenuView ()

//labelArray
@property (nonatomic,strong)NSMutableArray * titleLabelArr;
//self的高度
@property (nonatomic,assign)CGFloat          menuViewHeight;
//btn的高度
@property (nonatomic,assign)CGFloat          buttonHeight;
//label的高度
@property (nonatomic,assign)CGFloat          labelHeight;
//add累加次数
@property (nonatomic,assign)NSInteger        addNumber;
//menuButton
@property (nonatomic,strong)FSMenuButton   * menuButton;
//ScrollView
@property (nonatomic,strong)UIScrollView   * scrollView;
//文字颜色
@property (nonatomic,strong)UIColor        * titleColor;
//文字数组
@property (nonatomic,copy) NSArray  <NSString     *> * titleArray;
//btn数组
@property (nonatomic,strong)NSArray <FSMenuButton *> * menuBtnArray;
@end
@implementation FSNHMenuView
- (instancetype)initWithtitleArray:(NSArray <NSString *>*)titleArray titleColor:(UIColor *)color array:(NSArray <FSMenuButton *>*)buttonArray{
    if (self = [super init]) {
        
        [self load];

        _menuBtnArray = buttonArray;
        _titleArray   = titleArray;
        _titleColor = color;

        
         [self initWithUI];
    }
    return self;
}
- (instancetype)initWithtitleArray:(NSArray <NSString *>*)titleArray array:(NSArray <FSMenuButton *>*)buttonArray{
    return [self initWithtitleArray:titleArray titleColor:[UIColor blackColor] array:buttonArray];
}
- (void)layoutSubviews{
    
    if (_addNumber == _titleArray.count) {
        
        _scrollView.frame = self.bounds;
        NSInteger count = _titleArray.count;
        
        for (int i = 0; i < _menuBtnArray.count; i ++) {
            FSMenuButton * btn = _menuBtnArray[i];
            btn.frame = CGRectMake(10+ i % count * ((SCREEN_WIDTH-10)/5.0), 10, ((SCREEN_WIDTH-20)/5.0-10), _buttonHeight);
            
            _scrollView.contentSize = CGSizeMake((i+1) * ((SCREEN_WIDTH-10)/5.0 ), 0);
        }
        for (int i = 0; i < _titleLabelArr.count; i ++) {
            UILabel * label = _titleLabelArr[i];
            label.frame = CGRectMake(10+ i % count * ((SCREEN_WIDTH-10)/5.0), 50, ((SCREEN_WIDTH-20)/5.0-10), _labelHeight);
        }
    }
}
- (void)load{
    _buttonHeight   = 40;
    _labelHeight    = 25;
    _menuViewHeight = 20;
    _addNumber      = 0;
    
    self.titleArray    = [NSArray array];
    self.menuBtnArray  = [NSArray array];
    self.titleLabelArr = [NSMutableArray array];
    
}
- (void)initWithUI{
    [self addSubview:self.scrollView];
    
    for (FSMenuButton *btn in _menuBtnArray) {
        [btn addTarget:self action:@selector(selectorButtonTypAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [_scrollView addSubview:btn];
    }
    
    for (int i = 0; i < _titleArray.count; i++) {
        
        UILabel *label = [[UILabel alloc]init];
        label.textColor = _titleColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        label.text = _titleArray[i];
        [self addSubview:label];
        [self.titleLabelArr addObject:label];
        [_scrollView addSubview:label];
        _addNumber += 1;
    }
}

- (void)selectorButtonTypAction:(FSMenuButton *)button{
    if (button.buttonAction) {
        button.buttonAction(button);
    }
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}
@end
