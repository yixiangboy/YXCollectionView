//
//  WaterfallCell.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/15.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "WaterfallCell.h"

@interface WaterfallCell()
@property (nonatomic , strong) UIImageView *imageShow;
@end

@implementation WaterfallCell

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
