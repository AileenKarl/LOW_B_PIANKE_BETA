//
//  CreateView.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "CreateView.h"
#import "Masonry.h"

@interface CreateView()<UITextFieldDelegate>

@end

@implementation CreateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.passWdTextField.delegate = self;
        self.userNameTextField.delegate = self;
        self.emailOrPhoneNumTextField.delegate = self;
        
        [self addSubview:self.backBtn];
        [self addSubview:self.logoImageViewBtn];
        [self addSubview:self.SexBtnMan];
        [self addSubview:self.sexBtnWoman];
        [self addSubview:self.userNameTextField];
        [self addSubview:self.emailOrPhoneNumTextField];
        [self addSubview:self.lineUnderEmailOrPhoneNum];
        [self addSubview:self.passWdTextField];
        [self addSubview:self.lineUnderPassWd];
        [self addSubview:self.lineUnderUser];
        [self addSubview:self.createBtn];
        
        [self autoLayout];
    }
    return self;
}



#pragma mark -
#pragma mark - 文本框方法

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         CGRect rect = self.frame;
                         rect.origin.y = - 180;
                         self.frame = rect;
                         
                     }];
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.userNameTextField resignFirstResponder];
    [self.emailOrPhoneNumTextField resignFirstResponder];
    [self.passWdTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         CGRect rect = self.frame;
                         rect.origin.y = 0;
                         self.frame = rect;
                         
                     }];
    
}

#pragma mark -
#pragma mark - 自动适配

-(void)autoLayout{
    
    WS(weakSelf);
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //返回按钮
        make.top.equalTo(weakSelf.mas_top).offset(22);
        make.left.equalTo(weakSelf.mas_left);
        make.size.equalTo(CGSizeMake(30, 40));
        
    }];
    
    [_logoImageViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf).offset( - 250);
        make.centerX.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(112, 112));
        
    }];
    
    [_SexBtnMan mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakSelf.frame.size.width/4).offset( - weakSelf.frame.size.width/4);
        make.centerY.equalTo(weakSelf).offset( - 50);
        make.size.equalTo(CGSizeMake(106, 50));
        
    }];
    
    [_sexBtnWoman mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakSelf.frame.size.width/4);
        make.centerY.equalTo(weakSelf).offset( - 50);
        make.size.equalTo(CGSizeMake(106, 50));
        
        
    }];
    
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf).offset(40);
        make.size.equalTo(CGSizeMake(300, 30));
        
    }];
    
    [_emailOrPhoneNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf).offset(92);
        make.size.equalTo(CGSizeMake(300, 30));
        
        
    }];
    
    [_passWdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf).offset(142);
        make.size.equalTo(CGSizeMake(300, 30));
        
    }];
    
    [_lineUnderPassWd mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.passWdTextField.mas_bottom);
        make.left.equalTo(weakSelf.passWdTextField.mas_left);
        make.right.equalTo(weakSelf.passWdTextField.mas_right);
        make.bottom.equalTo(weakSelf.passWdTextField.mas_bottom).offset(1);
        
    }];
    
    [_lineUnderEmailOrPhoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.emailOrPhoneNumTextField.mas_bottom);
        make.left.equalTo(weakSelf.emailOrPhoneNumTextField.mas_left);
        make.right.equalTo(weakSelf.emailOrPhoneNumTextField.mas_right);
        make.bottom.equalTo(weakSelf.emailOrPhoneNumTextField.mas_bottom).offset(1);
        
    }];
    
    [_lineUnderUser mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.userNameTextField.mas_bottom);
        make.left.equalTo(weakSelf.userNameTextField.mas_left);
        make.right.equalTo(weakSelf.userNameTextField.mas_right);
        make.bottom.equalTo(weakSelf.userNameTextField.mas_bottom).offset(1);
        
    }];
    
    [_createBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf).offset(212);
        make.size.equalTo(CGSizeMake(300, 50));
        
    }];
}



#pragma mark -
#pragma mark - 懒加载

-(UIButton *)backBtn{
    
    if (!_backBtn) {
        
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundColor:[UIColor clearColor]];
        [_backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        
    }
    return _backBtn;
    
}

-(UIButton *)SexBtnMan{
    
    if (!_SexBtnMan) {
        
        _SexBtnMan = [UIButton buttonWithType:UIButtonTypeCustom];
        [_SexBtnMan setBackgroundColor:[UIColor clearColor]];
        [_SexBtnMan setImage:[UIImage imageNamed:@"男"] forState:UIControlStateNormal];
        [_SexBtnMan setImage:[UIImage imageNamed:@"男_sel"] forState:UIControlStateSelected];
    }
    return _SexBtnMan;
    
}

