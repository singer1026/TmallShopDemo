//
//  ViewController.m
//  TmallShopDemo
//
//  Created by Singer on 14-6-29.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "ViewController.h"
#import "FolderView.h"
#import "ShopType.h"
#import "ShopTypeCell.h"
@interface ViewController ()

@property(nonatomic,strong) NSArray *dataList;
@end
 //static NSString *ID = @"UITableViewCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        ShopType *st = [ShopType shopTypeWithDict:dict];
        [arrayM addObject: st];
    }
    _dataList = arrayM;
    
   // [self.tableView registerClass:[ShopTypeCell class] forCellReuseIdentifier:ID];
}

-(void)loadView{
    
    self.tableView = [[FolderView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];

}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

#pragma mark 每当有一个cell进入屏幕视野范围内就会被调用 返回当前这行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //用static 只会初始化一次
    static NSString *ID = @"UITableViewCell";
    //拿到一个标示符先去缓存池中查找对应的cell
    ShopTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //如果缓存池中没有，才需要传入一个标识创建新的cell
    if (cell == nil) {
        cell = [[ShopTypeCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:ID];
    }
    
    //覆盖数据
    ShopType *st = self.dataList[indexPath.row];
    [cell.textLabel setText:st.name];
    [cell.imageView setImage:st.image];
    [cell.detailTextLabel setText:st.detail];
    return cell;
}

#pragma mark 当点击某行cell 弹出或者隐藏抽屉
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
    // 1. 强转FolderView以便调用打开抽屉方法
    FolderView *folder = (FolderView *)tableView;
    
    ShopType *shopType = self.dataList[indexPath.row];
    
    [folder openFolderAtIndexPath:indexPath shopList:shopType.subShops];
    
    
}

@end
