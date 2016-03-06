//
//  HHHeaderView.m
//  HHHorizontalPagingView
//
//  Created by Huanhoo on 15/7/16.
//  Copyright (c) 2015年 Huanhoo. All rights reserved.
//

#import "HHHeaderView.h"

@implementation HHHeaderView

+ (HHHeaderView *)headerView {
    HHHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"HHHeaderView" owner:self options:nil][0];
    return headerView;
}
/*
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.priceTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, DAScreenWidth, 64)];
    self.priceTF.placeholder = @"0.00";
    self.priceTF.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.priceTF];
    self.alpha = 0.2;
}
*/

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com