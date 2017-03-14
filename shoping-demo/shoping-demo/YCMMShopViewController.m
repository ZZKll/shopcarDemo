//
//  YCMMShopViewController.m
//  shoping-demo
//
//  Created by mianguan on 17/3/13.
//  Copyright © 2017年 冕冠. All rights reserved.
//

#import "YCMMShopViewController.h"

#import "YCMMCarViewModel.h"
#import "YCMMCarService.h"
#import "YCMMCarBarView.h"

@interface YCMMShopViewController ()

{
    BOOL _isIdit;
    UIBarButtonItem *_editItem;
    UIBarButtonItem *_makeDataItem;
}
@property (nonatomic, strong) YCMMCarService *service;

@property (nonatomic, strong) YCMMCarViewModel *viewModel;

@property (nonatomic, strong) UITableView     *cartTableView;

@property (nonatomic, strong) YCMMCarBarView       *cartBar;

@end

@implementation YCMMShopViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self getNewData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"购物车";
    
    /*eidit button*/
    _isIdit = NO;
    _editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                 style:UIBarButtonItemStyleDone
                                                target:self
                                                action:@selector(editClick:)];
    _editItem.tintColor = XNColor(170, 170, 170, 1);
    self.navigationItem.rightBarButtonItem = _editItem;
    /*add view*/
    [self.view addSubview:self.cartTableView];
    [self.view addSubview:self.cartBar];
    
    /* RAC  */
    //全选
    [[self.cartBar.selectAllButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        x.selected = !x.selected;
        [self.viewModel selectAll:x.selected];
    }];
    //删除
    [[self.cartBar.deleteButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        [self.viewModel deleteGoodsBySelect];
    }];
    //结算
    [[self.cartBar.balanceButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        
    }];
    /* 观察价格属性 */
    WEAK
    [RACObserve(self.viewModel, allPrices) subscribeNext:^(NSNumber *x) {
        STRONG
        self.cartBar.money = x.floatValue;
    }];
    
    /* 全选 状态 */
    RAC(self.cartBar.selectAllButton,selected) = RACObserve(self.viewModel, isSelectAll);
    
    /* 购物车数量 */
    [RACObserve(self.viewModel, cartGoodsCount) subscribeNext:^(NSNumber *x) {
        STRONG
        if(x.integerValue == 0){
            self.title = [NSString stringWithFormat:@"购物车"];
        } else {
            self.title = [NSString stringWithFormat:@"购物车(%@)",x];
        }
        
    }];
}

#pragma mark - lazy load

- (YCMMCarViewModel *)viewModel{
    
    if (!_viewModel) {
        _viewModel = [[YCMMCarViewModel alloc] init];
        _viewModel.cartVC = self;
        _viewModel.cartTableView  = self.cartTableView;
    }
    return _viewModel;
}


- (YCMMCarService *)service{
    
    if (!_service) {
        _service = [[YCMMCarService alloc] init];
        _service.viewModel = self.viewModel;
    }
    return _service;
}


- (UITableView *)cartTableView{
    
    if (!_cartTableView) {
        
        _cartTableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                      style:UITableViewStylePlain];
        [_cartTableView registerNib:[UINib nibWithNibName:@"YCMMCarViewCell" bundle:nil]
             forCellReuseIdentifier:@"YCMMCarViewCell"];
        _cartTableView.dataSource = self.service;
        _cartTableView.delegate   = self.service;
        _cartTableView.backgroundColor = XNColor(240, 240, 240, 1);
        _cartTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XNWindowWidth, 50)];
    }
    return _cartTableView;
}

- (YCMMCarBarView *)cartBar{
    
    if (!_cartBar) {
        _cartBar = [[YCMMCarBarView alloc] initWithFrame:CGRectMake(0, XNWindowHeight-50, XNWindowWidth, 50)];
        _cartBar.isNormalState = YES;
    }
    return _cartBar;
}

#pragma mark - method

- (void)getNewData{
    /**
     *  获取数据
     */
    [self.viewModel getData];
    [self.cartTableView reloadData];
}

- (void)editClick:(UIBarButtonItem *)item{
    _isIdit = !_isIdit;
    NSString *itemTitle = _isIdit == YES?@"完成":@"编辑";
    _editItem.title = itemTitle;
    self.cartBar.isNormalState = !_isIdit;
}

- (void)makeNewData:(UIBarButtonItem *)item{
    
    [self getNewData];
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
