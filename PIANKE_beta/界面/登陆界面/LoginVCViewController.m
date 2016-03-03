//
//  LoginVCViewController.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "LoginVCViewController.h"
#import "CreateVC.h"

@interface LoginVCViewController ()



@end

@implementation LoginVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor: [UIColor whiteColor]];
    [self.view addSubview:self.loginView];
    
    [self.loginView.backBtn addTarget:self
                               action:@selector(backView)
                     forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginView.createBtn addTarget:self
                                 action:@selector(createView)
                       forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginView.loginBtn addTarget:self
                                action:@selector(loginMethod)
                      forControlEvents:UIControlEventTouchUpInside];
}

-(void)loginMethod{
    
    //    判断用户名与密码正确使用的方法
    //    判断失败警告框
    self.loginView.userInteractionEnabled = NO;
    [UIView transitionWithView:self.loginView.warnningLab
                      duration:1.f
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^{
                        
                        self.loginView.loginBtn.hidden = YES;
                        self.loginView.warnningLab.hidden = NO;
                        
                    } completion:^(BOOL finished) {
                        
                        NSTimer *timer = [NSTimer timerWithTimeInterval:2.0
                                                                 target:self
                                                               selector:@selector(errorBack)
                                                               userInfo:nil
                                                                repeats:NO];
                        [[NSRunLoop currentRunLoop] addTimer:timer
                                                     forMode:NSRunLoopCommonModes];
                        
                    }];
    
}

-(void)errorBack{
    
    [UIView transitionWithView:self.loginView.loginBtn
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations:^{
                        
                        self.loginView.warnningLab.hidden = YES;
                        self.loginView.loginBtn.hidden = NO;
                        
                    } completion:^(BOOL finished) {
                        
                        self.loginView.userInteractionEnabled = YES;
                        
                        [self.loginView.userNameTextField becomeFirstResponder];

                    }];
}



-(void)backView{
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
}

-(void)createView{
    
    CreateVC *createView = [[CreateVC alloc] init];
    
    [self presentViewController:createView
                       animated:YES
                     completion:nil];
    
}
#pragma mark -
#pragma mark - 懒加载
-(LoginView *)loginView{
    
    if (!_loginView) {
        
        _loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
    }
    return _loginView;
}


@end
