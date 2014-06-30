//
//  FolderView.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//
#define kShopTypeCellHeight 80
#define kSubViewHeight 210
#import "FolderView.h"
#import "ShopTypeCell.h"
#import "ShopListController.h"
@interface FolderView ()

// 动画表格行数组
@property(strong, nonatomic) NSMutableArray *animationRows;
@property(strong,nonatomic) ShopListController *shopListController;
@end

@implementation FolderView
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        // 1.设置背景图片
        UIImage *image = [UIImage imageNamed:@"tmall_bg_furley.png"];
        //使用图片平铺背景
        [self setBackgroundColor:[UIColor colorWithPatternImage:image]];
        
        // 2.设置表格行高
        [self setRowHeight:kShopTypeCellHeight];
        
        //3.隐藏垂直滚动条
        [self setShowsVerticalScrollIndicator:NO];
        
        // 4. 实例化子类视图控制器
        self.shopListController = [[ShopListController alloc]init];
    }
    return self;
}

- (void)openFolderAtIndexPath:(NSIndexPath *)indexPath
                     shopList:(NSArray *)shopList {
    // 关闭抽屉，释放掉animationRows
    /*
     1> 如果数组不存在，说明抽屉没有打开，做打开抽屉的操作
     2> 如果数组已经存在，说明抽屉已经打开，做关闭抽屉的操作
     */
    if (self.animationRows != nil) {
        [self closeFolder];
        
        return;
    }
    
    // 展开抽屉前，需要填充商店列表中的数据
    [self.shopListController setShopList:shopList];
    // 让店铺控制器的表格刷新数据
    [self.shopListController.tableView reloadData];
    
    //把原来的cell的indexPath用数组保存起来
    NSMutableArray *array =
    [NSMutableArray arrayWithArray:[self indexPathsForVisibleRows]];
    _animationRows = array;
    //    CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
    //
    //
    //    CGRect rect = [tableView convertRect:rectInTableView toView:self.view];
    
    ShopTypeCell *cell = (ShopTypeCell *)[self cellForRowAtIndexPath:indexPath];
    
    CGFloat cellY = cell.frame.origin.y;
    CGFloat cellHeight = cell.frame.size.height;
    //插入视图的Y坐标
    CGFloat subViewY = cellY + cellHeight;
    
    //屏幕的高度
    CGFloat tableHeight = self.frame.size.height;
    CGFloat offsetY = self.contentOffset.y;
    [self setScrollEnabled:NO];
    if (tableHeight - subViewY + offsetY >= kSubViewHeight) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             //下方空间足够大
                             for (NSIndexPath *path in array) {
                                 // 1) 取出要挪动的表格行
                                 ShopTypeCell *cell = (ShopTypeCell *)[self cellForRowAtIndexPath:path];
                                 cell.originY = cell.frame.origin.y;
                                 
                                 if (path.row > indexPath.row) {
                                     // 2) 挪动表格行，挪动位置：frame,center
                                     // 1> 当前的frame
                                     CGRect frame = cell.frame;
                                     frame.origin.y += kSubViewHeight;
                                     [cell setFrame:frame];
                                 }

                             }
                         }
                         completion:^(BOOL finished) {}];
    } else {
        NSLog(@"空间不够 向上滚到空间够为止");
        CGFloat up = tableHeight + offsetY - kSubViewHeight - subViewY;
        subViewY = tableHeight + offsetY - kSubViewHeight;
        CGFloat down = kSubViewHeight + up;
        [UIView animateWithDuration:0.3
                         animations:^{
                             for (NSIndexPath *path in array) {
                                 ShopTypeCell *cell = (ShopTypeCell *)[self cellForRowAtIndexPath:path];
                                 // 记录初始Y位置
                                 cell.originY = cell.frame.origin.y;
                                 
                                 CGRect newFrame = cell.frame;
                                 
                                 // 等于或小于选中行的向上挪
                                 if (path.row <= indexPath.row) {
                                     newFrame.origin.y += up;
                                 } else {
                                     // 大于的向下挪
                                     newFrame.origin.y += down;
                                 }
                                 [cell setFrame:newFrame];
                             }
                         }
                         completion:^(BOOL finished) {}];
    }
    // 设置一下子视图
    
    CGRect subViewFrame = self.shopListController.view.frame;
    subViewFrame.origin.y = subViewY;
    [self.shopListController.view setFrame:subViewFrame];
    
    [self insertSubview:self.shopListController.view atIndex:0];
}

#pragma mark 关闭抽屉
- (void)closeFolder {
    // 关闭抽屉 —— 就是把所有动画行复位
    // 要复位，需要知道所有动画行的初始位置
    // 因此，我们在挪动表格行之前，需要记录住对应的初始位置的Y值
    // 注意：tag是整数，而y值是浮点数，因此不能用tag记录
    // 1> 遍历数组，还原所有动画行的Y位置
    [UIView animateWithDuration:0.3 animations:^{
        for (NSIndexPath *path in self.animationRows) {
            ShopTypeCell *cell = (ShopTypeCell *)[self cellForRowAtIndexPath:path];
            
            CGRect closeFrame = cell.frame;
            closeFrame.origin.y = cell.originY;
            [cell setFrame:closeFrame];
        }
    } completion:^(BOOL finished) {
        // 2> 删除animationRows
        self.animationRows = nil;
        // 3> 从主视图中移除子视图
        [self.shopListController.view removeFromSuperview];
        
        [self setScrollEnabled:YES];
        
    }];
}

@end
