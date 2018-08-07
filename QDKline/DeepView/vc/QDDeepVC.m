//
//  QDDeepVC.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/7.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepVC.h"
#import "QDDeepBackGroundView.h"

@interface QDDeepVC ()

@property (nonatomic, strong) QDDeepBackGroundView *deepBGView;

@end

@implementation QDDeepVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}


- (QDDeepBackGroundView *)deepBGView{
    if (!_deepBGView) {
        _deepBGView = [[QDDeepBackGroundView alloc] init];
    }
    
    return _deepBGView;
}

@end
