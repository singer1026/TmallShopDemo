//
//  Shop.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+(id)shopWithDic:(NSDictionary *)dict{
    Shop *s = [[Shop alloc] initWithDict:dict];
    s.classId = dict[@"classID"];
    return  s;
}
@end
