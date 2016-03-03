//
//  LoadingView.m
//  iOS_KarlLoadingView
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()

@property (strong, nonatomic) UIImageView *loadingView;

@property (strong, nonatomic) UILabel *toastLabel;

@end

@implementation LoadingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.loadingView];
        [self addSubview:self.toastLabel];
        
           }
    return self;
}

///要把LoadingView加载到哪个界面上
+(void)showKarlLoadingViewFromSuperView:(UIView *)superView{
 
    [self showKarlLoadingViewFromSuperView:superView offset:0];
    
}

//要把LoadingView从哪个界面上移除
+(void)removeKarlLoadingViewFromSuperView:(UIView *)superView{
 
    for (UIView *tempView in superView.subviews) {
        
        if ([tempView isKindOfClass:[LoadingView class]]) {
         
            [tempView removeFromSuperview];
            
        }
    }
}

///要把LoadingView加载到哪个界面的什么具体位置
+(void)showKarlLoadingViewFromSuperView:(UIView *)superView offset:(CGFloat)offsetY{
    
    LoadingView *karlLoadingView = [[LoadingView alloc] init];
    karlLoadingView.frame = CGRectMake( [UIScreen mainScreen].bounds.size.width/2 - 40,
                                        [UIScreen mainScreen].bounds.size.height/2- 40 + offsetY,
                                        60,
                                        80);
    

    
//    判断superView上是否存在一个LoadView
//    如果存在，先删除。而后加载新的View
    [self removeKarlLoadingViewFromSuperView:superView];
    
    [superView addSubview:karlLoadingView];
//    让动态图动起来
    [karlLoadingView.loadingView startAnimating];
}

-(NSArray *)getImageArr{
    
//    获取图片数组
    NSMutableArray *imageNameArr = [NSMutableArray array];
    
    for (int i = 1; i < 16; i++) {
        
        NSString *imageName;
        
        if (i < 10) {
            
            imageName = [NSString stringWithFormat:@"loading_animate_0%d",i];
            
        }else{
            imageName = [NSString stringWithFormat:@"loading_animate_%d",i];
        }
        
        [imageNameArr addObject:imageName];
        
    }
    
    
    NSMutableArray *imageArr = [NSMutableArray array];
    
    for (int i = 0; i < 15; i++) {
        
        NSString *imageName = [imageNameArr objectAtIndex:i];
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        [imageArr addObject:image];
        
    }
    NSLog(@"%@",imageArr);
    
    return imageArr;

}


-(UIImageView *)loadingView{
    
    if (!_loadingView) {
        
        _loadingView                      = [[UIImageView alloc] init];
        _loadingView.frame                = CGRectMake(0, 0, 60, 60);
        _loadingView.backgroundColor      = [UIColor clearColor];
        _loadingView.animationImages      = [self getImageArr];
        _loadingView.animationDuration    = 2.0;
        _loadingView.animationRepeatCount = 0;
        
    }
    return _loadingView;
    
}

-(UILabel *)toastLabel{
    
    if (!_toastLabel) {
        
        _toastLabel = [[UILabel alloc] init];
        _toastLabel.frame = CGRectMake(0, 60, 60, 30);
        _toastLabel.text = @"片刻即来";
        _toastLabel.font = [UIFont systemFontOfSize:10];
        _toastLabel.backgroundColor = [UIColor clearColor];
        
    }
    return _toastLabel;
    
}
@end
