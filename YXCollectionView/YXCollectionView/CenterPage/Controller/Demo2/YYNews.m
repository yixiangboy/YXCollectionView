//
//  YYNews.m
//  图片轮播（无限循环）
//
//  Created by yixiang on 14/12/12.
//  Copyright (c) 2014年 yixiang. All rights reserved.
//

#import "YYNews.h"

@implementation YYNews

-(id)initWithDict:(NSDictionary *)dict{
    
    if (self=[super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+(id)newsWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
