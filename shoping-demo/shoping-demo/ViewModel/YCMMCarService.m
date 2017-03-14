//
//  YCMMCarService.m
//  shoping-demo
//
//  Created by mianguan on 17/3/14.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import "YCMMCarService.h"
#import "YCMMCountView.h"
#import "YCMMCarViewModel.h"
#import "YCMMCarViewCell.h"

#import "YCMMCarModel.h"

@implementation YCMMCarService

#pragma mark - UITableView Delegate/DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.cartData.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel.cartData[section] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [YCMMCarViewCell getCartCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YCMMCarViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YCMMCarViewCell"
                                                       forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(YCMMCarViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    YCMMCarModel *model = self.viewModel.cartData[section][row];
    //cell 选中
    WEAK
    [[[cell.selectShopGoodsButton rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:cell.rac_prepareForReuseSignal] subscribeNext:^(UIButton *x) {
        STRONG
        x.selected = !x.selected;
        [self.viewModel rowSelect:x.selected IndexPath:indexPath];
    }];
    //数量改变
    cell.nummberCount.NumberChangeBlock = ^(NSInteger changeCount){
        STRONG
        [self.viewModel rowChangeQuantity:changeCount indexPath:indexPath];
    };
    cell.model = model;
}

#pragma mark - delete
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.viewModel deleteGoodsBySingleSlide:indexPath];
    }
}


@end
