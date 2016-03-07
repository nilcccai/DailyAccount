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
#import "AccountManger.h"

@interface AccountViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIBarButtonItem *leftPic;
@property (nonatomic, strong) UIBarButtonItem *leftName;

@property (nonatomic, strong) UIButton *segmentButton;
@property (nonatomic, strong) UIButton *segmentButton2;

@property (nonatomic, strong) HHHeaderView *headerView;
@property (nonatomic, strong) IncomeCollectionView *incomeView;
@property (nonatomic, strong) PayCollectionView *payView;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.headerView = [HHHeaderView headerView];
    self.incomeView = [IncomeCollectionView incomeContentCollectionView];
    self.payView = [PayCollectionView payContentCollectionView];
    
    NSMutableArray *buttonArray = [NSMutableArray array];
    self.segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.segmentButton setTitle:@"收入" forState:UIControlStateNormal];
    [self.segmentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.segmentButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [buttonArray addObject:self.segmentButton];
    
    self.segmentButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.segmentButton2 setTitle:@"支出" forState:UIControlStateNormal];
    [self.segmentButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.segmentButton2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [buttonArray addObject:self.segmentButton2];
    [self.segmentButton2 addTarget:self action:@selector(viewWillAppear:) forControlEvents:UIControlEventTouchUpInside];
    
    HHHorizontalPagingView *pagingView = [HHHorizontalPagingView pagingViewWithHeaderView:self.headerView headerHeight:64 segmentButtons:buttonArray segmentHeight:64 contentViews:@[self.incomeView, self.payView]];
    pagingView.segmentButtonSize = CGSizeMake(60, 25);
   
    [self.view addSubview:pagingView];
    
    
    
    // 价格输入框
    self.prictTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 20, DAScreenWidth - 100, 44)];
    self.prictTF.borderStyle = UITextBorderStyleRoundedRect;
    self.navigationItem.title = nil;
    self.prictTF.placeholder = @"0.00";
//    self.prictTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.navigationItem setTitleView:self.prictTF];
    
    self.prictTF.delegate = self;
    
    // 保存按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonDidClicked:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationController.navigationBar.tintColor = DABlueColor;
    
    // 类别图标
    self.leftPic = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStylePlain target:nil action:nil];
    self.leftPic.image = [[UIImage imageNamed:@"gongzi"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.leftName = [[UIBarButtonItem alloc] initWithTitle:@"工资" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItems = @[self.leftPic, self.leftName];
    self.leftPic.enabled = NO;
    self.leftName.enabled = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.payView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    __weak typeof(self) weakSelf = self;
   
    self.incomeView.inblock = ^(NSString *name, NSString *picture)
    {
        weakSelf.leftPic.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@", picture]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        weakSelf.leftName.title = [NSString stringWithFormat:@"%@", name];
    };
    self.payView.payblock = ^(NSString *name, NSString *picture)
    {
        weakSelf.leftPic.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@", picture]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        weakSelf.leftName.title = [NSString stringWithFormat:@"%@", name];
    };

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
