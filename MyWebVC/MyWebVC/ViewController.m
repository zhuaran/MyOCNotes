//
//  ViewController.m
//  MyWebVC
//
//  Created by macbook on 2018/3/27.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "Utils.h"
#import "AppDelegate.h"
@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *myweb;
    WKWebView *mywkWeb;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.screenRotate = ScreenAllRotate;
//    if (![Utils isOrientationLandscape]) {
//        [Utils forceOrientation:UIInterfaceOrientationLandscapeLeft];
//    }
//    myweb = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
//    myweb.delegate = self;
//    [myweb setScalesPageToFit:YES];
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html" inDirectory:@"web"];
//    [myweb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
//    [self.view addSubview:myweb];
    
    mywkWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"简书App适配iOS 11 - 简书" ofType:@"html" inDirectory:@"web"];
    [mywkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    [self.view addSubview:mywkWeb];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
