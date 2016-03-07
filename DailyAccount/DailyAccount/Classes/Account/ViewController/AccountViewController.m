//
//  AccountViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AccountViewController.h"
#import "IncomeCollectionView.h"
#import "PayCollectionView.h"
#import "HHHorizontalPagingView.h"
#import "HHHeaderView.h"

@interface AccountViewController ()<UITextFieldDelegate>

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    HHHeaderView *headerView = [HHHeaderView headerView];
    IncomeCollectionView *incomeView = [IncomeCollectionView incomeContentCollectionView];
    PayCollectionView *payView = [PayCollectionView payContentCollectionView];
    
    NSMutableArray *buttonArray = [NSMutableArray array];
    UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [segmentButton setTitle:@"收入" forState:UIControlStateNormal];
    [segmentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [segmentButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [buttonArray addObject:segmentButton];
    
    UIButton *segmentButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [segmentButton2 setTitle:@"支出" forState:UIControlStateNormal];
    [segmentButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [segmentButton2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [buttonArray addObject:segmentButton2];
    
    HHHorizontalPagingView *pagingView = [HHHorizontalPagingView pagingViewWithHeaderView:headerView headerHeight:64 segmentButtons:buttonArray segmentHeight:64 contentViews:@[incomeView, payView]];
    pagingView.segmentButtonSize = CGSizeMake(60, 25);
    [self.view addSubview:pagingView];
    
    // 价格输入框
    self.prictTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 20, DAScreenWidth - 100, 44)];
    self.prictTF.borderStyle = UITextBorderStyleRoundedRect;
    self.navigationItem.title = nil;
    self.prictTF.placeholder = @"0.00";
    [self.navigationItem setTitleView:self.prictTF];
    
    self.prictTF.delegate = self;
    
    // 保存按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonDidClicked:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    
}
#pragma mark 保存按钮
- (void)rightButtonDidClicked:(UIBarButtonItem *)sender
{
    NSLog(@"保存按钮");
}

#pragma mark 键盘回收
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
