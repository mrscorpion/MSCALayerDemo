//
//  AnchorDemo1.m
//  MSCALayerDemo
//
//  Created by mr.scorpion on 16/8/16.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "AnchorDemo1.h"
#import "AnchorDemo2.h"

@interface AnchorDemo1 ()
{
    CALayer *layer;
}
@property (nonatomic,strong)CALayer *pointLayer;
@end

@implementation AnchorDemo1

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor colorWithRed:1.000 green:0.607 blue:0.468 alpha:1.000].CGColor;
    [self.view.layer addSublayer:layer];
    
    
    UITapGestureRecognizer *singleTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toNext)];
    singleTwo.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:singleTwo];
}
- (void)toNext
{
    [self presentViewController:[[AnchorDemo2 alloc] init] animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGFloat width = CGRectGetWidth(layer.bounds) != 100 ? 100 : 25;
    layer.bounds = CGRectMake(0, 0, width, width);
    
    layer.cornerRadius = layer.cornerRadius != 50 ? 50 : 0;
    layer.position = [touch locationInView:self.view];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
