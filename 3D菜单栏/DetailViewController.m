//
//  DetailViewController.m
//  3D菜单栏
//
//  Created by fanyingzhao on 15/6/8.
//  Copyright (c) 2015年 fanyingzhao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView* imageView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickBtn:) name:@"clickBtn" object:nil];
}

- (void)clickBtn:(NSNotification*)noti
{
    NSDictionary* dic = [noti.userInfo objectForKey:@"image"];
    self.imageView.image = [UIImage imageNamed:[dic objectForKey:@"bigImage"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (instancetype)shareInstance
{
    static DetailViewController* shareInstance = nil;
    if (shareInstance == nil) {
        UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        shareInstance = [board instantiateViewControllerWithIdentifier:@"detailVC"];
    }
    return shareInstance;
}

@end
