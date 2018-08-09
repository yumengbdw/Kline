//
//  Utils.h
//  QDKline
//
//  Created by 🐟猛 on 2018/8/8.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(UInt32)hex;

+ (CGRect)rectOfNSString:(NSString *)string attribute:(NSDictionary *)attribute;
@end
