//
//  QDDeepCursorView.h
//  QDKline
//
//  Created by 🐟猛 on 2018/8/8.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDDeepCursorView : UIView

/**
 选中的点
 */
@property (nonatomic, assign) CGPoint selectedPoint;

@property (nonatomic, strong) NSDictionary *selectModel;


@end
