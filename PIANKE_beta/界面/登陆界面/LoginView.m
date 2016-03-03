//
//  LoginView.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//
#import "LoginView.h"
#import "Masonry.h"
#import "CreateVC.h"
#import "NSString+Helper.h"

@interface LoginView()<UITextFieldDelegate>

@property (strong, nonatomic) UIView  *lineUnderUser;
@property (strong, nonatomic) UIView  *lineUnderPassWd;
@property (strong, nonatomic) UILabel *userNameLab;
@property (strong, nonatomic) UILabel *passWdLab;

@end

@implementation LoginView

#pragma mark -
#pragma mark - 生命周期方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.passWdTextField.delegate = self;
        self.userNameTextField.delegate = self;
        
        [self addSubview:self.backBtn];
        [self addSubview:self.createBtn];
        
        [self addSubview:self.logoImageView];
        
        [self addSubview:self.userNameLab];
        [self addSubview:self.userNameTextField];
        [self addSubview:self.lineUnderUser];
        
        [self addSubview:self.passWdLab];
        [self addSubview:self.passWdTextField];
        [self addSubview:self.lineUnderPassWd];
        
        [self addSubview:self.loginBtn];
        
        [self addSubview:self.warnningLab];
        
        
        [self addAutoLayout];
        
    }
    return self;
}

#pragma mark -
#pragma mark - 自定义方法




#pragma mark -
#pragma mark - 文本框方法

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect rect0 = self.frame;
        rect0.origin.y = - 120;
        self.frame = rect0;
        
    }];
    
    return YES;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.userNameTextField resignFirstResponder];
    [self.passWdTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect rect0 = self.frame;
        rect0.origin.y = 0;
        self.frame = rect0;
        
    }];
    
}




#pragma mark -
#pragma mark - 自动适配

- (void)addAutoLayout{
    WS(weakSelf);
    
    //返回按钮
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(22);
        make.left.equalTo(weakSelf.mas_left);
        make.size.equalTo(CGSizeMake(30, 40));
    }];
    //注册按钮
    [_createBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(22);
        make.right.equalTo(weakSelf.mas_right);
        make.size.equalTo(CGSizeMake(60, 40));
    }];
    //邮箱标签
    [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(350);
        make.left.equalTo(weakSelf.mas_left).offset(70);
        make.size.equalTo(CGSizeMake(50,30));
    }];
    //邮箱文本框
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.userNameLab);
        make.left.equalTo(weakSelf.userNameLab.mas_right).offset(1);
        make.size.equalTo(CGSizeMake(260, 25));
    }];
    
    [_lineUnderUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(381);
        make.centerX.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(285, 1));
    }];
    //密码标签
    [_passWdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.userNameLab.mas_top).offset(55);
        make.left.equalTo(weakSelf.mas_left).offset(70);
        make.size.equalTo(CGSizeMake(50, 30));
    }];
    //密码文本框
    [_passWdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.passWdLab);
        make.left.equalTo(weakSelf.passWdLab.mas_right).offset(1);
        make.size.equalTo(CGSizeMake(260, 25));
    }];
    [_lineUnderPassWd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(435);
        make.centerX.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(285, 1));
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineUnderPassWd.mas_top).offset(20);
        make.centerX.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(315, 50));
    }];
    
    [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf.userNameTextField).offset( - 150);
        make.size.equalTo(CGSizeMake(187, 87));
    }];
    
    [_warnningLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineUnderPassWd.mas_top).offset(20);
        make.centerX.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(315, 50));
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

-(UIButton *)createBtn{
    
    if (!_createBtn) {
        
        _createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_createBtn setBackgroundColor:[UIColor clearColor]];
        [_createBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_createBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _createBtn;
}

-(UIImageView *)logoImageView{
    
    if (!_logoImageView) {
        
        _logoImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"片刻LOGO"]];
        [_logoImageView setBackgroundColor:[ UIColor clearColor]];
    }
    return _logoImageView;
    
}

-(UITextField *)userNameTextField{
    
    if (!_userNameTextField) {
        
        _userNameTextField = [[UITextField alloc] init];
        _userNameTextField.placeholder = @"请输入邮箱/用户名";
        _userNameTextField.backgroundColor = [UIColor clearColor];
    }
    
    return _userNameTextField;
}

-(UITextField *)passWdTextField{
    
    if (!_passWdTextField) {
        
        _passWdTextField = [[UITextField alloc] init];
        _passWdTextField.secureTextEntry = YES;
        _passWdTextField.placeholder = @"请输入密码";
        _passWdTextField.backgroundColor = [UIColor clearColor];
    }
    
    return _passWdTextField;
}

-(UIButton *)loginBtn{
    
    if (!_loginBtn) {
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = [UIColor greenColor];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.clipsToBounds = YES;
        [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    }
    
    return _loginBtn;
}

-(UIView *)lineUnderPassWd{
    
    if (!_lineUnderPassWd) {
        
        _lineUnderPassWd = [[UIView alloc] init];
        _lineUnderPassWd.backgroundColor = [UIColor blackColor];
        
    }
    return _lineUnderPassWd;
    
}

-(UIView *)lineUnderUser{
    
    if (!_lineUnderUser) {
        
        _lineUnderUser = [[UIView alloc] init];
        _lineUnderUser.backgroundColor = [UIColor blackColor];
        
    }
    return _lineUnderUser;
    
}

-(UILabel *)userNameLab{
    
    if (!_userNameLab) {
        
        _userNameLab = [[UILabel alloc] init];
        _userNameLab.text = @"账号";
        _userNameLab.backgroundColor = [UIColor clearColor];
    }
    return _userNameLab;
    
}

-(UILabel *)passWdLab{
    
    if (!_passWdLab) {
        
        _passWdLab = [[UILabel alloc] init];
        _passWdLab.text = @"密码";
        _passWdLab.backgroundColor = [UIColor clearColor];
        
    }
    return _passWdLab;
    
}

-(UILabel *)warnningLab{
    
    if (!_warnningLab) {
        
        _warnningLab = [[UILabel alloc] init];
        _warnningLab.text = @"用户名或密码错误";
        _warnningLab.textColor = [UIColor blackColor];
        _warnningLab.backgroundColor = [UIColor redColor];
        _warnningLab.clipsToBounds = YES;
        _warnningLab.layer.cornerRadius = 5;
        _warnningLab.hidden = YES;
        _warnningLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _warnningLab;
}

@end
