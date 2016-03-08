//
//  CalendarButtonController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "CalendarButtonController.h"
#import "SZCalendarPicker.h"
#import "AccountViewController.h"
#import "SZCalendarCell.h"


@interface CalendarButtonController ()
@property(nonatomic,strong)SZCalendarPicker *calendarPicker;

@end

@implementation CalendarButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"日历";
//    日历按钮
    self.view.backgroundColor = [UIColor whiteColor];
    self.calendarPicker = [SZCalendarPicker showOnView:self.view];
    self.calendarPicker.today = [NSDate date];
    self.calendarPicker.date = self.calendarPicker.today;
    self.calendarPicker.frame = CGRectMake(0,64, self.view.frame.size.width, 352);
    self.calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
        
        NSLog(@"%li-%li-%li", (long)year,(long)month,(long)day);
    
    };
    [self.calendarPicker.button addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)clickbtn
{
    AccountViewController *avc = [[AccountViewController alloc] init];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:avc];
    [self.navigationController presentViewController:nv animated:YES completion:nil];
}
@end
