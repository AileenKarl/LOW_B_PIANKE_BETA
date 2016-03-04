//
//  DetailHeaderView.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/4.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "DetailHeaderView.h"

@implementation DetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.titleLab];
        [self addSubview:self.groupInfoIdLab];
        [self addSubview:self.groupInfoTitleLab];
        [self addSubview:self.addTime_f_Lab];
        [self addSubview:self.userInfoIcon];
        [self addSubview:self.unameLab];
        
    }
    return self;
}

-(void)loadingDataMethod:(HeaderViewModel *)model{
    
    self.titleLab.text = model.title;
    self.groupInfoTitleLab.text = model.groupInfoTitleLabText;
    self.unameLab.text = model.unameLabText;
    self.addTime_f_Lab.text = model.addTime_f_LabText;
    self.userInfoIcon.image = model.userInfoIconImage;
    
}

-(UILabel *)titleLab{
    
    if (!_titleLab) {
        
        _titleLab               = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.frame.size.width - 20, 40)];
        _titleLab.textColor     = [UIColor blackColor];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLab;
}

-(UILabel *)groupInfoIdLab{
    
    if (!_groupInfoIdLab) {
        
        _groupInfoIdLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 40, 20)];
        _groupInfoIdLab.backgroundColor = [UIColor clearColor];
        _groupInfoIdLab.font = [UIFont systemFontOfSize:15];
        _groupInfoIdLab.text = @"from:";
    
    }
    return _groupInfoIdLab;
}

-(UILabel *)groupInfoTitleLab{
    
    if (!_groupInfoTitleLab) {
        
        _groupInfoTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(55, 20, 120, 20)];
        _groupInfoTitleLab.backgroundColor = [UIColor clearColor];
        _groupInfoTitleLab.font = [UIFont systemFontOfSize:15];
        
    }
    return _groupInfoTitleLab;
}

-(UILabel *)addTime_f_Lab{
    
    if (!_addTime_f_Lab) {
        
        _addTime_f_Lab = [[UILabel alloc] initWithFrame:CGRectMake( 300, 150, self.frame.size.width - 300 - 10, 20)];
        _addTime_f_Lab.backgroundColor = [UIColor clearColor];
        _addTime_f_Lab.font = [UIFont boldSystemFontOfSize:12];
        _addTime_f_Lab.textColor = [UIColor grayColor];
    }
    return _addTime_f_Lab;
}

-(UIImageView *) userInfoIcon{
    
    if (!_userInfoIcon) {
        
        _userInfoIcon = [[UIImageView alloc] initWithFrame:CGRectMake(20, 120, 50, 50)];
        _userInfoIcon.backgroundColor = [UIColor clearColor];
        _userInfoIcon.clipsToBounds = YES;
        _userInfoIcon.layer.cornerRadius = 25;
    }
    return _userInfoIcon;
}

-(UILabel *)unameLab{
    
    if (!_unameLab) {
        
        _unameLab = [[UILabel alloc] initWithFrame:CGRectMake(85, 135, 40, 20)];
        _unameLab.backgroundColor = [UIColor clearColor];
    }
    return _unameLab;
}
@end
