//
//  IncomeCollectionView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "IncomeCollectionView.h"

@interface IncomeCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation IncomeCollectionView

static NSString *collectionViewCellIdentifier = @"collectionViewCell";

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
    
    [incomeCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    return incomeCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
