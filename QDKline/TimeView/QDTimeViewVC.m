//
//  QDTimeViewVC.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/18.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "QDTimeViewVC.h"
#import "NetWorking.h"

@interface QDTimeViewVC ()

@end

@implementation QDTimeViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"minute" ofType:@"json"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"%@",json);
}


- (void)reloadData
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"type"] = @"1min";
    param[@"market"] = @"btc_usdt";
    param[@"size"] = @"1000";
    [NetWorking requestWithApi:@"http://api.bitkk.com/data/v1/kline" param:param thenSuccess:^(NSDictionary *responseObject) {
//        Y_KLineGroupModel *groupModel = [Y_KLineGroupModel objectWithArray:responseObject[@"data"]];
//        self.groupModel = groupModel;
//        [self.modelsDict setObject:groupModel forKey:self.type];
//        NSLog(@"%@",groupModel);
//        [self.stockChartView reloadData];
    } fail:^{
        
    }];
}

@end
