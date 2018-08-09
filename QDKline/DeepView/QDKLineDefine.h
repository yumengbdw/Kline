//
//  QDKLineDefine.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/8.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <Foundation/Foundation.h>

static CGFloat xCoordMargin = 25;

static CGFloat yCoordMargin = 50;

static CGFloat deepViewTopMargin = 50;


static CGFloat coordCursorWidth = 5;


static CGFloat customMagin = 8;


#define screenSize ([UIScreen mainScreen].bounds.size)




typedef NS_ENUM(NSInteger,DeepViewType) {
    DeepViewTypeBuy = 1,    //K线
    DeepViewTypeSell
};
