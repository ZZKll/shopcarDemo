//
//  YCMMCarViewCell.h
//  shoping-demo
//
//  Created by mianguan on 17/3/14.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YCMMCountView,YCMMCarModel ;

@interface YCMMCarViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectShopGoodsButton;
@property (weak, nonatomic) IBOutlet YCMMCountView *nummberCount;



@property (nonatomic, strong) YCMMCarModel *model;

+ (CGFloat)getCartCellHeight;

@end
