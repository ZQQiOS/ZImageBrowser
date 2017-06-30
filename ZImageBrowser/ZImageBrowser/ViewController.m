//
//  ViewController.m
//  ZImageBrowser
//
//  Created by crfchina-mac-mini-1000 on 2017/6/28.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ViewController.h"
#import "ZContentModel.h"
#import "ZContentCell.h"
#import "ZImageShowController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
//数据
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) ZContentCell *cell;
//tableView
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
- (NSArray *)arrayData{
    if (!_arrayData) {
        _arrayData = [NSArray array];
    }
    return _arrayData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //加载tableview
    [self setupTableView];
    //加载数据
    [self setupData];
}
- (void)setupTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.estimatedRowHeight = 50.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
        
}
- (void)setupData{
    NSArray *array = @[@{@"iconImageStr": @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                         @"nameStr": @"小美",
                         @"introStr" : @"000000000000000000000000000000000000000000000000000000000000000000000000",
                         @"imageArrStr": @[
                                 ]
                         },
                       @{@"iconImageStr": @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1907523683,1424907765&fm=26&gp=0.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"11111111111111111111111111111111111111111111111111111111111111111111111",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg"
                                 ]
                         },
                       @{@"iconImageStr": @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1907523683,1424907765&fm=26&gp=0.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"22",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif"
                                 ]
                         },
                       @{@"iconImageStr": @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"333",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg"
                                 ]
                         },
                       @{@"iconImageStr": @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
                         @"nameStr": @"what",
                         @"introStr" : @"4444",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg"
                                 ]
                         },
                       @{@"iconImageStr": @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"55555",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg"
                                 ]
                         },
                       @{@"iconImageStr": @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"666666",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg",
                                 @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg"
                                 ]
                         },
                       @{@"iconImageStr": @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"7777777",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg",
                                 @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg"
                                 ]
                         },
                       @{@"iconImageStr": @"http://ww2.sinaimg.cn/thumbnail/677febf5gw1erma104rhyj20k03dz16y.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"88888888",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg",
                                 @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/677febf5gw1erma104rhyj20k03dz16y.jpg"
                                 ]
                         },
                       @{@"iconImageStr": @"http://ww4.sinaimg.cn/thumbnail/677febf5gw1erma1g5xd0j20k0esa7wj.jpg",
                         @"nameStr": @"Marli",
                         @"introStr" : @"999999999",
                         @"imageArrStr": @[
                                 @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg",
                                 @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                                 @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg",
                                 @"http://ww2.sinaimg.cn/thumbnail/677febf5gw1erma104rhyj20k03dz16y.jpg",
                                 @"http://ww4.sinaimg.cn/thumbnail/677febf5gw1erma1g5xd0j20k0esa7wj.jpg"
                                 ]
                         }];
    NSDictionary *mDic = [NSDictionary dictionary];
    NSMutableArray *mArray = [NSMutableArray array];
    for (mDic in array) {
        //获取的字典
        ZContentModel *model = [[ZContentModel alloc]init];
        model = [ZContentModel yy_modelWithDictionary:mDic];
        [mArray addObject:model];
    }
    self.arrayData = mArray.copy;
    
}

#pragma mark --tableView的delegate、dataSoutce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrayData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //数组模型
    ZContentModel *model = self.arrayData[indexPath.section];
    
    static NSString *cellID = @"ZContentCell";
    ZContentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ZContentCell" bundle:nil] forCellReuseIdentifier:cellID];
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    }

    cell.model = model;
    
    cell.clickImageBlock = ^(NSArray *imageUrlArr, NSInteger currImage) {
        //启动图片浏览器
        ZImageShowController *browserVc = [[ZImageShowController alloc] init];
        browserVc.imageUrlArr = imageUrlArr;
        browserVc.currImage = currImage;
        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:browserVc animated:NO completion:nil];

    };
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 9.9;
}
@end
