//
//  LeftViewController.m
//  侧滑菜单
//
//  Created by yixiang on 15/7/13.
//  Copyright (c) 2015年 yixiang. All rights reserved.
//

#import "LeftViewController.h"
#import "SWRevealViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"
#import "Demo5ViewController.h"
#import "Demo6ViewController.h"
#import "Demo7ViewController.h"

@interface LeftViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *menuArray;

@end

@implementation LeftViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
    [self initView];
}

-(void)initData{
    _menuArray = [NSArray arrayWithObjects:@"网格视图",@"无限轮播",@"照片墙",@"瀑布流",@"头部拉伸效果",@"倾斜的Cell",@"顶部cellheight逐步增大",nil];
}

-(void)initView{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TABLE_VIEW_ID = @"table_view_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_ID];
    }
    cell.textLabel.text = [_menuArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SWRevealViewController *revealViewController = self.revealViewController;
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[Demo1ViewController alloc] init];
            break;
        case 1:
            viewController = [[Demo2ViewController alloc] init];
            break;
        case 2:
            viewController = [[Demo3ViewController alloc] init];
            break;
        case 3:
            viewController = [[Demo4ViewController alloc] init];
            break;
        case 4:
            viewController = [[Demo5ViewController alloc] init];
            break;
        case 5:
            viewController = [[Demo6ViewController alloc] init];
            break;
        case 6:
            viewController = [[Demo7ViewController alloc] init];
            break;
        default:
            break;
    }
    //调用pushFrontViewController进行页面切换
    [revealViewController pushFrontViewController:viewController animated:YES];
    
}

@end
