//
//  TableViewController.m
//  AutoLayoutDemo
//
//  Created by Han on 15-3-30.
//  Copyright (c) 2015年 IPingLun. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () {

    NSArray *mData;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
    mData = [NSArray arrayWithObjects:@"体育总局：反对一些地方用足球替代其他体育项目", @"专家：发展校园足球不能一刀切", @"这次足球改革方案，14次提到了校园足球，明确要把校园足球作为扩大足球人口规模，夯实足球人才根基的基础性工程。方案指出，全国中小学校园足球特色学校，在现在5000多所的基础上，2025年要达到5万所，校园足球迎来了从未有过的发展机遇。", nil]; 
    
    
    UITableView *tableView = UITableView.new;
    tableView.delegate = self;
    tableView.dataSource = self;
    //[tableView setBackgroundColor:[UIColor grayColor]];
    [tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:tableView];
    
    
    NSArray *constraints1 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"H:|-[tableView]-|"
                             options:0
                             metrics:nil
                             views:NSDictionaryOfVariableBindings(tableView)];
    
    
    NSArray *constraints2 = [NSLayoutConstraint
                             constraintsWithVisualFormat:@"V:|-10-[tableView]-10-|"
                             options:0
                             metrics:nil
                             views:NSDictionaryOfVariableBindings(tableView)];
    
    [self.view addConstraints:constraints1];
    [self.view addConstraints:constraints2];
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString * CellIdentifier = @"TableViewCell";
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:CellIdentifier];
    }
    

    cell.mLabel.text = [mData objectAtIndex:(NSUInteger)indexPath.row];
    NSLog(@"%@", [mData objectAtIndex:(NSUInteger)indexPath.row]);
    
    return cell;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return mData.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
