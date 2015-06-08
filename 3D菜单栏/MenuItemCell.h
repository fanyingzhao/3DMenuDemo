//
//  MenuItemCell.h
//  3D菜单栏
//
//  Created by fanyingzhao on 15/6/8.
//  Copyright (c) 2015年 fanyingzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backimage;

- (void)configureForMenuItem:(NSDictionary*)dic;
@end
