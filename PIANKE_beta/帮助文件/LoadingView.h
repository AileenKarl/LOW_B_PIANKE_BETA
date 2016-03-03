//
//  LoadingView.h
//  iOS_KarlLoadingView
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

//要把LoadingView加载到哪个界面上
+(void)showKarlLoadingViewFromSuperView:(UIView *)superView;
//要把LoadingView从哪个界面上移除
+(void)removeKarlLoadingViewFromSuperView:(UIView *)superView;
//要把LoadingView加载到哪个界面的什么具体位置
+(void)showKarlLoadingViewFromSuperView:(UIView *)superView offset:(CGFloat)centerY;

@end
