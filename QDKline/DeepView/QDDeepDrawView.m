//
//  QDDeepDrawView.m
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/2.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepDrawView.h"
#import "QDCriticalModel.h"

static CGFloat bottomMargin = 0;

@interface QDDeepDrawView()

@property (nonatomic, strong) NSMutableArray *timeLineModelArray;
@property (nonatomic, strong) UIColor *bgColor;


@end

@implementation QDDeepDrawView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.timeLineModelArray.count) {
        return ;
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, self.bgColor.CGColor);
    
    CGPoint firstPoint = [self.timeLineModelArray.firstObject CGPointValue];
    CGPoint lastPoint  = [self.timeLineModelArray.lastObject CGPointValue];

    CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
    for (NSValue *pointValue in self.timeLineModelArray) {
        CGPoint point = [pointValue CGPointValue];
        CGContextAddLineToPoint(ctx, point.x, point.y);
        
        

//        CGContextAddArc(ctx, point.x, point.y , 10, 0, 4 * M_PI, 0);
//        [[UIColor orangeColor] set];
//
//
// //       填充(沿着矩形内围填充出指定大小的圆)
//        CGContextFillPath(ctx);
//
//        CGContextAddArc(ctx, point.x, point.y  , 5, 0, 4 * M_PI, 0);
//        CGContextSetLineWidth(ctx, 5);
//
//        [[UIColor blueColor] set];
//        CGContextFillPath(ctx);
        
    }
    CGContextStrokePath(ctx);
    
    
    CGContextSetFillColorWithColor(ctx, self.bgColor.CGColor);
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

- (NSArray *)configDataDrawModels:(NSArray *)drawLineModels valueDict:(id)model{
    NSAssert(drawLineModels, @"数据源不能为空");
//    maxValuX,minValueX,maxValueY,minValueY
    
    QDCriticalModel *criticalModel = model;
    CGFloat maxValueX = [criticalModel.maxValueX doubleValue];
    CGFloat minValueX = [criticalModel.minValueX doubleValue];
    CGFloat maxValueY = [criticalModel.maxValueY doubleValue];
    CGFloat minValueY = [criticalModel.minValueY doubleValue];

    CGFloat minY = bottomMargin;//间距
    CGFloat maxY =  CGRectGetHeight(self.frame) - minY;// 实际高度
    CGFloat unitY = (maxY - minY) /(maxValueY - minValueY);
    
    CGFloat minX = 0;
    CGFloat maxX = CGRectGetWidth(self.frame) - minX;
    CGFloat unitX = (maxX - minX)/(maxValueX - minValueX);
    
    [drawLineModels enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat pointY = maxY - ([[obj objectForKey:@"volume"] doubleValue] - minValueY) * unitY;
        CGFloat pointX = ([[obj objectForKey:@"price"] doubleValue] - minValueX) * unitX;
        [self.timeLineModelArray addObject:[NSValue valueWithCGPoint:CGPointMake(pointX, pointY)]];
    }];
    
//    [self.timeLineModelArray addObject:[NSValue valueWithCGPoint:CGPointMake(maxValueY, 0)];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay];
    });
    
    return _timeLineModelArray;
}

- (void)setDeepType:(DeepViewType)deepType{
    _deepType = deepType;
    if (deepType == DeepViewTypeBuy) {
        self.bgColor = [UIColor colorWithRed:68/255.0 green:44/255.0 blue:54/255.0 alpha:1.0f];
    } else if(deepType == DeepViewTypeSell){
        self.bgColor = [UIColor colorWithRed:47/255.0 green:60/255.0 blue:58/255.0 alpha:1.0f];
    }
}

- (NSMutableArray *)timeLineModelArray{
    if (!_timeLineModelArray) {
        _timeLineModelArray = [[NSMutableArray alloc] init];
    }
    return _timeLineModelArray;
}





@end
