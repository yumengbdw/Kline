//
//  Utils.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/8.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+ (CGRect)rectOfNSString:(NSString *)string attribute:(NSDictionary *)attribute {
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                       options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                    attributes:attribute
                                       context:nil];
    return rect;
}

@end
