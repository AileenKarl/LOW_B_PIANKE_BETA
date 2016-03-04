//
//  DetailHeaderView.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/4.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderViewModel.h"

@interface DetailHeaderView : UIView

@property (strong, nonatomic) UILabel *titleLab;

@property (strong, nonatomic) UILabel *groupInfoTitleLab;

@property (strong, nonatomic) UILabel *groupInfoIdLab;

@property (strong, nonatomic) UIImageView *userInfoIcon;

@property (strong, nonatomic) UILabel *addTime_f_Lab;

@property (strong, nonatomic) UILabel *unameLab;

//用来加载界面数据的方法
-(void)loadingDataMethod:(HeaderViewModel *)model;

@end
