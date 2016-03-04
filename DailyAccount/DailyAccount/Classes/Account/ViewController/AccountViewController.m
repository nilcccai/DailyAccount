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

@interface AccountViewController ()

//@property (nonatomic, strong) HHHorizontalPagingView *pagingView;

@end

@implementation AccountViewController
/*
- (void)loadView
{
    self.pagingView = [[HHHorizontalPagingView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.pagingView;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    IncomeCollectionView *incomeView = [IncomeCollectionView incomeContentCollectionView];
    PayCollectionView *payView = [PayCollectionView payContentCollectionView];
    
    NSMutableArray *buttonArray = [NSMutableArray array];
//    for (int i = 0; i < 2; i++)
//    {
    /*
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [segmentButton setTitle:@"收入" forState:UIControlStateNormal];
        [segmentButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [buttonArray addObject:segmentButton];
        
        UIButton *segmentButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [segmentButton2 setTitle:@"支出" forState:UIControlStateNormal];
        [segmentButton2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [buttonArray addObject:segmentButton2];
     */
//    }
    
    HHHorizontalPagingView *pagingView = [HHHorizontalPagingView pagingViewWithHeaderView:nil headerHeight:64 segmentButtons:buttonArray segmentHeight:30 contentViews:@[incomeView, payView]];
    pagingView.segmentButtonSize = CGSizeMake(60, 25);
    [self.view addSubview:pagingView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
