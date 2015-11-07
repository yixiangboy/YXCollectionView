//
//  Demo1ViewController.m
//  YXUICollectionViewDemo
//
//  Created by yixiang on 15/10/10.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo1ViewController.h"
#import "Demo1Cell.h"

#define  Demo1CellID @"demo1_cell_id"

@interface Demo1ViewController()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic , strong) UICollectionView *collectionView;

@end

@implementation Demo1ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    [super initView];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/2-10, SCREEN_WIDTH/2-10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 20;//设置每个item之间的间距
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.navBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarHeight) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsVerticalScrollIndicator = YES;
    collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:collectionView];
    
    _collectionView=collectionView;
    
    [self.collectionView registerClass:[Demo1Cell class] forCellWithReuseIdentifier:Demo1CellID];
}

#pragma mark- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 31;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Demo1Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Demo1CellID forIndexPath:indexPath];
    if(!cell){
        cell = [[Demo1Cell alloc] init];
    }
    [cell setImageName:[NSString stringWithFormat:@"%zi",indexPath.row] content:[NSString stringWithFormat:@"{%zi,%zi}",indexPath.section,indexPath.row]];
    return cell;
}


-(NSString *)controllerTitle{
    return @"网格视图";
}

@end
