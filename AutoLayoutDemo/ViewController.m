//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by Han on 15-3-29.
//  Copyright (c) 2015年 IPingLun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    UIButton *buttonWidget = UIButton.new;
    [buttonWidget setTitle:@"控件示例" forState:UIControlStateNormal];
    [buttonWidget setBackgroundColor:[UIColor grayColor]];
    //[buttonTableView sizeToFit];
    [buttonWidget setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonWidget addTarget:self action:@selector(jumpToWidgetDemo) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonWidget];
    
    
    NSArray *constraints1 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"H:|-50-[buttonWidget]-50-|"
                             options:0
                             metrics:nil
                             views:NSDictionaryOfVariableBindings(buttonWidget)];
    
    
    NSArray *constraints2 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"V:|-20-[buttonWidget(==20)]"
                             options:0
                             metrics:nil
                             views:NSDictionaryOfVariableBindings(buttonWidget)];
    
    [self.view addConstraints:constraints1];
    [self.view addConstraints:constraints2];
    
    
    
    UIButton *buttonWebView = UIButton.new;
    [buttonWebView setTitle:@"ScrollView+WebView示例" forState:UIControlStateNormal];
    [buttonWebView setBackgroundColor:[UIColor grayColor]];
    [buttonWebView setTranslatesAutoresizingMaskIntoConstraints:NO];//将使用AutoLayout的方式来布局
    [buttonWebView addTarget:self action:@selector(jumpToWebViewDemo) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonWebView];
    
    
    
    NSArray *constraints3 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"H:|-50-[buttonWebView]-50-|"
                             options:0
                             metrics:nil
                             views:NSDictionaryOfVariableBindings(buttonWebView)];
    
    NSArray *constraints4 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"V:[buttonWidget]-30-[buttonWebView(==height)]"
                             options:0
                             metrics:@{@"height":@20}
                             views:NSDictionaryOfVariableBindings(buttonWebView, buttonWidget)];
    

    [self.view addConstraints:constraints3];
    [self.view addConstraints:constraints4];
    
    
    
    
    UIButton *buttonTableView = UIButton.new;
    [buttonTableView setTitle:@"TableView示例" forState:UIControlStateNormal];
    [buttonTableView setBackgroundColor:[UIColor grayColor]];
    [buttonTableView setTranslatesAutoresizingMaskIntoConstraints:NO];//将使用AutoLayout的方式来布局
    [buttonTableView addTarget:self action:@selector(jumpToTableViewDemo) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonTableView];
    
    
    //等宽
    NSArray *constraints5 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"H:|-50-[buttonTableView(buttonWebView)]"
                             options:NSLayoutFormatAlignAllLeft
                             metrics:nil
                             views:NSDictionaryOfVariableBindings(buttonTableView, buttonWebView)];
    //等高
    NSArray *constraints6 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"V:[buttonWebView]-30-[buttonTableView(buttonWebView)]"
                             options:0
                             metrics:nil
                             views:NSDictionaryOfVariableBindings(buttonTableView, buttonWebView)];
    
    [self.view addConstraints:constraints5];
    [self.view addConstraints:constraints6];
    
    
    
    /*
     
     

     
     
     
     
    //实例化Button
    UIButton *button1 = [[UIButton alloc] initWithFrame:(CGRectZero)];//这里不再需要去刻意指定x.y等坐标.
    [button1 setTitle:@"点击3333" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 sizeToFit];
    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];//将使用AutoLayout的方式来布局
    [self.view addSubview:button1];
    
    
    //创建了一个水平居中父视图的约束
    NSLayoutConstraint *constraint = [
                                      NSLayoutConstraint
                                      constraintWithItem:button1
                                      attribute:NSLayoutAttributeCenterX
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeCenterX
                                      multiplier:1.0f
                                      constant:00.0f
                                      ];
    
    [self.view addConstraint:constraint];//将约束添加到对应的父视图中
    
    
    //继续创建了一个位于父视图底部相隔20距离的约束
    constraint = [
                  NSLayoutConstraint
                  constraintWithItem:button1
                  attribute:NSLayoutAttributeBottom
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeBottom
                  multiplier:1.0f
                  constant:-20.0f
                  ];
    
    [self.view addConstraint:constraint];
     
    
    UIView *myview = [[UIView alloc] init];
    
    myview.backgroundColor = [UIColor greenColor];
    
    UIView *redView = [[UIView alloc] init];
    
    redView.backgroundColor = [UIColor redColor];
    
    UIView *blueView = [[UIView alloc] init];
    
    blueView.backgroundColor = [UIColor blueColor];
    
    [myview addSubview:redView];
    
    [myview addSubview:blueView];
    
    [myview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSMutableArray *tmpConstraints = [NSMutableArray array];
    
    [tmpConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-50-[redView(==100)]-30-[blueView(==100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(redView,blueView)]];
    
    [tmpConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(redView)]];
    
    [tmpConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[blueView(==redView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(blueView,redView)]];
    
    [myview addConstraints:tmpConstraints];
    
    [self.view addSubview: myview];
    
    */
}


- (void)jumpToWidgetDemo {
    WidgetViewController *widgetView = [[WidgetViewController alloc] init];
    [self.navigationController pushViewController:widgetView animated:YES];
}

- (void)jumpToWebViewDemo {
    WebViewController *webView = [[WebViewController alloc] init];
    [self.navigationController pushViewController:webView animated:YES];
}

- (void)jumpToTableViewDemo {
    TableViewController *tableView = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
