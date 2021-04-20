//
//  WebViewController.m
//  AutoLayoutDemo
//
//  Created by Han on 15-3-30.
//  Copyright (c) 2015年 IPingLun. All rights reserved.
//

#import "WebViewController.h"

#define MAIN_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define MAIN_SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

@interface WebViewController () {
    UIWebView *mWebView;
    NSArray *mConstraint;
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    mWebView = UIWebView.new;
    //webView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 0);
    mWebView.backgroundColor = [UIColor grayColor];
    mWebView.delegate = self;
    mWebView.translatesAutoresizingMaskIntoConstraints = NO;
    mWebView.opaque = NO;
    [self.view addSubview:mWebView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mWebView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mWebView)]];
    
    mConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mWebView(==0)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mWebView)];
    
    [self.view addConstraints:mConstraint];
    
    UILabel *label = UILabel.new;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = @"哈哈哈";
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[mWebView]-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label, mWebView)]];
    
    
    
    NSString *webviewText = @"<style>body{padding:8; top:0; margin:0; background-color:transparent;}</style>";
    NSString *htmlString = [webviewText stringByAppendingFormat:@"%@", @"字典为对象提供了一种确定的键/值对联系的方案。当要将一个对象与一个关键字关联在一起的时候可以用到这种数据结构。其实就像每个人都有自己的名字，人本身就是这里的对象，而名字就是这里的关键字。假设世上没有同名同姓的人，而且每个人有且仅有一个名字，那么任意一个人都可以通过名字找到。在这里，把这种处理键/值对的数据结构叫做字典，每一个字典都由若干对键/值对组成。与数组一样，字典也有一个子类叫可变字典，顾名思义就是可以增加、减少键/值对的字典。字典的结构如图2-4所示。"];
    
    [mWebView loadHTMLString:htmlString baseURL:nil];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *height= [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    
    NSLog(@"height: %@", height);
    
    NSDictionary *metrics = [NSDictionary dictionaryWithObjectsAndKeys: height, @"height", nil];

    
    [self.view removeConstraints:mConstraint];
    
    mConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mWebView(==height)]" options:0 metrics:metrics views:NSDictionaryOfVariableBindings(mWebView)];
    [self.view addConstraints:mConstraint];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
