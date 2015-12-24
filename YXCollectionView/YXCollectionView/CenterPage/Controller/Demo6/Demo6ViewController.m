//
//  Demo6ViewController.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/21.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo6ViewController.h"
#import "TiltedLayout.h"
#import "Demo6Cell.h"

#define Demo6CellId @"demo6cellid"

@interface Demo6ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic , strong) UICollectionView *collectionView;

@end

@implementation Demo6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    [super initView];
    
    TiltedLayout *tiltedLayout = [[TiltedLayout alloc] init];
    tiltedLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 130);
    tiltedLayout.minimumLineSpacing = 15;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.navBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarHeight) collectionViewLayout:tiltedLayout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.contentInset = UIEdgeInsetsMake(38, 0, 38, 0);
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[Demo6Cell class] forCellWithReuseIdentifier:Demo6CellId];
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Demo6Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Demo6CellId forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%zi.JPG",indexPath.row];
    
    return cell;
}

- (NSString *)controllerTitle{
    return @"倾斜的Cell";
}

@end
