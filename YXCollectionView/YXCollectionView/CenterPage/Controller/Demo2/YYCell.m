//
//  YYCell.m
//  图片轮播（无限循环）
//
//  Created by yixiang on 14/12/12.
//  Copyright (c) 2014年 yixiang. All rights reserved.
//

#import "YYCell.h"
#import "YYNews.h"

@interface YYCell()
@property (weak , nonatomic)  UILabel *label;
@property (weak , nonatomic)  UIImageView *imageView;
@end
@implementation YYCell

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        UIImageView *img = [[UIImageView alloc] init];
        [self.contentView addSubview:img];
        self.imageView = img;
        
        UILabel *lab = [[UILabel alloc] init];
        [self.contentView addSubview:lab];
        self.label = lab;
    }
    
    return self;
}


-(void)setNews:(YYNews *)news
{
    _news=news;

    [self settingData];
    [self settingFrame];
}

#pragma mark 给子控件赋值
-(void) settingData{
    self.imageView.image = [UIImage imageNamed:_news.icon];
    self.label.text = _news.title;

}

#pragma mark 设置子控件的frame
-(void) settingFrame{
    CGFloat screenWidth = self.contentView.frame.size.width;
    self.imageView.frame = CGRectMake(0, 0, screenWidth, 200);
    self.label.frame = CGRectMake(0, 0, screenWidth, 200);
    self.label.font = [UIFont systemFontOfSize:30];
    self.label.textAlignment = NSTextAlignmentCenter;
}

@end
