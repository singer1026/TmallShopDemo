//
//  ShopType.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "ShopType.h"
#import "Shop.h"
@implementation ShopType
+(id)shopTypeWithDict:(NSDictionary *)dict{
    ShopType *st = [[ShopType alloc] initWithDict:dict];
    NSArray *array = dict[@"subClass"];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    NSMutableString *strM = [NSMutableString string];
    
    int i = 0;
    for (NSDictionary *dic in array) {
        Shop *s = [Shop shopWithDic:dic];
        [arrayM addObject:s];
        
        if (i < 3) {
            [strM appendFormat:@"%@/",s.name];
        }else if(i == 3){
            [strM appendFormat:@"%@",s.name];
        }
        i++;
    }
    st.detail = strM;
    st.subShops = arrayM ;
    return st;
}
@end
