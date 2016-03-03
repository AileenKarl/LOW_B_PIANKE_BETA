//
//  AllControllerDispatchTool.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "AllControllerDispatchTool.h"
#import "AllControllerDispatchTool.h"
#import "liangPingVC.h"
#import "ReadingVC.h"
#import "SettingVC.h"
#import "Karl_NavVC.h"
#import "LoginVCViewController.h"

@implementation AllControllerDispatchTool

+(void)createVCWithIndex:(NSUInteger)index{
    
    //    获取当前类的（唯一）对象
    AllControllerDispatchTool *dispatchTool = [AllControllerDispatchTool shareOpenController];
    [dispatchTool openVCWithIndex:index];
    
}

+(instancetype)shareOpenController{
    
    static AllControllerDispatchTool *tempTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tempTool = [[AllControllerDispatchTool alloc] init];
        
    });
    return tempTool;
    
}

-(void)openVCWithIndex:(NSUInteger)index{
    
    switch (index) {
        case 0:
            //            第一次加载，加载  ？ 界面
        {
            
            static Karl_NavVC *navVC = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken,^{
                
                liangPingVC *goodVC = [[liangPingVC alloc] init];
                navVC = [[Karl_NavVC alloc] initWithRootViewController:goodVC];
                
            });
            
            [UIApplication sharedApplication].keyWindow.rootViewController = navVC;
            [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
            
            
        }
            break;
            
        case 1:
            //            第一次加载，加载  ？ 界面
        {
            
            static Karl_NavVC *navVC = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken,^{
                
                ReadingVC *readingVC = [[ReadingVC alloc] init];
                navVC = [[Karl_NavVC alloc] initWithRootViewController:readingVC];
                
            });
            
            [UIApplication sharedApplication].keyWindow.rootViewController = navVC;
            [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
            
            
        }
            break;
            
            //        {
            //            static LoginVCViewController *loginVC = nil;
            //            static dispatch_once_t onceToken;
            //            dispatch_once(&onceToken,^{
            //
            //                LoginVCViewController *loginVC = [[LoginVCViewController alloc] init];
            //
            //            });
            //
            //            [UIApplication sharedApplication].keyWindow.rootViewController = loginVC;
            //            [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
            //            
            //        }
            
        default:
            break;
    }
    
}


@end
