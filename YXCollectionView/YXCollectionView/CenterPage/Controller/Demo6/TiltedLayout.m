//
//  TiltedLayout.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/21.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "TiltedLayout.h"

@implementation TiltedLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attr in attributes ) {
        CGFloat degrees = M_PI * (-14.0f/180.0f);
        attr.transform = CGAffineTransformMakeRotation(degrees);
    }
    return attributes;
}

@end
