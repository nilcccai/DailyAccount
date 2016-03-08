//
//  IncomeCollectionView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "IncomeCollectionView.h"
#import "ButtonCollectionViewCell.h"
#import "AccountBookViewController.h"
#import "AccountManger.h"

@interface IncomeCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *buttonName;
@property (nonatomic, strong) NSMutableArray *picName;

@end

@implementation IncomeCollectionView

static NSString *collectionViewCellIdentifier = @"incomeCell";

- (NSMutableArray *)buttonName
{
    if (_buttonName == nil)
    {
        _buttonName = [NSMutableArray arrayWithObjects:@"工资", @"生活费", @"红包", @"零花", @"外快", @"投资", @"借入", @"奖金", @"还款", @"报销", @"现金", @"退款", @"支付宝", @"其他", nil];
    }
    return _buttonName;
}
- (NSMutableArray *)picName
{
    if (_picName == nil)
    {
        _picName = [NSMutableArray arrayWithObjects:@"gongzi", @"shenghuo", @"hongbao", @"linghuaqian", @"waikuai", @"shouru", @"jieru", @"jiangjin", @"huankuan", @"baoxiao", @"xianjin", @"tuikuan", @"zhifubao", @"shouruqita", nil];
    }
    return _picName;
}

+ (IncomeCollectionView *)incomeContentCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake((DAScreenWidth - 30) / 5, (DAScreenWidth - 30) / 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    IncomeCollectionView *incomeCollectionView = [[IncomeCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    incomeCollectionView.backgroundColor = [UIColor clearColor];
    incomeCollectionView.dataSource = incomeCollectionView;
    incomeCollectionView.delegate = incomeCollectionView;
    [incomeCollectionView registerClass:[ButtonCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    return incomeCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.buttonName.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ButtonCollectionViewCell *cell = (ButtonCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor lightGrayColor];
    cell.buttonImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.picName[indexPath.row]]];
    cell.buttonName.text = self.buttonName[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [AccountManger shareInstance].number = NO;
    self.inblock(self.buttonName[indexPath.row], self.picName[indexPath.row]);
}

@end
