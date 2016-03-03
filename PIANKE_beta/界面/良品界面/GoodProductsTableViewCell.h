//
//  GoodProductsTableViewCell.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodProductsListModel.h"
#import "UIImageView+SDWedImage.h"

@interface GoodProductsTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *coverimgView;
@property (strong, nonatomic) UILabel *titleLab;
@property (strong, nonatomic) UIButton *buyBtn;

-(void)loadingDataWithModel:(GoodProductsListModel *)listModel;

@end
