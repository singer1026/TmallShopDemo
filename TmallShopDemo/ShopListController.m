//
//  ShopListController.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "ShopListController.h"
#import "ShopCell.h"
@interface ShopListController ()

@end

@implementation ShopListController

#pragma mark - 实例化视图
// 因为本视图是嵌入在另外一个视图控制器的，因此不是全屏幕显示，
// 在实例化视图的时候，需要指定一下视图的大小
- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
#warning 高度后续还要根据数据的数量调整
    CGFloat width = ((_shopList.count + kColumn - 1) / kColumn) *kShopCellHeight;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width,width) style:UITableViewStylePlain];
    
    // 注意：视图是懒加载的，在用到时才会被实例化！
    [self.tableView setRowHeight:kShopCellHeight];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return (_shopList.count + kColumn - 1) / kColumn;
 
}

#pragma mark 每当有一个cell进入屏幕视野范围内就会被调用 返回当前这行显示的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //用static 只会初始化一次
    static NSString *ID = @"UITableViewCell";
    //拿到一个标示符先去缓存池中查找对应的cell
    ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //如果缓存池中没有，才需要传入一个标识创建新的cell
    if (cell == nil) {
        cell = [[ShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    
    //覆盖数据
    
    int location = indexPath.row * kColumn;
    // 截取的长度
    int length = kColumn;
    if (location+length >= _shopList.count) {
        length = _shopList.count-location;
    }
    NSRange range = NSMakeRange(location, length);
    NSArray *rowShops = [_shopList subarrayWithRange:range];
    [cell setRowShops:rowShops];
    
    return cell;
}




@end
