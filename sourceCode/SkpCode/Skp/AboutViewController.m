//
//  AboutViewController.m
//  Skp
//
//  Created by 剑锋 莫 on 16/3/11.
//  Copyright © 2016年 剑锋 莫. All rights reserved.
//

#import "AboutViewController.h"
#import "PKRevealController.h"

@interface AboutViewController ()<UIWebViewDelegate>
@property(nonatomic,retain) UIWebView *webView;
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"About Us"];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];
    UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftmenu"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
    self.navigationItem.leftBarButtonItem = btnLeft;
    
    
    _webView   =  [[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
    [self.view addSubview:_webView];
    
    NSString * path = [[NSBundle mainBundle] bundlePath];
    NSURL * baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString * htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:(NSUTF8StringEncoding) error:nil];
    _webView.delegate  = self;
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按钮点击事件
- (void) showLeftView {
    PKRevealController *revealController = self.parentViewController.parentViewController.revealController;
    [revealController showViewController:revealController.leftViewController];
    
}

// Objective-C 语言
- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    NSURL * url = [request URL];
    if ([[url scheme] isEqualToString:@"gap"])
    {
        // 在这里做 js 调 native 的事情
        // ....
        // 做完之后用如下方法调回 js
        [webView stringByEvaluatingJavaScriptFromString:@"alert('done')"];
        return NO;
    }
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
