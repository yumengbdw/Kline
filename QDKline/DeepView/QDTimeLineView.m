//
//  QDTimeLineView.m
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/3.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDTimeLineView.h"
#import "DeepView.h"
#import "QDCursorView.h"

@interface  QDTimeLineView()

@property (nonatomic, strong) DeepView *deepView;
@property (nonatomic, strong) QDCursorView *cursorView;

@end

@implementation QDTimeLineView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.deepView = [[DeepView alloc] init];
    self.deepView.backgroundColor = [UIColor whiteColor];

    [self addSubview:self.deepView];


    self.cursorView = [[QDCursorView alloc] init];
    self.cursorView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.cursorView];
    
  

}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.deepView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.cursorView.frame = self.deepView.frame;

    NSLog(@"-------layoutSubviews");

}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self reloadTimeKline];
    

    
}

- (void)reloadTimeKline{
    NSArray *array = @[@"1",@"3",@"5",@"10",@"30",@"28",@"18",@"14",@"13",@"30",@"10",@"12",@"13",@"23",@"21",@"30",@"10",@"10",@"20",@"35"];
    [self.deepView configDataDrawModels:array maxValue:35 minValue:1];
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


@end
