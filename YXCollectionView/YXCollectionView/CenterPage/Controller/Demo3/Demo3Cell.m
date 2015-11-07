//
//  Demo3Cell.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/12.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo3Cell.h"

@interface Demo3Cell()

@property (nonatomic , strong) UIImageView *imageShow;

@end

@implementation Demo3Cell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageShow = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_imageShow];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _imageShow.frame = self.contentView.bounds;
}

-(void)setImageName:(NSString *)imageName{
    _imageShow.image = [UIImage imageNamed:imageName];
}

@end
