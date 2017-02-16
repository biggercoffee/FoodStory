//
//  FSNHMenuView.h
//  FoodStory
//
//  Created by niuhu on 17/2/15.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSMenuButton.h"

@interface FSNHMenuView : UIView
/**
 *  初始化方法
 *  @param titleArray         文字数组
 *  @param buttonArray        数组里盛放添加的btn
 *  @return return value description
 */
- (instancetype)initWithtitleArray:(NSArray <NSString *>*)titleArray array:(NSArray <FSMenuButton *>*)buttonArray;
/**
 *  初始化方法
 *  @param titleArray         文字数组
 *  @param color              文字颜色
 *  @param buttonArray        数组里盛放添加的btn
 *  @return return value description
 */
- (instancetype)initWithtitleArray:(NSArray <NSString *>*)titleArray titleColor:(UIColor *)color array:(NSArray <FSMenuButton *>*)buttonArray;
@end
