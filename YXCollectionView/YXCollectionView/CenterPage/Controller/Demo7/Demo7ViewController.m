//
//  Demo7ViewController.m
//  YXCollectionView
//
//  Created by yixiang on 15/11/6.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "Demo7ViewController.h"
#import "RPSlidingMenuCell.h"
#import "RPSlidingMenuLayout.h"

#define Demo7CellId @"demo6cellid"

@interface Demo7ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic , strong) UICollectionView *collectionView;

@end

@implementation Demo7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
}

- (void)initView{
    [super initView];
    
    RPSlidingMenuLayout *layout = [[RPSlidingMenuLayout alloc] initWithDelegate:nil];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,self.navBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarHeight) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[RPSlidingMenuCell class] forCellWithReuseIdentifier:Demo7CellId];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 31;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RPSlidingMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Demo7CellId forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"风景%zi",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"风景简介风景简介风景简介%zi",indexPath.row];
    cell.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zi.JPG",indexPath.row]];
    
    return cell;
}

- (NSString *)controllerTitle{
    return @"顶部cellheight逐步增大";
}

@end
