//
//  HeaderView.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "HeaderView.h"
#import "Masonry.h"
#import "PrefixHeader.pch"

@interface HeaderView()

@property (strong, nonatomic) UIImageView *backgroudImageView;


@end


@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.backgroudImageView];
        [self addSubview:self.logoImageBtn];
        [self addSubview:self.loginBtn];
        
        [self addAutoLayout];
        
    }
    return self;
}

#pragma mark -
#pragma mark - 自动适配

- (void)addAutoLayout{
    //防止循环运用
    WS(weakSelf);
    [_backgroudImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.height.equalTo(200);
    }];
    //头像显示
    [_logoImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    //昵称显示
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.left.equalTo(weakSelf.logoImageBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.logoImageBtn.mas_centerY);
    }];
}




#pragma mark -
#pragma mark - 懒加载

-(UIImageView *)backgroudImageView{
    
    if (!_backgroudImageView) {
        
        _backgroudImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"侧边头部背景"]];
        
    }
    return _backgroudImageView;
    
}

-(UIButton *)logoImageBtn{
    
    if (!_logoImageBtn) {
        
        _logoImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoImageBtn setBackgroundColor:[UIColor clearColor]];
        [_logoImageBtn setImage:[UIImage imageNamed:@"头像"] forState:UIControlStateNormal];
        _logoImageBtn.clipsToBounds = YES;
        _logoImageBtn.layer.cornerRadius = 25;
        
    }
    return _logoImageBtn;
    
}

-(UIButton *)loginBtn{
    
    if (!_loginBtn) {
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn  setBackgroundColor:[UIColor clearColor]];
        [_loginBtn setTitle:@"登陆/注册" forState:UIControlStateNormal];
        
    }
    return _loginBtn;
    
}

-(void)drawRect:(CGRect)rect{
    
    
    
}

@end
