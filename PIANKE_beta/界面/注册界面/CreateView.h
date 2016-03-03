//
//  CreateView.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateView : UIView

@property (strong, nonatomic) UIButton *backBtn;
@property (strong, nonatomic) UIButton *SexBtnMan;
@property (strong, nonatomic) UIButton *sexBtnWoman;
@property (strong, nonatomic) UIButton *createBtn;
@property (strong, nonatomic) UIButton *logoImageViewBtn;
@property (strong, nonatomic) UITextField *userNameTextField;
@property (strong, nonatomic) UITextField *emailOrPhoneNumTextField;
@property (strong, nonatomic) UITextField *passWdTextField;
@property (strong, nonatomic) UIView  *lineUnderUser;
@property (strong, nonatomic) UIView  *lineUnderPassWd;
@property (strong, nonatomic) UIView  *lineUnderEmailOrPhoneNum;

@end
