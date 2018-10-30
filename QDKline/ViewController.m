//
//  ViewController.m
//  QDKline
//
//  Created by 🐟猛 on 2018/8/7.
//  Copyright © 2018年 🐟猛. All rights reserved.
//

#import "ViewController.h"
#import "QDDeepVC.h"
#import "Masonry.h"
#import "QDTimeViewVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *klineTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.klineTableView];
    
    [self.klineTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"klineCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    NSDictionary *dic = self.dataSource[indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.dataSource[indexPath.row];
    Class class = NSClassFromString([dic objectForKey:@"VCName"]);
    [self.navigationController pushViewController:[[class alloc] init] animated:YES];
}

- (UITableView *)klineTableView{
    if (!_klineTableView) {
        _klineTableView = [[UITableView alloc] init];
        _klineTableView.delegate = self;
        _klineTableView.dataSource = self;
    }
    
    return _klineTableView;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithObjects:@{@"title":@"深度图",@"VCName":[[QDDeepVC class] description]},@{@"title":@"分时图",@"VCName":[[QDTimeViewVC class] description]},@{@"title":@" k线图",@"VCName":[[QDDeepVC class] description]}, nil];
    }
    return _dataSource;
}


@end
