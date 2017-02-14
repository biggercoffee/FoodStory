//
//  FSAPPConfigure.m
//  FoodStory
//
//  Created by xiaoping on 2017/2/14.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "FSAPPConfigure.h"

#import "FSRecommendVC.h"
#import "FSMyVC.h"
#import "FSFindVC.h"

@import UIKit;

@implementation FSAPPConfigure

+ (UIViewController *)getRootController {
    //Recommend
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    tabbarVC.viewControllers = @[
                                 [[UINavigationController alloc] initWithRootViewController:[FSRecommendVC new]],
                                 [[UINavigationController alloc] initWithRootViewController:[FSFindVC new]],
                                 [[UINavigationController alloc] initWithRootViewController:[FSMyVC new]],
                                 ];
    
    return tabbarVC;
}

@end
