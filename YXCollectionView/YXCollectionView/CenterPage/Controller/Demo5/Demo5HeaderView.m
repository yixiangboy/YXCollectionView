//
//  Demo5HeaderView.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/19.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo5HeaderView.h"

@interface Demo5HeaderView()

@property (nonatomic , strong) UIImageView *iconView;

@end

@implementation Demo5HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_iconView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _iconView.frame = self.bounds;
}

- (void)setIconName:(NSString *)iconName{
    _iconView.image = [UIImage imageNamed:iconName];
}

@end
