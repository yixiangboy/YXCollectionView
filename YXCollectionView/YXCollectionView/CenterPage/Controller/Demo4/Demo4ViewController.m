//
//  Demo4ViewController.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/15.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo4ViewController.h"
#import "DDCollectionViewFlowLayout.h"
#import "WaterfallCell.h"

@interface Demo4ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,DDCollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *collectionView;

@end

@implementation Demo4ViewController{
    NSMutableArray *dataList;
    NSMutableArray *sectionOne;
    //存储所有的高度的数组
    NSMutableArray  *heightArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData{
    if(!dataList)
        dataList = [[NSMutableArray alloc] initWithCapacity:0];
    [dataList removeAllObjects];
    
    if (!heightArr) {
        heightArr = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [heightArr removeAllObjects];
    
    for (int i=0; i<32; i++) {
        [dataList addObject:[NSString stringWithFormat:@"%zi.JPG",i]];
        CGFloat height = 100 + (arc4random()%100);
        [heightArr addObject:[NSString stringWithFormat:@"%f",height]];
    }
}

- (void)initView{
    [super initView];
    
    DDCollectionViewFlowLayout *layout = [[DDCollectionViewFlowLayout alloc] init];
    layout.delegate = self;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.navBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarHeight) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:collectionView];
    
    _collectionView=collectionView;
    
    [self.collectionView registerClass:[WaterfallCell class] forCellWithReuseIdentifier:@"WaterfallCell"];

    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(DDCollectionViewFlowLayout *)layout numberOfColumnsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WaterfallCell *cell = (WaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WaterfallCell" forIndexPath:indexPath];
    cell.imageName = dataList[indexPath.row];
    return cell;
}

#pragma mark - UICollectionView Delegate Methods

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //return CGSizeMake(100, 100 + indexPath.item *10);
    CGFloat height = [[heightArr objectAtIndex:indexPath.row] floatValue];
    return CGSizeMake(100, height);
}


- (NSString*)controllerTitle{
    return @"瀑布流";
}


@end
