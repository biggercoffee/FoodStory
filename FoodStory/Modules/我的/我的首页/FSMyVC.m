//
//  FSMyVC.m
//  FoodStory
//
//  Created by xiaoping on 2017/2/14.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "FSMyVC.h"
#import "SNMyTableViewCell.h"

@interface FSMyVC ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,copy) NSArray *dataSource;
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
    [self setupUI];
    [self setupData];
}

- (void)setupData {
    _dataSource = @[@"1",@"2",@"3",@"4",@"5"];
}

- (void)setupUI {
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [UIView new];
        tableView.rowHeight = 60;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.separatorInset = UIEdgeInsetsZero;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
}

#pragma mark - UITableViewdelegte & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SNMyTableViewCell *cell = [SNMyTableViewCell cellWithTableView:tableView];
    cell.item = self.dataSource[indexPath.row];
    return cell;
}

@end
