//
//  QDDeepDrawView.h
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/2.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DeepViewType) {
    DeepViewTypeBuy = 1,    //K线
    DeepViewTypeSell
};

@interface QDDeepDrawView : UIView

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) DeepViewType deepType;


- (NSArray *)configDataDrawModels:(NSArray *)drawLineModels  maxValue:(CGFloat)maxValue minValue:(CGFloat)minValue;

@end
