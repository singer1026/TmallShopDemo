//
//  Shop.h
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "BaseModel.h"

@interface Shop : BaseModel
@property(strong,nonatomic) NSString *classId;

+(id) shopWithDic:(NSDictionary *) dict;

@end
