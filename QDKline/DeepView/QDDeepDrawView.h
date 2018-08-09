//
//  QDDeepDrawView.h
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/2.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDKLineDefine.h"

@interface QDDeepDrawView : UIView

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) DeepViewType deepType;


/**
 画图，返回每个 model 对应的坐标

 @param dict 最大值，最小值maxValuX,minValuX,maxValuY,minValuY
 @return 坐标 Array
 */
- (NSArray *)configDataDrawModels:(NSArray *)drawLineModels valueDict:(id)model;

@end
