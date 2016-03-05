//
//  ListViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ListViewController.h"
#import "Masonry.h"
#import "AlarmButtonController.h"
#import "CalendarButtonController.h"
@interface ListViewController ()
@property(nonatomic,strong)UIView *accountView;
@property(nonatomic,strong)UIView *mainView;
@property(nonatomic,strong)UIButton *alarmButton;
@property(nonatomic,strong)UIButton *accountButton;
@property(nonatomic,strong)UIButton *calendarButton;
@property(nonatomic,assign)NSInteger tag;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAccountView];
    self.tag = 100;
}

#pragma mark 添加显示记账的view

-(void)setAccountView
{
    //    添加主页面view
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(0,64, DAScreenWidth, DAScreenHeight)];
    [self.view addSubview:self.mainView];
    
    //    添加tableview
    
    
    
    
    //    添加账本选择的view
    self.accountView = [[UIView alloc] initWithFrame:CGRectMake(0,-200, DAScreenWidth,200)];
    [self.view addSubview:self.accountView];
    //    添加闹铃
    self.alarmButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mainView addSubview:self.alarmButton];
    __weak ListViewController *listVC= self;
    [self.alarmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(30);
        make.width.and.height.mas_equalTo(32);
    }];
    
    [self.alarmButton setBackgroundImage:[UIImage imageNamed:@"naoling"] forState:UIControlStateNormal];
    [self.alarmButton addTarget:self action:@selector(alarmButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //    添加改变账本种类的按钮
    self.accountButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mainView addSubview:self.accountButton];
    [self.accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(listVC.view);
        make.top.mas_equalTo(30);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(32);
    }];
    [self.accountButton setTitle:@"默认账本" forState:UIControlStateNormal];
    [self.accountButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.accountButton.layer.masksToBounds = YES;
    self.accountButton.layer.cornerRadius = 16;
    self.accountButton.layer.borderWidth = 2;
    self.accountButton.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [self.accountButton addTarget:self action:@selector(accountButtonAction) forControlEvents:UIControlEventTouchUpInside];
    //    添加日历按钮
    self.calendarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mainView addSubview:self.calendarButton];
    [self.calendarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(30);
        make.width.and.height.mas_equalTo(32);
    }];
    
    [self.calendarButton setBackgroundImage:[UIImage imageNamed:@"rili"] forState:UIControlStateNormal];
    [self.calendarButton addTarget:self action:@selector(calendarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark 闹铃的点击事件
-(void)alarmButtonAction
{
    AlarmButtonController *abc = [[AlarmButtonController alloc] init];
    abc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    UINavigationController *NV = [[UINavigationController alloc] initWithRootViewController:abc];
    [self.navigationController presentViewController:NV animated:YES completion:^{
        
    }];
}
#pragma mark 添加改变账本种类的按钮
-(void)accountButtonAction
{
    
    if (self.tag == 100) {
        [UIView animateWithDuration:0.5 animations:^{
            self.accountButton.frame = CGRectMake(0, 0, DAScreenWidth,200);
            self.mainView.frame = CGRectMake(0,200, DAScreenWidth, DAScreenHeight-200);
        }];
        
        self.tag++;
        
    }else if(self.tag == 101){
        [UIView animateWithDuration:0.5 animations:^{
            self.accountButton.frame = CGRectMake(0, -200, DAScreenWidth,200);
            self.mainView.frame = CGRectMake(0,64, DAScreenWidth, DAScreenHeight);
        }];
        self.tag--;
    }
}

#pragma mark 添加日历按钮
-(void)calendarButtonAction
{
    CalendarButtonController *cbc = [[CalendarButtonController alloc] init];
    [self.navigationController pushViewController:cbc animated:YES];
    
    
}

@end
