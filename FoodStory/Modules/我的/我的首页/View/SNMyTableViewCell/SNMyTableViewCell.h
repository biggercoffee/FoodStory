//
//  SNMyTableViewCell.h
//  FoodStory
//
//  Created by sunny on 2017/2/16.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNMyTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic ,strong)id item;
@end
