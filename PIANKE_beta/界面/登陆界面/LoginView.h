//
//  LoginView.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (strong, nonatomic) UIButton *backBtn;
@property (strong, nonatomic) UIButton *createBtn;
@property (strong, nonatomic) UIImageView *logoImageView;
@property (strong, nonatomic) UITextField *userNameTextField;
@property (strong, nonatomic) UITextField *passWdTextField;
@property (strong, nonatomic) UIButton    *loginBtn;
@property (strong, nonatomic) UILabel     *warnningLab;

@end
