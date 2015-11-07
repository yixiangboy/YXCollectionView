//
//  Demo1Cell.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/11.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo1Cell.h"

@interface Demo1Cell ()

@property (nonatomic , strong) UIImageView *imageShow;

@property (nonatomic , strong) UILabel *labelShow;

@end

@implementation Demo1Cell

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageShow = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:imageShow];
        _imageShow = imageShow;
        
        UILabel *labelShow = [[UILabel alloc] initWithFrame:CGRectZero];
        labelShow.font = [UIFont systemFontOfSize:15];
        labelShow.textColor = [UIColor whiteColor];
        labelShow.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:labelShow];
        _labelShow = labelShow;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _imageShow.frame = CGRectMake(10, 0, SCREEN_WIDTH/2-30, SCREEN_WIDTH/2-30);
    _labelShow.frame = CGRectMake(10, SCREEN_WIDTH/2-30, SCREEN_WIDTH/2-30, 15);
    
}

- (void)setImageName : (NSString *)imageName content : (NSString *)content{
    _imageShow.image = [UIImage imageNamed:imageName];
    _labelShow.text = content;
}

@end
