//
//  SettingVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "SettingVC.h"
#import "AllControllerDispatchTool.h"
#import "HeaderView.h"
#import "Masonry.h"
#import "LoginVCViewController.h"

@interface SettingVC ()<UITableViewDataSource,UITableViewDelegate>

//背景遮罩
@property (strong, nonatomic) UIView *backgroudImageView;

//内容视图
@property (strong, nonatomic) UIView *contentView;

//进入视图的序号
@property (assign, nonatomic) NSUInteger selectedIndex;

//视图选择的tableView
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *dataSource;

@property (strong, nonatomic) HeaderView *headerView;
@end

@implementation SettingVC


#pragma mark -
#pragma mark - 自定义方法

+(instancetype)shareSideMenu{
    
    static SettingVC *sideMenuVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sideMenuVC = [self new];
        
    });
    return sideMenuVC;
    
}

//唤醒侧边菜单方法
+(void)opensSideMenuFromMenu:(UIWindow *)window{
    
    //    每次调用都能够保证唤醒的侧边菜单是唯一一个
    SettingVC *sideMenu = [SettingVC shareSideMenu];
    [window addSubview:sideMenu.view];
    
    //唤醒侧边菜单后，需要让侧边菜单进入当前视图
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect rect = sideMenu.contentView.frame;
        rect.origin.x                     = 0;
        sideMenu.contentView.frame        = rect;
        sideMenu.backgroudImageView.alpha = 0.5;
        
    }];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //    侧滑菜单收回
    [self closeSideMenu:0];
    
}

-(void)closeSideMenu:(NSUInteger)index{
    
    //    拿到已经被唤醒的侧滑菜单(self)
    [UIView animateWithDuration:0.5
                     animations:^{
                         //    侧滑收回
                         CGRect rect                   = self.contentView.frame;
                         rect.origin.x                 = - rect.size.width;
                         self.contentView.frame        = rect;
                         self.backgroudImageView.alpha = 0.f;
                         
                     } completion:^(BOOL finished) {
                         
                         //    将侧滑菜单移除
                         [self.view removeFromSuperview];
                         [AllControllerDispatchTool createVCWithIndex:index];
                     }];
    
}

#pragma mark -
#pragma mark - 表格方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell                 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font  = [UIFont boldSystemFontOfSize:20];
    }
    
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:@"menu"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 5;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self closeSideMenu:indexPath.row];
    
}


-(void)changeToLoginVC{
    
    LoginVCViewController *loginVC = [[LoginVCViewController alloc] init];
    
    [self presentViewController:loginVC
                       animated:YES
                     completion:nil];
    
}

#pragma mark -
#pragma mark - 生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.backgroudImageView];
    
    [self.contentView addSubview:self.tableView];
    [self.contentView addSubview:self.headerView];
    [self.view addSubview:self.contentView];
    
    [self.headerView.loginBtn addTarget:self
                                 action:@selector(changeToLoginVC)
                       forControlEvents:UIControlEventTouchUpInside];
    
    
    __weak typeof(self.contentView)weakSelf = self.contentView;
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        /*
         因为_headerView是加载在ContentView之上
         所以_headerView的约束是根据ContentView来计算的
         因此在block当中weakSelf必须为contentView类型
         */
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.height.equalTo(200);
    }];
    
    
    
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    self.dataSource = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
}


#pragma mark -
#pragma mark - 懒加载

-(UIView *)backgroudImageView{
    
    if (!_backgroudImageView) {
        
        _backgroudImageView                 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backgroudImageView.backgroundColor = [UIColor blackColor];
        _backgroudImageView.alpha           = 0.f;
        
    }
    return _backgroudImageView;
    
}

-(UIView *)contentView{
    
    if (!_contentView) {
        
        CGRect rect                  = [UIScreen mainScreen].bounds;
        _contentView                 = [[UIView alloc] initWithFrame:CGRectMake( -rect.size.width * 0.8, 0, rect.size.width * 0.8, rect.size.height)];
        _contentView.backgroundColor = [UIColor colorWithRed:0.2
                                                       green:0.2
                                                        blue:0.2
                                                       alpha:1.f];
        
    }
    return _contentView;
    
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        CGSize size                = self.view.bounds.size;
        _tableView                 = [[UITableView alloc] initWithFrame:CGRectMake(0, size.height/7 * 2, self.contentView.frame.size.width, size.height/7 * 5 - 66)
                                                                  style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight       =  _tableView.frame.size.height/7;
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
    
}

-(HeaderView *)headerView{
    
    if (!_headerView) {
        _headerView = [[HeaderView alloc] init];
    }
    return _headerView;
}

@end
