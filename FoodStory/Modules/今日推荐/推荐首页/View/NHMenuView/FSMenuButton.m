//
//  FSMenuButton.m
//  FoodStory
//
//  Created by niuhu on 17/2/16.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "FSMenuButton.h"

@implementation FSMenuButton

- (instancetype)initWithImage:(UIImage *)image and:(menuButtonBlock)buttonActionBlock{
    if (self = [super init]) {
        if (image) {
            [self setImage:image forState:UIControlStateNormal];
        }
        _buttonAction = [buttonActionBlock copy];
    }
    return self;
}

@end
