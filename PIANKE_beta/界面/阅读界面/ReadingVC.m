//
//  ReadingVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "ReadingVC.h"
#import "SettingVC.h"
#import "UIBarButtonItem+Helper.h"

@interface ReadingVC ()

@end

@implementation ReadingVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor: [UIColor groupTableViewBackgroundColor]];
    
    //    设置导航按钮和关联方法
    UIBarButtonItem *menuItem              = [UIBarButtonItem itemWithNormalIcon:@"menu"
                                                                 highlightedIcon:nil
                                                                          target:self
                                                                          action:@selector(openSideMenuMethod)];
    
    UIBarButtonItem *titleItem             = [UIBarButtonItem itemWithTitle:@"电台"
                                                                     target:nil
                                                                     action:nil];
    
    self.navigationItem.leftBarButtonItems = @[menuItem,titleItem];
    
}

#pragma mark -
#pragma mark - 自定义方法

-(void)openSideMenuMethod{
    
    [SettingVC opensSideMenuFromMenu:self.view.window];
    
}



@end
