//
//  YCMMCarBarView.h
//  shoping-demo
//
//  Created by mianguan on 17/3/14.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCMMCarBarView : UIView

//结算
@property (nonatomic, strong) UIButton *balanceButton;
//全选
@property (nonatomic, strong) UIButton *selectAllButton;
//价格
@property (nonatomic, retain) UILabel *allMoneyLabel;
//删除
@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, assign) BOOL     isNormalState;

@property (nonatomic, assign) float    money;

@end
