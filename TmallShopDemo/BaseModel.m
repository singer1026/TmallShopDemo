//
//  BaseModel.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        self.name = dict[@"name"];
        self.image = [UIImage imageNamed:dict[@"imageName"]];
    }
    
    return self;
}


@end
