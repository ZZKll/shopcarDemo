//
//  YCMMCarModel.h
//  shoping-demo
//
//  Created by mianguan on 17/3/14.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCMMCarModel : NSObject

@property (nonatomic, strong) NSString  *p_id;

@property (nonatomic, assign) float     p_price;

@property (nonatomic, strong) NSString  *p_name;

@property (nonatomic, strong) NSString  *p_imageUrl;

@property (nonatomic, assign) NSInteger p_stock;

@property (nonatomic, assign) NSInteger p_quantity;

//商品是否被选中
@property (nonatomic, assign) BOOL      isSelect;

@end
