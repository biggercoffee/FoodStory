//
//  SNMyTableViewCell.m
//  FoodStory
//
//  Created by 孙扬 on 2017/2/16.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "SNMyTableViewCell.h"

@interface SNMyTableViewCell ()


@end

@implementation SNMyTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"SNMyTableViewCell";
    SNMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SNMyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setItem:(id)item {
    _item = item;
    self.textLabel.text = item;
}

@end
