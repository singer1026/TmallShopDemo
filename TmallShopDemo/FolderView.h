//
//  FolderView.h
//  TmallShopDemo
//
//  Created by Singer on 14-6-30.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FolderView : UITableView
-(void)openFolderAtIndexPath:(NSIndexPath *)indexPath shopList:(NSArray *)shopList;
- (void)closeFolder;
@end
