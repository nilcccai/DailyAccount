//
//  IncomeCollectionView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^incomeBlock)(NSString *name, NSString *pic);

@interface IncomeCollectionView : UICollectionView

+ (IncomeCollectionView *)incomeContentCollectionView;

@property (nonatomic, copy) incomeBlock inblock;

@end
