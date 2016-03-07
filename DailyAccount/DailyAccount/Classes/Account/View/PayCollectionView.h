//
//  PayCollectionView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^payBlock)(NSString *name, NSString *pic);

@interface PayCollectionView : UICollectionView

+ (PayCollectionView *)payContentCollectionView;

@property (nonatomic, copy) payBlock payblock;


@end
