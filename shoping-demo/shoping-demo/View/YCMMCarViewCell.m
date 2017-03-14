//
//  YCMMCarViewCell.m
//  shoping-demo
//
//  Created by mianguan on 17/3/14.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import "YCMMCarViewCell.h"
#import "YCMMCountView.h"
#import "YCMMCarModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface YCMMCarViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsPricesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;


@end

@implementation YCMMCarViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setModel:(YCMMCarModel *)model{
    
    self.goodsNameLabel.text             = model.p_name;
    self.goodsPricesLabel.text           = [NSString stringWithFormat:@"￥%.2f",model.p_price];
    self.nummberCount.totalNum           = model.p_stock;
    self.nummberCount.currentCountNumber = model.p_quantity;
    self.selectShopGoodsButton.selected  = model.isSelect;
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:model.p_imageUrl]];
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.selectShopGoodsButton.frame = CGRectMake(15, 15, 15, 15);
    self.goodsNameLabel.frame = CGRectMake(40, 15, 200, 20);
    self.goodsImageView.frame = CGRectMake(15, 40, 100, 50);
    self.goodsPricesLabel.frame = CGRectMake(XNWindowWidth - 100, 15, 80, 20);
    
    self.nummberCount.frame = CGRectMake(XNWindowWidth - 28*3.5 - 10, 60, 28 * 3.5, 30);
}

+ (CGFloat)getCartCellHeight{
    
    return 100;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
