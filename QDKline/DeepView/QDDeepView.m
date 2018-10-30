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
#import "QDDeepCursorView.h"
#import "Masonry.h"
#import "QDKLineDefine.h"


@interface QDDeepView()

@property (nonatomic, strong) QDDeepBackGroundView *deepBGView;
@property (nonatomic, strong) QDDeepDrawView *buyDeepView;
@property (nonatomic, strong) QDDeepDrawView *sellDeepView;
@property (nonatomic, strong) QDDeepCursorView *cursorView;
@property (nonatomic, strong) NSArray *sellPointArray;
@property (nonatomic, strong) NSArray *buyPointArray;

@property (nonatomic, strong) NSArray *sellArray;
@property (nonatomic, strong) NSArray *buyArray;

@property (nonatomic, assign) CGFloat deepViewWidth;

@end

@implementation QDDeepView
- (instancetype)init{
    self = [super init];
    if (self) {
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
    self.deepViewWidth = (screenSize.width - yCoordMargin - customMagin)/2.0;
//   CGSize screenSize = [UIScreen mainScreen].bounds.size;
    [self.deepBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.buyDeepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.deepBGView.mas_left).offset(customMagin);
        make.width.mas_equalTo(self.deepViewWidth );//(screenWidth - 25 -8)/2
        make.top.equalTo(self.deepBGView.mas_top).offset(deepViewTopMargin);//为了好看空出50个像素
        make.bottom.equalTo(self.deepBGView.mas_bottom).offset(-xCoordMargin);

    }];
    
    [self.sellDeepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(self.buyDeepView);
        make.left.equalTo(self.buyDeepView.mas_right);
    }];
    
    [self.cursorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.deepViewModel || !self.deepViewModel.buyDeepArray.count) {
        return ;
    }
    self.buyPointArray = [self.buyDeepView configDataDrawModels:_deepViewModel.buyDeepArray valueDict:_deepViewModel.buyCriticalModel];
    self.sellPointArray = [self.sellDeepView configDataDrawModels:_deepViewModel.sellDeepArray valueDict:_deepViewModel.sellCriticalModel];

    self.deepBGView.buyModel = self.deepViewModel.buyCriticalModel;
    self.deepBGView.sellModel = self.deepViewModel.sellCriticalModel;
    [self.deepBGView setNeedsDisplay];

}

- (void)showTouchView:(NSSet<UITouch *> *)touches {
    CGPoint location = [touches.anyObject locationInView:self.deepBGView];
    if (location.x < 0 || location.x > CGRectGetMaxX(self.deepBGView.frame)) return;
    if (!self.sellPointArray.count || !self.buyPointArray.count) return;
    
    CGFloat xInDeepView = location.x - customMagin;
    NSInteger selectIndex;
    CGPoint targetPoint;
    NSDictionary *targetModel;
    if (location.x > self.deepViewWidth + customMagin) {//touch 点在卖方向
        xInDeepView -= self.deepViewWidth;
        selectIndex = [self findPointInArray:self.sellPointArray withPositionX:xInDeepView];
        CGPoint resultPoint = [self.sellPointArray[selectIndex] CGPointValue];
        targetPoint = CGPointMake(resultPoint.x + self.deepViewWidth, resultPoint.y);
        targetModel = self.deepViewModel.sellDeepArray[selectIndex];
    } else {
        selectIndex = [self findPointInArray:self.buyPointArray withPositionX:xInDeepView];
        targetPoint = [self.buyPointArray[selectIndex] CGPointValue];
        targetModel = self.deepViewModel.buyDeepArray[selectIndex];
    }
    
    self.cursorView.selectedPoint = targetPoint;
    self.cursorView.selectModel = targetModel;
    self.cursorView.hidden = NO;
    [self.cursorView setNeedsDisplay];
}

- (void)hideTouchView {
    //恢复scrollView的滑动
    [self.cursorView setNeedsDisplay];
    self.cursorView.hidden = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showTouchView:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showTouchView:touches];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hideTouchView];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hideTouchView];
}

- (NSInteger)findPointInArray:(NSArray *)array withPositionX:(CGFloat)x{
    CGFloat minx = 10000;
    NSInteger selectedIndeX = -1;
    CGPoint targetPoing;
    for (int i = 0; i<array.count; i++) {
        CGPoint point = [array[i] CGPointValue];
        if (ABS(point.x - x) < minx) {
            targetPoing = point;
            minx = ABS(point.x - x);
            selectedIndeX = i;
        }
    }
    return selectedIndeX;
}

- (void)setDeepViewModel:(QDDeepViewModel *)deepViewModel{
    _deepViewModel = deepViewModel;
    [self setNeedsDisplay];
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

- (QDDeepCursorView *)cursorView{
    if (!_cursorView) {
        _cursorView = [[QDDeepCursorView alloc] init];
        _cursorView.backgroundColor = [UIColor clearColor];
        _cursorView.hidden = YES;

    }
    return _cursorView;
}

@end
