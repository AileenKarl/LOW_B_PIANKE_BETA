//
//  HeaderViewModel.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/4.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeaderViewModel : NSObject

@property (copy, nonatomic) NSString *title;

@property (strong, nonatomic) NSString *titleLabText;

@property (strong, nonatomic) NSString *groupInfoTitleLabText;


@property (strong, nonatomic) UIImage *userInfoIconImage;

@property (strong, nonatomic) NSString *addTime_f_LabText;

@property (strong, nonatomic) NSString *unameLabText;


-(instancetype) initWithDictionary:(NSDictionary *)dic;

@end
