//
//  MenuItemCell.m
//  3D菜单栏
//
//  Created by fanyingzhao on 15/6/8.
//  Copyright (c) 2015年 fanyingzhao. All rights reserved.
//

#import "MenuItemCell.h"

@implementation MenuItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureForMenuItem:(NSDictionary *)dic
{
    self.backimage.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    NSArray* temp = [dic objectForKey:@"colors"];
    self.backgroundColor = [UIColor colorWithRed:[temp[0] floatValue]/255 green:[temp[1] floatValue]/255 blue:[temp[2] floatValue]/255 alpha:1];
}

@end
