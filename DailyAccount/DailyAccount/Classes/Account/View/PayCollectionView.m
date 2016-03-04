//
//  PayCollectionView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "PayCollectionView.h"

@interface PayCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation PayCollectionView

static NSString *collectionViewCellIdentifier = @"collectionViewCell";

+ (PayCollectionView *)payContentCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake((DAScreenWidth - 30) / 5, (DAScreenWidth - 30) / 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    PayCollectionView *payCollectionView = [[PayCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    payCollectionView.backgroundColor = [UIColor clearColor];
    payCollectionView.dataSource = payCollectionView;
    payCollectionView.delegate = payCollectionView;
    
    [payCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    return payCollectionView;
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
