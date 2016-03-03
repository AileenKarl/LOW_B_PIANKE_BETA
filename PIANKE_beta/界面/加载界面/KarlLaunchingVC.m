//
//  KarlLaunchingVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "KarlLaunchingVC.h"
#import "Masonry.h"
#import "HttpRequestMacro.h"
#import "HttpTool.h"
#import "AllControllerDispatchTool.h"

#define LAUCHING_IMAGEVIEW @"lanchingImageView"

@interface KarlLaunchingVC ()

@property (strong, nonatomic) UIImageView *launchingBackgroudImageView;
@property (strong, nonatomic) UIImageView *launchingLogoImageView;

@end

@implementation KarlLaunchingVC

#pragma mark -
#pragma mark - 生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    加载背景
    [self.view addSubview:self.launchingBackgroudImageView];
    [self.view addSubview:self.launchingLogoImageView];
    
    
    //    添加约束（自动布局）
    //    为了避免使用block的时候出现循环引用，使用__weak
    __weak typeof (self) vc = self;
    [_launchingLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //    约束相对宽高固定
        CGFloat width  = vc.view.frame.size.width/2.f;
        CGFloat height = width * 0.4;
        make.size.mas_equalTo(CGSizeMake(width, height));
        //    约束相对坐标固定
        CGFloat viewHeight = vc.view.bounds.size.height;
        make.centerX.mas_equalTo(vc.view.mas_centerX);
        make.centerY.mas_equalTo(vc.view.mas_centerY).offset(-viewHeight/4);
        
    }];
    
    //   先加载本地保存的【上一次请求来的图片】
    [self loadLaunchingImageView];
    
    //   向服务器发送请求，获取最新的lauching启动图，并保存到本地，方便下次运行使用
    [self getLauchingImageView];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    //    让背景动起来
    [UIView animateWithDuration:4.f animations:^{
        CGRect rect = _launchingBackgroudImageView.frame;
        rect.origin = CGPointMake(-100, -100);
        rect.size   = CGSizeMake(rect.size.width + 200, rect.size.height + 200);
        _launchingBackgroudImageView.frame = rect;
        
    } completion:^(BOOL finished) {
        [AllControllerDispatchTool createVCWithIndex:0];
    }];
    
}

#pragma mark -
#pragma mark - 自定义方法

-(void)loadLaunchingImageView{
    
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:LAUCHING_IMAGEVIEW];
    if (imageData) {
        
        self.launchingBackgroudImageView.image = [UIImage imageWithData:imageData];
        
    }
    
}

-(void)getLauchingImageView{
    
    [HttpTool postWithPath:HTTP_LAUNCH_SCREEN
                    params:@{@"client":@2}
                   success:^(id JSON) {
                       //                       网络请求成功后的block回调
                       NSLog(@"%@",JSON);
                       NSString *imageUrl = [[JSON objectForKey:@"data"] objectForKey:@"picurl"];
                       NSData *imageData  = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
                       [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:LAUCHING_IMAGEVIEW];
                   }
                   failure:^(NSError *error) {
                       //                       网络请求失败后的block回调
                       NSLog(@"%@",error);
                   }];
    
}

#pragma mark -
#pragma mark - 懒加载

//背景图
-(UIImageView *)launchingBackgroudImageView{
    
    if (!_launchingBackgroudImageView) {
        
        _launchingBackgroudImageView                 = [[UIImageView alloc] init];
        _launchingBackgroudImageView.frame           = self.view.bounds;
        _launchingBackgroudImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _launchingBackgroudImageView.image           = [UIImage imageNamed:@"defaultCover"];
        
    }
    return _launchingBackgroudImageView;
    
}

//登陆LOGO
-(UIImageView *)launchingLogoImageView{
    
    if (!_launchingLogoImageView) {
        
        _launchingLogoImageView                      = [[UIImageView alloc] init];
        _launchingLogoImageView.backgroundColor      = [UIColor clearColor];
        _launchingLogoImageView.image                = [UIImage imageNamed:@"ic_splash_logo"];
        
    }
    return _launchingLogoImageView;
}

@end
