//
//  Demo6Cell.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/21.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo6Cell.h"

@interface Demo6Cell()
@property (nonatomic , strong) UIImageView *imageShow;
@end

@implementation Demo6Cell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageShow = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageShow.clipsToBounds = YES;
        [self.contentView addSubview:_imageShow];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect rect = self.contentView.bounds;
    rect.origin.x = rect.origin.x - 20;
    rect.size.width = rect.size.width+40;
    _imageShow.frame = rect;
}

-(void)setImageName:(NSString *)imageName{
    _imageShow.image = [UIImage imageNamed:imageName];
}

@end
