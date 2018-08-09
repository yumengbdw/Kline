//
//  QDDeepViewModel.h
//  QDKline
//
//  Created by 🐟猛 on 2018/8/9.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QDCriticalModel.h"

@interface QDDeepViewModel : NSObject

@property (nonatomic, strong) NSArray *sellDeepArray;

@property (nonatomic, strong) NSArray *buyDeepArray;

@property (nonatomic, strong) QDCriticalModel *sellCriticalModel;

@property (nonatomic, strong) QDCriticalModel *buyCriticalModel;


@end
