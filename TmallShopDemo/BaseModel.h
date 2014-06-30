//
//  BaseModel.h
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *imageName;
@property(nonatomic,strong) UIImage *image;
-(id) initWithDict:(NSDictionary *) dict;

@end
