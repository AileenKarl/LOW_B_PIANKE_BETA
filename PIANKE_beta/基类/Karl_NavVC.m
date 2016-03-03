//
//  Karl_NavVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "Karl_NavVC.h"

@interface Karl_NavVC ()

@end

@implementation Karl_NavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //    导航条样式
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor colorWithHexString:@"#303030"]];
    [bar setTintColor:[UIColor whiteColor]];
    [bar setTitleTextAttributes:@{
                                  
                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                  NSFontAttributeName:[UIFont boldSystemFontOfSize:20]
                                  
                                  }];
    //    导航条中按钮样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{
                                   
                                   NSForegroundColorAttributeName:[UIColor whiteColor],
                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:20],
                                   
                                   }
                        forState:UIControlStateNormal];
    
}

//更改状态栏颜色
-(UIStatusBarStyle)preferredStatuesStyle{
    
    return UIStatusBarStyleLightContent;
    
}

//设置状态栏是否隐藏
-(BOOL)prefersStatusBarHidden{
    
    return NO;
    
}


@end

