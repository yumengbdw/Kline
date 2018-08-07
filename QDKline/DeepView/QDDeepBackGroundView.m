//
//  QDDeepBackGroundView.m
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/7.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepBackGroundView.h"
#import "QDTimeLineView.h"
#import "DeepView.h"
#import "QDCursorView.h"
#import "Masonry.h"

//
//  QDTimeLineView.m
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/3.
//  Copyright © 2018年 🐟猛. All rights reserved.
//
@interface QDDeepBackGroundView()

@property (nonatomic, strong) DeepView *buyDeepView;
@property (nonatomic, strong) DeepView *sellDeepView;

@property (nonatomic, strong) QDCursorView *cursorView;

@end

@implementation QDDeepBackGroundView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.buyDeepView];
    [self addSubview:self.sellDeepView];
    [self addSubview:self.cursorView];
}

- (void)initMasony{
    [self.buyDeepView mas_makeConstraints:^(MASConstraintMaker *make) {
    }];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"-------layoutSubviews");
    
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self reloadTimeKline];
    
    
    
}

- (void)reloadTimeKline{
    NSArray *array = @[@"1",@"3",@"5",@"10",@"30",@"28",@"18",@"14",@"13",@"30",@"10",@"12",@"13",@"23",@"21",@"30",@"10",@"10",@"20",@"35"];
}

- (void)showCursorView:(NSSet<UITouch *> *)touches{
    CGPoint point = [touches.anyObject locationInView:self];
    self.cursorView.selectedPoint = point;
    [self.cursorView setNeedsDisplay];
    NSLog(@"%@",NSStringFromCGPoint(point));
}

- (void)hideTouchView{
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self showCursorView:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self showCursorView:touches];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self showCursorView:touches];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


- (DeepView *)buyDeepView{
    if (!_buyDeepView) {
        _buyDeepView = [[DeepView alloc] init];
    }
    return _buyDeepView;
}

- (DeepView *)sellDeepView{
    if (!_sellDeepView) {
        _sellDeepView = [[DeepView alloc] init];
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
