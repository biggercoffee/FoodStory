//
//  FSMyVC.m
//  FoodStory
//
//  Created by xiaoping on 2017/2/14.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "FSMyVC.h"

@interface FSMyVC ()

@end

@implementation FSMyVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"我的";
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:nil selectedImage:nil];
        self.tabBarItem = tabBarItem;
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
