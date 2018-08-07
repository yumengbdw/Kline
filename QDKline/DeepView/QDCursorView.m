//
//  QDCursorView.m
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/2.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDCursorView.h"

@implementation QDCursorView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGFloat lengths[] = {3,3};

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineDash(ctx,0,lengths,2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(ctx, 1.5);

    
    
    CGFloat minX = 0;
    CGFloat minY = 0;
    CGFloat selectX = minX + self.selectedPoint.x;


    // 横线
    CGContextMoveToPoint(ctx,minX, self.selectedPoint.y - minY);
    CGContextAddLineToPoint(ctx, minX + CGRectGetWidth(self.frame), self.selectedPoint.y - minY);
    
    // 竖线
    CGContextMoveToPoint(ctx, minX + self.selectedPoint.x,minY);
    CGContextAddLineToPoint(ctx, minX + self.selectedPoint.x, CGRectGetHeight(self.frame));
//    CGContextSetLineWidth(ctx, 5);
    CGContextStrokePath(ctx);
    
    
    //绘制交叉圆点
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineDash(ctx, 0, NULL, 0);
    CGContextAddArc(ctx, selectX, self.selectedPoint.y, 2, 0, 2 * M_PI, 0);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}

@end
