//
//  ShopTypeCell.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "ShopTypeCell.h"

@implementation ShopTypeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        // 表格行的初始化设置
        // 1) 设置表格行的背景图片
        UIImage *image = [UIImage imageNamed:@"tmall_bg_main.png"];
        
        [self.contentView setBackgroundColor:[UIColor colorWithPatternImage:image]];
        // 2） 清空Label的背景颜色
        [self.textLabel setBackgroundColor:[UIColor clearColor]];
        [self.detailTextLabel setBackgroundColor:[UIColor clearColor]];
        
        // 3) 设置字体大小
        [self.textLabel setFont:[UIFont systemFontOfSize:16]];
        [self.detailTextLabel setFont:[UIFont systemFontOfSize:12]];
        
        // 4) 设置表格选中样式
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    return self;
}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
