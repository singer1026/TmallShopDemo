//
//  ShopCell.h
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//
#define kTagStart 100
#define kShopCellHeight 70
#define kColumn 4
#import <UIKit/UIKit.h>

@interface ShopCell : UITableViewCell
- (void)setRowShops:(NSArray *)rowShops;
@end
