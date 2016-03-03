//
//  BuyVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "BuyVC.h"

@interface BuyVC ()

@end

@implementation BuyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *buyUrl = [NSURL URLWithString:self.urlString];
    NSURLRequest *buyRequest = [NSURLRequest requestWithURL:buyUrl];
    
    self.buyWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.buyWebView loadRequest:buyRequest];

    [self.view addSubview:self.buyWebView];
}

@end
