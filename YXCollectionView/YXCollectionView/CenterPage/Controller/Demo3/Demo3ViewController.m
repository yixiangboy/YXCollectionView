//
//  Demo3ViewController.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/11.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo3ViewController.h"
#import "Demo3Cell.h"
#import "DDCollectionViewFlowLayout.h"
#import "Demo3HeaderView.h"

@interface Demo3ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,DDCollectionViewDelegateFlowLayout>

@property (nonatomic , strong) UICollectionView *collectionView;
@end

@implementation Demo3ViewController{
    NSMutableDictionary *dataDict;
    NSArray *sortedArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self initData];
    
    [self initView];
    
}

- (void)initData{
    if(!dataDict)
        dataDict = [NSMutableDictionary new];
    for (int i=0; i<32; i++) {
        NSMutableArray *picArray = [NSMutableArray array];
        for (int j=0; j<10; j++) {
            [picArray addObject:[NSString stringWithFormat:@"%zi.JPG",i]];
        }
        [dataDict setObject:picArray forKey:[NSString stringWithFormat:@"标题%zi",i+10]];
    }
    //[self.collectionView reloadData];
}

- (void)initView{
    [super initView];
    
    DDCollectionViewFlowLayout *layout = [[DDCollectionViewFlowLayout alloc] init];
    layout.delegate = self;
    layout.enableStickyHeaders = YES;
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.navBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarHeight) collectionViewLayout:layout];
    NSLog(@"%@",NSStringFromCGRect(collectionView.frame));
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:collectionView];
    
    _collectionView=collectionView;
    
    [self.collectionView registerClass:[Demo3Cell class] forCellWithReuseIdentifier:@"Demo3Cell"];
    [self.collectionView registerClass:[Demo3HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Demo3Header"];
}

#pragma mark - UICollectionView DataSource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [[dataDict allKeys] count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    sortedArray = [[dataDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    return [dataDict[sortedArray[section]] count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(DDCollectionViewFlowLayout *)layout numberOfColumnsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Demo3Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Demo3Cell" forIndexPath:indexPath];
    NSString *imageName = dataDict[sortedArray[indexPath.section]][indexPath.row];
    cell.imageName = imageName;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(kind == UICollectionElementKindSectionHeader){
        Demo3HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Demo3Header" forIndexPath:indexPath];
                //header.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5f];
        header.title = sortedArray[indexPath.section];
        return header;
    }
    return nil;
}

#pragma mark - UICollectionView Delegate Methods

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.bounds.size.width, 30);
}


-(NSString *)controllerTitle{
    return @"照片墙";
}

@end
