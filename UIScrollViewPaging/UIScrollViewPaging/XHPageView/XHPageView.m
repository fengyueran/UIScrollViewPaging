//
//  XHPageView.m
//  UIScrollViewPaging
//
//  Created by snow on 17/2/5.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHPageView.h"
@interface XHPageView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation XHPageView
//aDecoder是对xib的解析器，当控件通过xib/stroryboard创建时调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
//    if (self) {
//        self.scrollView.backgroundColor = [UIColor redColor];
//    }
    return self;
}

//解析完毕后调用
- (void)awakeFromNib {
     self.scrollView.backgroundColor = [UIColor redColor];
}
//控制器直接用alloc可加载同名xib
+ (instancetype)pageView {
  return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}

#pragma mark - setter方法的重写
- (void)setImageNames:(NSArray *)imageNames {
    _imageNames = imageNames;
    //移除之前的imageView,让数组中所有对象执行selector方法
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i < imageNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.pagingEnabled = YES;
    
    //设置总页数
    self.pageControl.numberOfPages = imageNames.count;
    self.pageControl.hidesForSinglePage = YES;
}

- (void)setOtherColor:(UIColor *)otherColor {
    self.pageControl.pageIndicatorTintColor = otherColor;
    
}

- (void)setCurrentColor:(UIColor *)currentColor {
    self.pageControl.currentPageIndicatorTintColor = currentColor;
    
}

//add subview时会调用(当前view被add)
//当前view frame改变时调用
- (void)layoutSubviews {
    [super layoutSubviews];
    //设置scrollView的frame
    self.scrollView.frame = self.bounds;
    
    //scrollView的尺寸
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    //设置pageControl的frame
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    CGFloat pageX = scrollW - pageW;
    CGFloat pageY = scrollH - pageH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
    }
    //设置内容大小，即滚动范围
    self.scrollView.contentSize = CGSizeMake(self.imageNames.count * scrollW, 0);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSUInteger currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pageControl.currentPage = currentPage;
}

@end
