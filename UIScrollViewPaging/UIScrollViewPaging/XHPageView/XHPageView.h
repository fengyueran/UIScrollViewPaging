//
//  XHPageView.h
//  UIScrollViewPaging
//
//  Created by snow on 17/2/5.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHPageView : UIView

+ (instancetype)pageView;
/** 图片名字 */
@property (nonatomic, strong) NSArray *imageNames;
/** 其他圆点颜色 */
@property (nonatomic, strong) UIColor *otherColor;
/** 当前圆点颜色 */
@property (nonatomic, strong) UIColor *currentColor;

@property (nonatomic, strong) UIColor *myColor NS_DEPRECATED_IOS(7_0,8_0, "建议使用myColor");//表示ios7-8可用
@end
