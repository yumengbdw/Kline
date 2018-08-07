//
//  DeepView.h
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/2.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeepView : UIView

@property (nonatomic, strong) NSArray *dataArray;


- (NSArray *)configDataDrawModels:(NSArray *)drawLineModels  maxValue:(CGFloat)maxValue minValue:(CGFloat)minValue;

@end
