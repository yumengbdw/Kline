//
//  QDDeepBackGroundView.h
//  ViewLifecycle
//
//  Created by 🐟猛 on 2018/8/7.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDCriticalModel.h"

@interface QDDeepBackGroundView : UIView

@property (nonatomic, strong) NSDictionary *criticalValueDict;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) QDCriticalModel *buyModel;
@property (nonatomic, strong) QDCriticalModel *sellModel;


@end
