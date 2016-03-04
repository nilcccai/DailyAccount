//
//  ContentScrollView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ContentScrollView.h"

@implementation ContentScrollView

+ (ContentScrollView *)contentScrollView
{
    ContentScrollView *scrollView = [ContentScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    return scrollView;
}

@end
