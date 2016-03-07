//
//  AccountView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AccountView.h"

@implementation AccountView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"支出", @"收入"]];
    self.segment.frame = CGRectMake(0, 64, DAScreenWidth, 64);
    [self addSubview:self.segment];
}

@end
