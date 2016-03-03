//
//  GoodProductsTableViewCell.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "GoodProductsTableViewCell.h"
#import "BuyVC.h"


@implementation GoodProductsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.coverimgView];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.buyBtn];
        
        
        ///定义在cell内部的购买界面跳转操作关联
//        [self.buyBtn addTarget:self
//                        action:@selector(changeToBuyView)
//              forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}

///定义在cell内部的购买界面跳转操作方法
-(void)changeToBuyView{
    
    BuyVC *buyView = [[BuyVC alloc] init];
    buyView.urlString = self.urlStr;
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [nav pushViewController:buyView
                   animated:YES];
    
}


-(void)loadingDataWithModel:(GoodProductsListModel *)listModel{
    
    [_coverimgView  downloadImage:listModel.coverimg
                            place:[UIImage imageNamed:@"defaultCover"]];
    [_titleLab setText:listModel.title];
    _urlStr = listModel.buyurl;
}

-(UIImageView *)coverimgView{
    
    if (!_coverimgView) {
        
        _coverimgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width - 10, 150)];
        _coverimgView.backgroundColor = [UIColor clearColor];
        
    }
    return _coverimgView;
    
}

-(UILabel *)titleLab{
    
    if (!_titleLab) {
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 165, [UIScreen mainScreen].bounds.size.width - 40, 20)];
        _titleLab.backgroundColor = [UIColor clearColor];
        [_titleLab setFont:[UIFont systemFontOfSize:15]];
        _titleLab.text = @"loading ...";
        
    }
    return _titleLab;
    
}

-(UIButton *)buyBtn{
    
    if (!_buyBtn) {
        _buyBtn = [[UIButton alloc] initWithFrame:CGRectMake( self.frame.size.width, 165, 65, 25)];
        [_buyBtn setTitle:@"购买" forState:UIControlStateNormal];
        [_buyBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        _buyBtn.backgroundColor = [UIColor grayColor];
        _buyBtn.clipsToBounds = YES;
        _buyBtn.layer.cornerRadius = 7;
    }
    
    return _buyBtn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
