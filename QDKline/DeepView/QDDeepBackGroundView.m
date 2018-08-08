//
//  QDDeepBackGroundView.m
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/7.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepBackGroundView.h"
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
  
}

- (void)initMasony{
   
}


- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGFloat lineLength[] = {3,3};
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextSetLineDash(ctx,0,lineLength,2);
    CGContextSetLineWidth(ctx, 0.5);
    
    CGFloat unitHeight = CGRectGetHeight(self.frame)/4.0;
    CGFloat width = CGRectGetWidth(self.frame);

    //从上往下依次
    CGPoint line1[] = {CGPointMake(0, 1),CGPointMake(width, 1)};
    CGPoint line2[] = {CGPointMake(0, unitHeight),CGPointMake(width, unitHeight)};
    CGPoint line3[] = {CGPointMake(0, 2*unitHeight),CGPointMake(width, 2*unitHeight)};
    CGPoint line4[] = {CGPointMake(0, 3*unitHeight),CGPointMake(width, 3*unitHeight)};
    CGPoint line5[] = {CGPointMake(0, 4*unitHeight - 1),CGPointMake(width, 4*unitHeight - 1)};
    
    CGContextStrokeLineSegments(ctx, line1, 2);
    CGContextStrokeLineSegments(ctx, line2, 2);
    CGContextStrokeLineSegments(ctx, line3, 2);
    CGContextStrokeLineSegments(ctx, line4, 2);
    CGContextStrokeLineSegments(ctx, line5, 2);
}


@end
