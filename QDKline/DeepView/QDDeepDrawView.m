//
//  QDDeepDrawView.m
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/2.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepDrawView.h"

static CGFloat bottomMargin = 0;

@interface QDDeepDrawView()

@property (nonatomic, strong) NSMutableArray *timeLineModelArray;
@property (nonatomic, strong) UIColor *backgroundColor;


@end

@implementation QDDeepDrawView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.timeLineModelArray.count) {
        return ;
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    CGPoint firstPoint = [self.timeLineModelArray.firstObject CGPointValue];
    CGPoint lastPoint  = [self.timeLineModelArray.lastObject CGPointValue];

    CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
    for (NSValue *pointValue in self.timeLineModelArray) {
        CGPoint point = [pointValue CGPointValue];
        CGContextAddLineToPoint(ctx, point.x, point.y);
//        CGContextAddArc(ctx, point.x - 10, point.y , 20, 0, 4 * M_PI, 0);
//        [[UIColor yellowColor] set];
// //       填充(沿着矩形内围填充出指定大小的圆)
//        CGContextFillPath(ctx);

    }
    CGContextStrokePath(ctx);
    
    
    CGContextSetFillColorWithColor(ctx, self.backgroundColor.CGColor);
    CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
    for (NSValue *pointValue in self.timeLineModelArray) {
        CGPoint point = [pointValue CGPointValue];
        CGContextAddLineToPoint(ctx, point.x, point.y);
    
    }
    
    CGContextAddLineToPoint(ctx, lastPoint.x, CGRectGetHeight(self.frame) - bottomMargin);
    CGContextAddLineToPoint(ctx, firstPoint.x, CGRectGetHeight(self.frame) - bottomMargin);
    
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
}

- (NSArray *)configDataDrawModels:(NSArray *)drawLineModels  maxValue:(CGFloat)maxValue minValue:(CGFloat)minValue {
    NSAssert(drawLineModels, @"数据源不能为空");
    
    CGFloat minY = bottomMargin;//间距
    CGFloat maxY =  CGRectGetHeight(self.frame) - minY;// 实际高度
    CGFloat unitY = (maxY - minY) /(maxValue - minValue);
    
    CGFloat minX = 0;
    CGFloat maxX = CGRectGetWidth(self.frame) - minX;
    CGFloat unitX = (maxX - minX)/(drawLineModels.count - 1);
    
    [drawLineModels enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat pointY = maxY - ([obj doubleValue] - minValue) * unitY;
        CGFloat pointX = idx * unitX;
        [self.timeLineModelArray addObject:[NSValue valueWithCGPoint:CGPointMake(pointX, pointY)]];
    }];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay];
    });
    
    return _timeLineModelArray;
}

- (void)setDeepType:(DeepViewType)deepType{
    _deepType = deepType;
    if (deepType == DeepViewTypeBuy) {
        self.backgroundColor = [UIColor colorWithRed:68/255.0 green:44/255.0 blue:54/255.0 alpha:1.0f];
    } else if(deepType == DeepViewTypeSell){
        self.backgroundColor = [UIColor colorWithRed:47/255.0 green:60/255.0 blue:58/255.0 alpha:1.0f];
    }
}

- (NSMutableArray *)timeLineModelArray{
    if (!_timeLineModelArray) {
        _timeLineModelArray = [[NSMutableArray alloc] init];
    }
    return _timeLineModelArray;
}



@end
