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
#import "QDKLineDefine.h"
#import "Utils.h"

@interface QDDeepBackGroundView()

@end

@implementation QDDeepBackGroundView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
        //        181C2A  rgb(24,28,42)
        self.backgroundColor = [UIColor colorWithRed:24/255.0 green:28/255.0 blue:42/255.0 alpha:1];

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
    CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithRed:56/255.0 green:58/255.0 blue:75/255.0 alpha:1.0f].CGColor);

//    CGContextSetLineDash(ctx,0,lineLength,2);
    CGContextSetLineWidth(ctx, 0.5);
    
    CGFloat maxValueY =  MAX([self.buyModel.maxValueY doubleValue], [self.sellModel.maxValueY doubleValue]);
    CGFloat minValueY =  MAX([self.buyModel.minValueY doubleValue], [self.sellModel.minValueY doubleValue]);
    CGFloat unitValueY = (maxValueY - minValueY)/5.0;

    
    CGFloat unitHeight = (CGRectGetHeight(self.frame) - xCoordMargin - deepViewTopMargin)/5.0;
    CGFloat originX = screenSize.width - yCoordMargin + 0.5;
    CGFloat endX = coordCursorWidth + originX;
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:[UIColor colorWithRed:96/255.0 green:103/255.0 blue:135/255.0 alpha:1.0f]};
    //从上往下依次
    for (int i = 0; i < 6; i++) {
        CGFloat margin = 0;
        CGFloat positionX = originX;
        if (i == 0) {
            margin = 1;
        } else if(i == 5){
            margin = 0.5;
            positionX = customMagin;
        }
        CGFloat positionY = unitHeight*i + deepViewTopMargin + margin;
        CGPoint hLine[] = {CGPointMake(positionX, positionY),CGPointMake(endX, positionY)};
        CGContextStrokeLineSegments(ctx, hLine, 2);
        
        NSString *valueStringY = [NSString stringWithFormat:@"%.2f",maxValueY  - i * unitValueY];
        CGSize textSize = [Utils rectOfNSString:valueStringY attribute:attribute].size;
        [valueStringY drawAtPoint:CGPointMake(endX + 2, positionY - textSize.height/2) withAttributes:attribute];
    }
  
    //顶部间距
   
    CGFloat originY = CGRectGetHeight(self.frame) - xCoordMargin;
    CGFloat endY = coordCursorWidth + originY;
    CGFloat unitWidth =  (screenSize.width - yCoordMargin - customMagin)/2.0/3.0;

    //从左往右依次
    CGPoint vline1[] = {CGPointMake(customMagin + unitWidth, originY),CGPointMake(customMagin + unitWidth, endY)};
    CGPoint vline2[] = {CGPointMake(customMagin + 2*unitWidth, originY),CGPointMake(customMagin + 2*unitWidth, endY)};
    CGPoint vline3[] = {CGPointMake(customMagin + 4*unitWidth, originY),CGPointMake(customMagin + 4*unitWidth, endY)};
    CGPoint vline4[] = {CGPointMake(customMagin + 5*unitWidth, originY),CGPointMake(customMagin + 5*unitWidth, endY)};
    CGPoint vline5[] = {CGPointMake(customMagin + 6*unitWidth + 0.5, 0),CGPointMake(customMagin + 6*unitWidth + 0.5, originY)};

    
    CGContextStrokeLineSegments(ctx, vline1, 2);
    CGContextStrokeLineSegments(ctx, vline2, 2);
    CGContextStrokeLineSegments(ctx, vline3, 2);
    CGContextStrokeLineSegments(ctx, vline4, 2);
    CGContextStrokeLineSegments(ctx, vline5, 2);
    CGFloat buyUnitValueX = ([self.buyModel.maxValueX doubleValue] - [self.buyModel.minValueX doubleValue])/3.0;
    CGFloat sellfUnitValueX = ([self.sellModel.maxValueX doubleValue] - [self.sellModel.minValueX doubleValue])/3.0;
    
    
    NSString *valueStringX1 = [NSString stringWithFormat:@"%.2f",[self.buyModel.minValueX doubleValue] + buyUnitValueX];
    NSString *valueStringX2 = [NSString stringWithFormat:@"%.2f",[self.buyModel.minValueX doubleValue] + 2*buyUnitValueX ];
    NSString *valueStringX3 = [NSString stringWithFormat:@"%.2f",[self.sellModel.minValueX doubleValue] + sellfUnitValueX];
    NSString *valueStringX4 = [NSString stringWithFormat:@"%.2f",[self.sellModel.minValueX doubleValue] + 2*sellfUnitValueX];

    
    
    
    CGSize textSize1 = [Utils rectOfNSString:valueStringX1 attribute:attribute].size;
    CGSize textSize2 = [Utils rectOfNSString:valueStringX2 attribute:attribute].size;
    CGSize textSize3 = [Utils rectOfNSString:valueStringX3 attribute:attribute].size;
    CGSize textSize4 = [Utils rectOfNSString:valueStringX4 attribute:attribute].size;

    [valueStringX1 drawAtPoint:CGPointMake(customMagin + unitWidth - textSize1.width/2, endY + 2) withAttributes:attribute];
    [valueStringX2 drawAtPoint:CGPointMake(customMagin + 2 * unitWidth - textSize2.width/2, endY + 2) withAttributes:attribute];
    [valueStringX3 drawAtPoint:CGPointMake(customMagin + 4 * unitWidth - textSize3.width/2, endY + 2) withAttributes:attribute];
    [valueStringX4 drawAtPoint:CGPointMake(customMagin + 5 * unitWidth - textSize4.width/2, endY + 2) withAttributes:attribute];


}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _contentView;
}

- (void)getTextSize:(double)value{
    
}

//- (void)setContentSize:(CGSize)contentSize {
//    [super setContentSize:contentSize];
//    [_contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(self);
//        make.width.equalTo(@(contentSize.width));
//        make.height.equalTo(self);
//    }];
//}


@end
