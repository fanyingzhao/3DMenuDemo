//
//  ViewController.m
//  3D菜单栏
//
//  Created by fanyingzhao on 15/6/8.
//  Copyright (c) 2015年 fanyingzhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIScrollView* scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.menuView.layer.anchorPoint = CGPointMake(1, 0.5);
    [self hiddenMenuView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickBtn:) name:@"clickBtn" object:nil];
}

- (void)clickBtn:(NSNotification*)noti
{
    [self hiddenMenuView];
}

- (void)hiddenMenuView
{
    [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.menuView.bounds), 0) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat multiplier = 1.0 / CGRectGetWidth(self.menuView.bounds);
    CGFloat offset = scrollView.contentOffset.x * multiplier; 
    CGFloat fraction = 1.0 - offset;
    self.menuView.layer.transform = [self transformForFraction:fraction];
    self.menuView.alpha = fraction;
    
    scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame));
}

- (CATransform3D)transformForFraction:(CGFloat)fraction
{
    CATransform3D identity = CATransform3DIdentity;
    identity.m34 = -1.0 / 1000.0;
    CGFloat angle = (1.0 - fraction) * -M_PI_2;
    CGFloat xOffset = CGRectGetWidth(self.menuView.bounds) * 0.5;
    CATransform3D rotateTransform = CATransform3DRotate(identity, angle, 0, 1, 0);
    CATransform3D translateTransform = CATransform3DMakeTranslation(xOffset, 0, 0);
    return CATransform3DConcat(rotateTransform, translateTransform);
}

@end
