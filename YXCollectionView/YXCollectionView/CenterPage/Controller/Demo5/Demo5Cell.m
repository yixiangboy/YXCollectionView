//
//  Demo5Cell.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/19.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo5Cell.h"

@interface Demo5Cell()

@property (nonatomic , strong) UILabel *titleLabel;

@end

@implementation Demo5Cell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLabel];
    
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(CGRectGetWidth(self.contentView.frame)/2-100, CGRectGetHeight(self.contentView.frame)/2-10, 200, 20);
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

@end