-(UIButton *)sexBtnWoman{
    
    if (!_sexBtnWoman) {
        
        _sexBtnWoman = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sexBtnWoman setBackgroundColor:[UIColor clearColor]];
        [_sexBtnWoman setImage:[UIImage imageNamed:@"女"] forState:UIControlStateNormal];
        [_sexBtnWoman setImage:[UIImage imageNamed:@"女_sel"] forState:UIControlStateSelected];
        
    }
    return _sexBtnWoman;
    
}

-(UIButton *)createBtn{
    
    if (!_createBtn) {
        
        _createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_createBtn setBackgroundColor:[UIColor greenColor]];
        [_createBtn setTitle:@"创建用户" forState:UIControlStateNormal];
        [_createBtn.layer setCornerRadius:5];
        _createBtn.clipsToBounds =YES;
        
    }
    return _createBtn;
    
}

-(UIButton *)logoImageViewBtn{
    
    if (!_logoImageViewBtn) {
        
        _logoImageViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoImageViewBtn setImage:[UIImage imageNamed:@"上传头像"] forState:UIControlStateNormal];
        [_logoImageViewBtn setBackgroundColor:[UIColor clearColor]];
        [_logoImageViewBtn.layer setCornerRadius:56];
        _logoImageViewBtn.clipsToBounds = YES;
    }
    return _logoImageViewBtn;
    
}

-(UITextField *)userNameTextField{
    
    if (!_userNameTextField) {
        
        _userNameTextField = [[UITextField alloc] init];
        _userNameTextField.placeholder = @"昵称";
        _userNameTextField.backgroundColor = [UIColor clearColor];
        [_userNameTextField setValue:[UIColor grayColor]
                          forKeyPath:@"_placeholderLabel.textColor"];
        [_userNameTextField setValue:[UIFont systemFontOfSize:17]
                          forKeyPath:@"_placeholderLabel.font"];
    }
    return _userNameTextField;
}

-(UITextField *)emailOrPhoneNumTextField{
    
    if (!_emailOrPhoneNumTextField) {
        
        _emailOrPhoneNumTextField = [[UITextField alloc] init];
        _emailOrPhoneNumTextField.placeholder = @"手机号/邮箱";
        _emailOrPhoneNumTextField.backgroundColor = [UIColor clearColor];
        [_emailOrPhoneNumTextField setValue:[UIColor grayColor]
                                 forKeyPath:@"_placeholderLabel.textColor"];
        [_emailOrPhoneNumTextField setValue:[UIFont systemFontOfSize:17]
                                 forKeyPath:@"_placeholderLabel.font"];
        
    }
    return _emailOrPhoneNumTextField;
    
}

-(UITextField *)passWdTextField{
    
    if (!_passWdTextField) {
        
        _passWdTextField = [[UITextField alloc] init];
        _passWdTextField.placeholder = @"密码";
        _passWdTextField.secureTextEntry = YES;
        _passWdTextField.backgroundColor = [UIColor clearColor];
        [_passWdTextField setValue:[UIColor grayColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
        [_passWdTextField setValue:[UIFont systemFontOfSize:17]
                        forKeyPath:@"_placeholderLabel.font"];
        
        
    }
    return _passWdTextField;
    
}

-(UIView *)lineUnderUser{
    
    if (!_lineUnderUser) {
        
        _lineUnderUser = [[UIView alloc] init];
        _lineUnderUser.backgroundColor = [UIColor blackColor];
        
    }
    return _lineUnderUser;
    
}

-(UIView *)lineUnderEmailOrPhoneNum{
    
    if (!_lineUnderEmailOrPhoneNum) {
        
        _lineUnderEmailOrPhoneNum = [[UIView alloc] init];
        _lineUnderEmailOrPhoneNum.backgroundColor = [UIColor blackColor];
        
    }
    return _lineUnderEmailOrPhoneNum;
    
}

-(UIView *)lineUnderPassWd{
    
    if (!_lineUnderPassWd) {
        _lineUnderPassWd = [[UIView alloc] init];
        _lineUnderPassWd.backgroundColor = [UIColor blackColor];
        
    }
    return _lineUnderPassWd;
    
}

@end
