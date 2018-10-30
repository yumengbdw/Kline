//
//  QDDeepCursorView.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/8.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDDeepCursorView.h"
#import "QDKLineDefine.h"
#import "Utils.h"

@implementation QDDeepCursorView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat radius = 10;
    
    CGFloat arcX = self.selectedPoint.x + customMagin > radius ? self.selectedPoint.x + customMagin : radius;
    
    if (radius > self.selectedPoint.x + customMagin) {
        arcX = radius;
    }
    CGFloat arcY = self.selectedPoint.y > radius ? self.selectedPoint.y : radius;

   
    //画圆。
    CGContextAddArc(ctx, arcX, arcY + deepViewTopMargin , 10, 0, 4 * M_PI, 0);
//    64,75,107  404B6B
    [[UIColor colorWithRed:64/255.0 green:75/255.0 blue:107/255.0 alpha:1] set];
    //填充(沿着矩形内围填充出指定大小的圆)
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, arcX, arcY + deepViewTopMargin , 5, 0, 4 * M_PI, 0);
    CGContextSetLineWidth(ctx, 5);
    
    [[UIColor colorWithRed:123/255.0 green:154/255.0 blue:244/255.0 alpha:1] set];
    CGContextFillPath(ctx);
    
    // 画提示框
    CGContextSetStrokeColorWithColor(ctx,  [UIColor colorWithRed:38/255.0 green:43/255.0 blue:65/255.0 alpha:1].CGColor);
    CGContextSetLineWidth(ctx, 0.5);
    CGFloat originX = arcX - 110;
    CGFloat originY = arcY - radius;

    if (originX < 0) {
        originX = customMagin + 2*radius + self.selectedPoint.x ;
    }
    
    if (originY < 50) {
        originY = 60;

    }
    CGContextStrokeRect(ctx, CGRectMake(originX, originY, 110, 50));
    
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:38/255.0 green:43/255.0 blue:65/255.0 alpha:1].CGColor);
    CGContextFillRect(ctx, CGRectMake(originX, originY, 110, 50));
    
    
    NSString *priceString = [NSString stringWithFormat:@"委托价:%@",[self.selectModel objectForKey:@"price"]];
    NSString *volumeString = [NSString stringWithFormat:@"累计:%@",[self.selectModel objectForKey:@"volume"]];
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:[UIColor whiteColor]};

    CGSize priceSize = [Utils rectOfNSString:priceString attribute:attribute].size;
    CGSize volumeSize = [Utils rectOfNSString:volumeString attribute:attribute].size;

    CGFloat stringY = (50 - priceSize.height - volumeSize.height - 5)/2 + originY;
    CGFloat priceStringX = (110 - priceSize.width)/2 + originX;
    CGFloat volumeStringX = (110 - priceSize.width)/2 + originX;
    
    [priceString drawAtPoint:CGPointMake(priceStringX , stringY) withAttributes:attribute];
    [volumeString drawAtPoint:CGPointMake(volumeStringX, stringY + priceSize.height + 5) withAttributes:attribute];
    
    
}

@end
