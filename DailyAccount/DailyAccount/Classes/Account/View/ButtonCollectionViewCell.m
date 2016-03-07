//
//  ButtonCollectionViewCell.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ButtonCollectionViewCell.h"

@implementation ButtonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.buttonName = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.bounds.size.height - 24, self.contentView.bounds.size.width, 21)];
    self.buttonName.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.buttonName];
    
    self.buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(27 / 2, 3, self.contentView.bounds.size.height - 27, self.contentView.bounds.size.height - 27)];
    [self.contentView addSubview:self.buttonImage];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
