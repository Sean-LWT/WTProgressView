//
//  ViewController.m
//  ProgressView
//
//  Created by Tousan on 16/5/25.
//  Copyright © 2016年 李伟彤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ProgressView";
    
    UITableView* bgTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    bgTableView.delegate = self;
    bgTableView.dataSource = self;
    [self.view addSubview:bgTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        WTProgressView* progressView = [WTProgressView new];
        [cell.contentView addSubview:progressView];
        progressView.gradientColors = @[[UIColor orangeColor], [UIColor yellowColor]];
        progressView.progress = 0;
        progressView.frame = CGRectMake(20, 35, 200, 10);
        progressView.layer.borderColor = [UIColor orangeColor].CGColor;
        progressView.layer.borderWidth = 1.0;
        progressView.backgroundColor = [UIColor whiteColor];
        progressView.layer.cornerRadius = 5.0;
        progressView.tag = 1;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTProgressView* progressView = [cell.contentView viewWithTag:1];
    progressView.progress = indexPath.row/20.0;
}

@end
