//
//  YCMMRootViewController.m
//  shoping-demo
//
//  Created by mianguan on 17/3/13.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import "YCMMRootViewController.h"
#import "UIViewController+KNSemiModal.h"
#import "YCMMFirstViewController.h"

#import "YCMMShopViewController.h"

#import <Lottie/Lottie.h>

@interface YCMMRootViewController ()

@end

@implementation YCMMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    self.title = @"商品详情";
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    UIButton *targetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    targetButton.frame = CGRectMake(0, 0, 50, 45);
    [targetButton setImage:[UIImage imageNamed:@"shoppingCart"] forState:UIControlStateNormal];
    targetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
 
    [targetButton addTarget:self action:@selector(shop) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:targetButton];

    self.navigationItem.rightBarButtonItem = barButtonItem;
    

  
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forState:UIControlStateNormal];
    [submitBtn setTitle:@"点击" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    submitBtn.frame = CGRectMake(100,150, 100, 50);
    [self.view addSubview:submitBtn];
    
    [submitBtn addTarget:self action:@selector(submitInfomationAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)submitInfomationAction {

    [self.navigationController presentSemiViewController:[YCMMFirstViewController new] withOptions:@{
                                                                                                     KNSemiModalOptionKeys.parentScale       :@(0.8),
                                                                                                     KNSemiModalOptionKeys.pushParentBack    : @(YES),
                                                                                     KNSemiModalOptionKeys.animationDuration : @(0.6),
                                                                                     KNSemiModalOptionKeys.shadowOpacity     : @(0.8),
                                                                                     KNSemiModalOptionKeys.backgroundView : [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]]
                                                                                     }];
}

- (void)shop {

    YCMMShopViewController *shopView = [YCMMShopViewController new];
    
    [self.navigationController pushViewController:shopView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
