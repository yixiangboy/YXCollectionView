//
//  BaseViewController.h
//  侧滑菜单
//
//  Created by yixiang on 15/7/18.
//  Copyright (c) 2015年 yixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseViewController : UIViewController

/**
 *  当前Controller的标题
 *
 *  @return 标题
 */
-(NSString *)controllerTitle;

/**
 *  初始化View
 */
-(void)initView;

@property (nonatomic , assign) CGFloat navBarHeight;

@end
