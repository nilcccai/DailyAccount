//
//  PayCollectionView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "PayCollectionView.h"
#import "ButtonCollectionViewCell.h"
#import "AccountManger.h"
#import "HHHorizontalPagingView.h"

@interface PayCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *name;
@property (nonatomic, strong) NSMutableArray *picture;

@end

@implementation PayCollectionView

static NSString *collectionViewCellIdentifier = @"payCell";

- (NSMutableArray *)name
{
    if (_name == nil)
    {
        _name = [NSMutableArray arrayWithObjects:@"一般", @"餐饮", @"交通", @"酒水", @"水果", @"零食", @"买菜", @"服饰", @"日用品", @"话费", @"化妆品", @"房租", @"电影", @"淘宝", @"还钱", @"红包", @"药品", @"其他", nil];
    }
    return _name;
}
- (NSMutableArray *)picture
{
    if (_picture == nil)
    {
        _picture = [NSMutableArray arrayWithObjects:@"yiban", @"canyin", @"jiaotong", @"jiushui", @"shuiguo", @"lingshi", @"maicai", @"yifu", @"shenghuo", @"huafei", @"huazhuang", @"fangzu", @"dianying", @"taobao", @"huanqian", @"hongbao", @"yaopin", @"zhichuqita", nil];
    }
    return _picture;
}

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
    
    [payCollectionView registerClass:[ButtonCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    return payCollectionView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%ld", self.name.count);
    return self.name.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ButtonCollectionViewCell *cell = (ButtonCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor lightGrayColor];
    cell.buttonImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.picture[indexPath.row]]];
    cell.buttonName.text = self.name[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", self.picture[indexPath.row]);
    [AccountManger shareInstance].number = YES;
    self.payblock(self.name[indexPath.row], self.picture[indexPath.row]);
    
    return;
}


@end
