//
//  WidgetViewController.m
//  AutoLayoutDemo
//
//  Created by Han on 15-3-29.
//  Copyright (c) 2015年 IPingLun. All rights reserved.
//

#import "WidgetViewController.h"

@interface WidgetViewController ()

@end

@implementation WidgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UIView *bgView = UIView.new;
    bgView.backgroundColor = [UIColor grayColor];
    bgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bgView];
    
    
    
    
    UILabel *labelOne = UILabel.new;
    labelOne.translatesAutoresizingMaskIntoConstraints = NO;
    labelOne.text = @"为了实现上述效果，我们只需要先初始化这些控件";
    labelOne.numberOfLines = 0;
    labelOne.backgroundColor = [UIColor redColor];
    [bgView addSubview:labelOne];
    
    UILabel *labelTwo = UILabel.new;
    labelTwo.translatesAutoresizingMaskIntoConstraints = NO;
    labelTwo.text = @"哈哈哈";
    labelTwo.backgroundColor = [UIColor greenColor];
    [bgView addSubview:labelTwo];
    
    UIImageView *imageView = UIImageView.new;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:imageView];
    
    UIButton *button = UIButton.new;
    button.backgroundColor = [UIColor blueColor];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [bgView addSubview:button];
    
    
    
    NSDictionary *views = NSDictionaryOfVariableBindings(bgView,labelOne,labelTwo,imageView,button);
    NSDictionary *metrics = @{@"imageEdge":@150.0, @"padding":@30.0};//设置一些常量
    
    //设置bgView与superview左右对齐
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bgView]|" options:0 metrics:metrics views:views]];
    
    // 设置bgView与superview 上边界对齐
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[bgView]-100-|" options:0 metrics:metrics views:views]];
    
    
    // labelOne与imageview 的水平约束
    [bgView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[labelOne]-padding-[imageView(imageEdge)]-padding-|" options:0 metrics:metrics views:views]];
    
    // labelOne与labelTwo的竖直约束
    [bgView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[labelOne]->=0-[labelTwo]-padding-|" options:NSLayoutFormatAlignAllLeft metrics:metrics views:views]];
    
    //imageView与button的数直约束
    [bgView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[imageView(imageEdge)]->=padding-[button]-padding-|" options:NSLayoutFormatAlignAllLeft|NSLayoutFormatAlignAllRight  metrics:metrics views:views]];
    
    
    
    
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
