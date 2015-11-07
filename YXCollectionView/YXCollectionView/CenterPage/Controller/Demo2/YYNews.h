//
//  YYNews.h
//  图片轮播（无限循环）
//
//  Created by yixiang on 14/12/12.
//  Copyright (c) 2014年 yixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYNews : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

-(id)initWithDict:(NSDictionary *)dict;
+(id)newsWithDict : (NSDictionary *) dict;
@end
