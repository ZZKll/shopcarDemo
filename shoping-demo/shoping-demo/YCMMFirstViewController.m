//
//  YCMMFirstViewController.m
//  shoping-demo
//
//  Created by mianguan on 17/3/13.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import "YCMMFirstViewController.h"
#import "UIViewController+KNSemiModal.h"

@interface YCMMFirstViewController () {

    UIImageView *_imgView ;
}

@end

@implementation YCMMFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIView *whiteView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-300, CGRectGetWidth(self.view.frame), 300)];
 
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, CGRectGetMinY(whiteView.frame)-20, 100, 100)];
    _imgView.image = [UIImage imageNamed:@"background_01"];
    
    [self.view addSubview:_imgView];
    
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.backgroundColor = [UIColor redColor];
    [submitBtn setTitle:@"确定添加" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    submitBtn.frame = CGRectMake(100,200, 100, 50);
    [whiteView addSubview:submitBtn];
    
    [submitBtn addTarget:self action:@selector(submitInfomationAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
     [self addAnimations];
}

- (void)submitInfomationAction {

    
    
 
}

#pragma mark - 加入购物车动画
-(void)addAnimations
{
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 11.0 ];
    rotationAnimation.duration = 0.7;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 0;
    
    //这个是让旋转动画慢于缩放动画执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_imgView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    });
    
    [UIView animateWithDuration:1.0 animations:^{
        
        _imgView.frame = CGRectMake(CGRectGetWidth(self.view.frame)*0.9-30,40, 13, 13);
       
    } completion:^(BOOL finished) {
        //动画完成后做的事
        _imgView.frame = CGRectZero;
        UIViewController * parent = [self.view containingViewController];
        if ([parent respondsToSelector:@selector(dismissSemiModalView)]) {
            [parent dismissSemiModalView];
        }
    }];
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
