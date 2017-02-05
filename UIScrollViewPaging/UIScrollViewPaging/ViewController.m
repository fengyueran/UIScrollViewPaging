//
//  ViewController.m
//  UIScrollViewPaging
//
//  Created by snow on 17/1/12.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "ViewController.h"
#import "XHPageView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XHPageView *pageView = [XHPageView pageView];
    //frame 修改并不立即调用layoutSubviews而是等一次消息循环结束后再渲染
    //一个方法内的代码一般在一个消息循环
    pageView.frame = CGRectMake(37, 50, 250, 200);
    pageView.imageNames = @[@"img_00", @"img_01", @"img_02"];
    pageView.otherColor = [UIColor redColor];
    pageView.currentColor = [UIColor blueColor];
    [self.view addSubview:pageView];
}

@end
