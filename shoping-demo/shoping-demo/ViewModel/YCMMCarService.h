//
//  YCMMCarService.h
//  shoping-demo
//
//  Created by mianguan on 17/3/14.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import <Foundation/Foundation.h>


@class YCMMCarViewModel ;

@interface YCMMCarService : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) YCMMCarViewModel *viewModel;

@end
