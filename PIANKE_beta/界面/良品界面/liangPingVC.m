//
//  liangPingVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "liangPingVC.h"
#import "UIBarButtonItem+Helper.h"
#import "SettingVC.h"
#import "LoadingView.h"
#import "HttpTool.h"
#import "HttpRequestMacro.h"
#import "GoodProductsRootModel.h"
#import "GoodProductsTableViewCell.h"
#import "DIYMJRefresh.h"
#import "BuyVC.h"
#import "DetailVC.h"
#import "NSString+ChangeHtmlString.h"


@interface liangPingVC ()<UITableViewDataSource,UITableViewDelegate>

//表格视图
@property (strong, nonatomic) UITableView *tableView;

//表格数据源
@property (strong, nonatomic) NSMutableArray *dataSourceArr;

//每次请求数据的个数
@property (assign, nonatomic) NSUInteger limitNum;


@property (strong, nonatomic) NSMutableArray *buyUrlArr;

//良品id
@property (strong, nonatomic) NSMutableArray *idArr;

@end

@implementation liangPingVC


#pragma mark -
#pragma mark - 初始化方法

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self.view addSubview:self.tableView];
        self.dataSourceArr = [NSMutableArray array];
        self.limitNum   = 20;
        
    }
    return self;
}

#pragma mark -
#pragma mark - 生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buyUrlArr = [NSMutableArray array];
    self.idArr = [NSMutableArray array];

    [self.view addSubview:self.tableView];
    
    [self.view setBackgroundColor: [UIColor groupTableViewBackgroundColor]];
    
    //    设置导航按钮和关联方法
    UIBarButtonItem *menuItem              = [UIBarButtonItem itemWithNormalIcon:@"menu"
                                                                 highlightedIcon:nil
                                                                          target:self
                                                                          action:@selector(openSideMenuMethod)];
    
    UIBarButtonItem *titleItem             = [UIBarButtonItem itemWithTitle:@"良品"
                                                                     target:nil
                                                                     action:nil];
    
    self.navigationItem.leftBarButtonItems = @[menuItem,titleItem];
    
//    发起网络请求
    [self sendHttpRequest];
    
//    显示LoadingView(网络请求完成后消失)
    [LoadingView showKarlLoadingViewFromSuperView:self.tableView];
    
    [self addRefreshControl];
    
}


#pragma mark -
#pragma mark - 表格方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSourceArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    static NSString *cellID = @"cellIdentifier";
    GoodProductsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell =[[GoodProductsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:cellID];
        
    }
    
    [cell loadingDataWithModel:[self.dataSourceArr objectAtIndex:indexPath.row]];
    cell.buyBtn.tag = indexPath.row;
    NSLog(@"%ld",cell.buyBtn.tag);
    [self.buyUrlArr addObject:cell.urlStr];
    
    ///定义在VC中的购买界面跳转操作
    [cell.buyBtn addTarget:self
                    action:@selector(changeToBuyView:)
          forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//获取当前商品的contentid
    NSString *selectProductId = [self.idArr objectAtIndex:indexPath.row];
//在这里进入详情界面

    DetailVC *detailView = [[DetailVC alloc] init];
    
    [detailView initWithId:selectProductId];
    
    [self.navigationController pushViewController:detailView
                                         animated:YES];
    
}

#pragma mark -
#pragma mark - 调用方法

-(void)sendHttpRequest{
    
    NSDictionary *paramDic = @{
                               @"start" : @0,   //从第几条数据开始获取
                               @"limit" : @10,  //一次性获取多少条数据
                               @"client" : @2   //服务器配置代码
                               };
    
    [HttpTool getWithPath:HTTP_PRODUCTS
                   params:paramDic
                  success:^(id JSON) {
                      
                      GoodProductsRootModel *rootModel = [[GoodProductsRootModel alloc]initWithDictionary:JSON];
                      [[self.tableView header] endRefreshing];
                      NSLog(@"Success");
//                      表格数据
                      self.dataSourceArr = [[NSMutableArray alloc] initWithArray:rootModel.data.list];
//                      获取良品id数据
                      for (GoodProductsListModel *tempModel in rootModel.data.list) {
                          
                          NSString *contentid = tempModel.contentid;
                          [self.idArr addObject:contentid];
                          
                      }
                      //                      刷新表格
                      NSLog(@"%@",self.dataSourceArr);
                      
                      [self.tableView reloadData];
//                      网络请求后，loadingView消失
                      [LoadingView removeKarlLoadingViewFromSuperView:self.tableView];
                  } failure:^(NSError *error) {
                      NSLog(@"");
                      [LoadingView removeKarlLoadingViewFromSuperView:self.tableView];
                  }];
}


-(void)addRefreshControl{
    
//    添加夏利刷新和上拉提取
    DIYMJRefreshGifHeader *gifHeader = [DIYMJRefreshGifHeader headerWithRefreshingBlock:^{
        
        [self sendHttpRequest];
        
    }];
    self.tableView.header = gifHeader;
    
    DIYMJRefreshBackGifFooter *gifFooter = [DIYMJRefreshBackGifFooter footerWithRefreshingBlock:^{
        ;
    }];
    self.tableView.footer = gifFooter;

}

#pragma mark -
#pragma mark - 自定义方法

-(void)openSideMenuMethod{
    
    [SettingVC opensSideMenuFromMenu:self.view.window];
    
}


///定义在VC中的购买界面跳转操作方法
-(void)changeToBuyView:(UIButton *)btn{
    
    BuyVC *buyView = [[BuyVC alloc] init];
    
    buyView.urlString = [self.buyUrlArr objectAtIndex:btn.tag];
    
    NSLog(@"网址编号%ld",btn.tag);
    
    [self.navigationController pushViewController:buyView
                                         animated:YES];
    
}

#pragma mark -
#pragma mark - 初始化方法（懒加载）

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.frame = self.view.bounds;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
    
}

@end
