//
//  QDDeepVC.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/7.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepVC.h"
#import "QDDeepView.h"
#import "Masonry.h"
#import "QDDeepViewModel.h"

@interface QDDeepVC ()

@property (nonatomic, strong) QDDeepView *deepView;

@property (nonatomic, strong) QDDeepViewModel *deepViewModel;

@property (nonatomic, strong) QDCriticalModel *criticalModel;



@end

@implementation QDDeepVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    
    self.deepViewModel = [[QDDeepViewModel alloc] init];
    self.criticalModel = [[QDCriticalModel alloc] init];
    NSArray *buyArray = @[@{@"price":@"0.3",@"volume":@"1"},@{@"price":@"0.4",@"volume":@"0.7"},@{@"price":@"0.45",@"volume":@"0.65"},@{@"price":@"0.49",@"volume":@"0.6"},@{@"price":@"0.54",@"volume":@"0.55"},@{@"price":@"0.55",@"volume":@"0.35"},@{@"price":@"0.57",@"volume":@"0.15"}];
    
    NSArray *sellArray = @[@{@"price":@"0.3",@"volume":@"0.15"},@{@"price":@"0.4",@"volume":@"0.35"},@{@"price":@"0.45",@"volume":@"0.55"},@{@"price":@"0.49",@"volume":@"0.6"},@{@"price":@"0.54",@"volume":@"0.65"},@{@"price":@"0.55",@"volume":@"0.7"},@{@"price":@"0.57",@"volume":@"0.9"}];
    
    self.deepViewModel.buyDeepArray = buyArray;
    self.deepViewModel.sellDeepArray = sellArray;
    
    self.criticalModel.maxValueX = @"0.57";
    self.criticalModel.maxValueY = @"1";
    self.criticalModel.minValueX = @"0.3";
    self.criticalModel.minValueY = @"0.15";

    self.deepViewModel.sellCriticalModel = self.criticalModel;
    self.deepViewModel.buyCriticalModel = self.criticalModel;
    self.deepView.deepViewModel = self.deepViewModel;
    
}

- (void)initView{
    [self.view addSubview:self.deepView];
    [self.deepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(510));
        make.top.equalTo(self.view.mas_top).offset(20);
    }];
    
}


- (QDDeepView *)deepView{
    if (!_deepView) {
        _deepView = [[QDDeepView alloc] init];
    }
    
    return _deepView;
}


@end
