//
//  FSMenuButton.h
//  FoodStory
//
//  Created by niuhu on 17/2/16.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSMenuButton;
typedef void (^menuButtonBlock) (FSMenuButton *menuButton);

@interface FSMenuButton : UIButton
//点击响应
@property (nonatomic,copy)menuButtonBlock buttonAction;
/**
 *  初始化方法
 *
 *  @param image                image
 *  @param buttonActionBlock    点击处理
 *
 *  @return return value description
 */
- (instancetype)initWithImage:(UIImage *)image and:(menuButtonBlock)buttonActionBlock;
@end
