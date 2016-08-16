//
//  ViewController.m
//  MSCALayerDemo
//
//  Created by mr.scorpion on 16/8/16.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ViewController.h"
#import "AnchorDemo1.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@end

@implementation ViewController
- (void)viewDidLoad
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
