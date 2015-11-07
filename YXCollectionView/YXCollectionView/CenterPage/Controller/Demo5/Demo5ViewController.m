//
//  Demo5ViewController.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/19.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo5ViewController.h"
#import "StretchyHeaderCollectionViewLayout.h"
#import "Demo5Cell.h"
#import "Demo5HeaderView.h"

NSString * const kCellId = @"Cell";
NSString * const kHeaderId = @"Header";

@interface Demo5ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic , strong) UICollectionView *collectionView;

@end

@implementation Demo5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    [super initView];
    
    StretchyHeaderCollectionViewLayout *stretchyLayout = [[StretchyHeaderCollectionViewLayout alloc] init];
    //stretchyLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    stretchyLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 40);
    stretchyLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 240);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.navBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarHeight) collectionViewLayout:stretchyLayout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[Demo5Cell class] forCellWithReuseIdentifier:kCellId];
    [_collectionView registerClass:[Demo5HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderId];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        Demo5HeaderView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderId forIndexPath:indexPath];
        headView.iconName = [NSString stringWithFormat:@"%zi.JPG",2];
        return headView;
    }
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Demo5Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    cell.title = [NSString stringWithFormat:@"我是景铭%zi",indexPath.row];
    
    return cell;
}

- (NSString *)controllerTitle{
    return @"头部拉伸效果";
}

@end
