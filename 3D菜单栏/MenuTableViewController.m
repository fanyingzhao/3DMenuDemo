//
//  MenuTableViewController.m
//  3D菜单栏
//
//  Created by fanyingzhao on 15/6/8.
//  Copyright (c) 2015年 fanyingzhao. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuItemCell.h"
#import "DetailViewController.h"
#import "ViewController.h"

@interface MenuTableViewController ()
@property (strong, nonatomic) NSArray* array;
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    self.array = [NSArray arrayWithContentsOfFile:path];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuItemCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MenuItemCell" owner:nil options:nil] lastObject];
    }
    [cell configureForMenuItem:[self.array objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MAX(80, CGRectGetHeight(self.view.bounds) / self.array.count);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clickBtn" object:nil userInfo:@{@"image":[self.array objectAtIndex:indexPath.row]}];
}

@end
