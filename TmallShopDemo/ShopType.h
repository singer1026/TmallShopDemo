//
//  ShopType.h
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "BaseModel.h"

@interface ShopType : BaseModel
@property(strong,nonatomic) NSArray *subShops;
@property(strong,nonatomic) NSString *detail;
+(id) shopTypeWithDict:(NSDictionary *) dict;
@end
