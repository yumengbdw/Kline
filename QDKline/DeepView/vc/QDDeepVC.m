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

@interface QDDeepVC ()

@property (nonatomic, strong) QDDeepView *deepView;

@end

@implementation QDDeepVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    
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
        _deepView = [[QDDeepView alloc] initWithBuyArray:@[@"1",@"0.7",@"0.65",@"0.6",@"0.55",@"0.5",@"0.4",@"0.2",@"0.1",@"0"] sellArray:@[@"0",@"0.2",@"0.3",@"0.4",@"1"]];
    }
    
    return _deepView;
}


@end
