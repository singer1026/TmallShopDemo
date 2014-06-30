//
//  ShopCell.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "ShopCell.h"
#import "Shop.h"
@implementation ShopCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat width = self.contentView.bounds.size.width / kColumn;
        for (int i = 0;  i< kColumn; i++) {
            CGRect frame = CGRectMake(i*width, 0, width, kShopCellHeight);
            UIButton *btn = [[UIButton alloc]initWithFrame:frame];
            btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//            CGFloat btnY = 0;
//            CGFloat btnWidth = self.frame.size.width / kColumn;
//            CGFloat btnHeight = kShopCellHeight;
//            CGFloat btnX = i * btnWidth;
//            btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
            // 设置格子的tag
            btn.tag = i + kTagStart;
            // 添加格子到cell的contentView中
            [self.contentView addSubview:btn];
            
        }
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tmall_bg_furley.png"]]];
        
    }
    return self;
}

- (void)setRowShops:(NSArray *)rowShops
{
    for (int i = 0; i<kColumn; i++) {
        
        int tag = kTagStart + i;
        UIButton *btn = (UIButton *)[self viewWithTag:tag];
        
        if (i>rowShops.count - 1) {
            btn.hidden = YES;
        }else{
            Shop *shop = rowShops[i];
            [btn setTitle:shop.name forState:UIControlStateNormal];
            
            // 设置内部UIImageView的图片
            [btn setImage:shop.image forState:UIControlStateNormal];
            btn.hidden = NO;
        }
        
    }
}

@end
