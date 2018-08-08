//
//  QDDeepView.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/7.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepView.h"
#import "QDDeepBackGroundView.h"
#import "QDDeepDrawView.h"
#import "QDCursorView.h"
#import "Masonry.h"


@interface QDDeepView()

@property (nonatomic, strong) QDDeepBackGroundView *deepBGView;
@property (nonatomic, strong) QDDeepDrawView *buyDeepView;
@property (nonatomic, strong) QDDeepDrawView *sellDeepView;
@property (nonatomic, strong) QDCursorView *cursorView;

@property (nonatomic, strong) NSArray *sellArray;
@property (nonatomic, strong) NSArray *buyArray;


@end

@implementation QDDeepView

- (instancetype)initWithBuyArray:(NSArray*)buyArray sellArray:(NSArray *)sellArray {
    self = [super init];
    if (self) {
        self.sellArray = [sellArray copy];
        self.buyArray = [buyArray copy];
        [self initView];
        [self initMasonry];
        
    }
    return self;
}

- (void)initView{
    [self addSubview:self.deepBGView];
    [self.deepBGView addSubview:self.buyDeepView];
    [self.deepBGView addSubview:self.sellDeepView];
    [self.deepBGView addSubview:self.cursorView];
}

- (void)initMasonry{
    [self.deepBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.equalTo(@(300));
    }];
    
    [self.buyDeepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.deepBGView.mas_left).offset(8);
        make.width.equalTo(self.deepBGView.mas_width).multipliedBy(0.45);
        make.top.equalTo(self.deepBGView.mas_top);
        make.bottom.equalTo(self.deepBGView.mas_bottom);

    }];
    
    [self.sellDeepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(self.buyDeepView);
        make.left.equalTo(self.buyDeepView.mas_right);
    }];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self.buyDeepView configDataDrawModels:self.buyArray maxValue:1 minValue:0];
    [self.sellDeepView configDataDrawModels:self.sellArray maxValue:1 minValue:0];
    
    [self.deepBGView setNeedsDisplay];


}


- (QDDeepBackGroundView *)deepBGView{
    if (!_deepBGView) {
        _deepBGView = [[QDDeepBackGroundView alloc] init];
    }
    
    return _deepBGView;
}

- (QDDeepDrawView *)buyDeepView{
    if (!_buyDeepView) {
        _buyDeepView = [[QDDeepDrawView alloc] init];
        _buyDeepView.backgroundColor = [UIColor clearColor];
        _buyDeepView.deepType = DeepViewTypeBuy;

    }
    return _buyDeepView;
}

- (QDDeepDrawView *)sellDeepView{
    if (!_sellDeepView) {
        _sellDeepView = [[QDDeepDrawView alloc] init];
        _sellDeepView.backgroundColor = [UIColor clearColor];
        _sellDeepView.deepType = DeepViewTypeSell;

    }
    return _sellDeepView;
}

- (QDCursorView *)cursorView{
    if (!_cursorView) {
        _cursorView = [[QDCursorView alloc] init];
    }
    return _cursorView;
}

@end
