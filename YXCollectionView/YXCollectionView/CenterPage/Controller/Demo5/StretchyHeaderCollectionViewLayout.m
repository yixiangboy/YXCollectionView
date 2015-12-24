//
//  StretchyHeaderCollectionViewLayout.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/19.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "StretchyHeaderCollectionViewLayout.h"

@implementation StretchyHeaderCollectionViewLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (UICollectionViewScrollDirection)scrollDirection{
    return UICollectionViewScrollDirectionVertical;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    UICollectionView *collectionView = [self collectionView];
    CGPoint offset = [collectionView contentOffset];
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    if (offset.y<0) {
        CGFloat deltaY = fabs(offset.y);
        for (UICollectionViewLayoutAttributes *attrs in attributes ) {
            NSString *kind = [attrs representedElementKind];
            if (kind == UICollectionElementKindSectionHeader) {
                CGSize headerSize = [self headerReferenceSize];
                CGRect headRect = [attrs frame];
                headRect.size.height = headerSize.height+deltaY;
                headRect.size.width = headerSize.width +deltaY;
                headRect.origin.y = headRect.origin.y - deltaY;
                headRect.origin.x = headRect.origin.x - deltaY/2;
                [attrs setFrame:headRect];
                break;
            }
        }
        
    }
    
    return attributes;
}

//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
//    UICollectionView *collectionView = [self collectionView];
//    UIEdgeInsets insets = [collectionView contentInset];
//    CGPoint offset = [collectionView contentOffset];
//    CGFloat minY = -insets.top;
//    
//    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
//    
//    if (offset.y<minY) {
//        CGFloat deltaY = fabs(offset.y - minY);
//        for (UICollectionViewLayoutAttributes *attrs in attributes ) {
//            NSString *kind = [attrs representedElementKind];
//            if (kind == UICollectionElementKindSectionHeader) {
//                CGSize headerSize = [self headerReferenceSize];
//                CGRect headRect = [attrs frame];
//                headRect.size.height = MAX(minY, headerSize.height+deltaY);
//                headRect.origin.y = headRect.origin.y - deltaY;
//                [attrs setFrame:headRect];
//                break;
//            }
//        }
//        
//    }
//    
//    return attributes;
//}

@end
