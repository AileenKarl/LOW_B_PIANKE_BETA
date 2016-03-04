//
//  DetailVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/4.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "DetailVC.h"
#import "HttpTool.h"
#import "NSString+ChangeHtmlString.h"
#import "HeaderViewModel.h"
#import "DetailHeaderView.h"

@interface DetailVC ()<UIWebViewDelegate>

@property (copy, nonatomic) NSString *contentId;

@property (copy, nonatomic) NSString *htmlStr;

@property (strong, nonatomic) UIScrollView *mainScrollView;

@property (strong, nonatomic) DetailHeaderView *headrerView;

@property (strong, nonatomic) UIWebView *detailWebView;

@property (strong, nonatomic) HeaderViewModel *headerViewModel;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self sendHttpRequestHere];
}

-(void)initWithId:(NSString *)contentId{
    
    self.contentId = contentId;
    
}

-(void)sendHttpRequestHere{
    
    //    进入详情界面，直接发起网络请求
    [HttpTool postWithPath:@"group/posts_info"
                    params:@{@"contentid":self.contentId,
                             @"client"   :@"2"}
                   success:^(id JSON) {
                       
                       NSDictionary *allDataDic = JSON;
                       allDataDic = JSON[@"data"];
                       NSDictionary *postsInfoDic = allDataDic[@"postsinfo"];
                       self.htmlStr = postsInfoDic[@"html"];
                       
                       self.headerViewModel = [[HeaderViewModel alloc] initWithDictionary:postsInfoDic];
                       
                       [self.view           addSubview:self.mainScrollView];
                       [self.mainScrollView addSubview:self.headrerView];
                       [self.mainScrollView addSubview:self.detailWebView];
                       
                   } failure:^(NSError *error) {
                       ;
                   }];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //获取页面高度（像素）
    NSString * clientheight_str = [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    float clientheight = [clientheight_str floatValue];
    //设置到WebView上
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, clientheight);
    //获取WebView最佳尺寸（点）
    CGSize frame = [webView sizeThatFits:webView.frame.size];
    //获取内容实际高度（像素）
    NSString * height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('webview_content_wrapper').offsetHeight + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-top'))  + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-bottom'))"];
    float height = [height_str floatValue];
    //内容实际高度（像素）* 点和像素的比
    height = height * frame.height / clientheight;
    //再次设置WebView高度（点）
    webView.frame = CGRectMake(5, 180, [UIScreen mainScreen].bounds.size.width - 10, height);

    self.mainScrollView.contentSize = CGSizeMake( 0, webView.frame.size.height + self.headrerView.frame.size.height + 64);
    
//    WebView高度适配
    
////    将webview从不可见变成可见
//    CGRect rect      = webView.frame;
//    rect.size.height = 1;
//    webView.frame    = rect;
//   适配webview到内容长度
//    rect.size.height = webView.scrollView.contentSize.height;
//    webView.frame    = rect;
    
}

-(UIScrollView *)mainScrollView{
    
    if (!_mainScrollView) {
        
        _mainScrollView             = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                                     [UIScreen mainScreen].bounds.size.width,
                                                                                     [UIScreen mainScreen].bounds.size.height)];
//        _mainScrollView.contentSize = CGSizeMake(0, 10000);
        
//        _mainScrollView.bounces = 
        
    }
    return _mainScrollView;
    
}

-(DetailHeaderView *)headrerView{
    
    if (!_headrerView) {
        
        _headrerView                   = [[DetailHeaderView alloc] initWithFrame:CGRectMake(0, 0,
                                                                                  [UIScreen mainScreen].bounds.size.width,
                                                                                  180)];
        _headrerView.backgroundColor = [UIColor clearColor];
        
        [_headrerView loadingDataMethod:self.headerViewModel];
        
    }
    return _headrerView;
}

-(UIWebView *)detailWebView{
    
    if (!_detailWebView) {
        
        _detailWebView          = [[UIWebView alloc] initWithFrame:CGRectMake(5, 180,
                                                                              [UIScreen mainScreen].bounds.size.width - 10,
                                                                              0)];
        _detailWebView.delegate = self;
//        处理字符串
        self.htmlStr = [NSString getHtmlString:self.htmlStr];
        
        
        self.htmlStr = [NSString stringWithFormat:@"<div id=\"webview_content_wrapper\">%@</div>", self.htmlStr];
        
        
//        加载网页内容
       [_detailWebView loadHTMLString:self.htmlStr
                               baseURL:nil];
        
    }
    return _detailWebView;
}
@end
