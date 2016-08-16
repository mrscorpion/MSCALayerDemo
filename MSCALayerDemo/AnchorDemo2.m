//
//  AnchorDemo2.m
//  MSCALayerDemo
//
//  Created by mr.scorpion on 16/8/16.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "AnchorDemo2.h"

@interface AnchorDemo2 ()
{
    CALayer *showLayer;
    CALayer *anchorPointLayer;
    CALayer *touchPointLayer;
}
@end

@implementation AnchorDemo2
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSizeView];
    [self addShowLayer];
    [self addAnchorPointLayer];
    
    UITapGestureRecognizer *singleTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    singleTwo.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:singleTwo];
}
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



//添加标尺图背景
- (void)addSizeView
{
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:self.view.frame];
    bgView.image = [UIImage imageNamed:@"bgView"];
    [self.view addSubview:bgView];
}

//添加测试的 图层
- (void)addShowLayer
{
    showLayer = [[CALayer alloc] init];
    showLayer.backgroundColor = [UIColor brownColor].CGColor;
    showLayer.bounds = CGRectMake(0, 0, 100, 100);
    showLayer.position = self.view.center;
    showLayer.opacity = 0.7;
    showLayer.anchorPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:showLayer];
    
    NSLog(@"showLayer的锚点：%f %f",showLayer.anchorPoint.x,showLayer.anchorPoint.y);
}

//锚点的layer
- (void)addAnchorPointLayer
{
    anchorPointLayer = [[CALayer alloc]init];
    anchorPointLayer.backgroundColor = [UIColor redColor].CGColor;
    anchorPointLayer.bounds = CGRectMake(0, 0, 10, 10);
    anchorPointLayer.position = CGPointMake(showLayer.bounds.size.width*showLayer.anchorPoint.x, showLayer.bounds.size.height*showLayer.anchorPoint.y);
    anchorPointLayer.cornerRadius = 10/2;
    [showLayer addSublayer:anchorPointLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touchPointLayer) {
        [touchPointLayer removeFromSuperlayer];
    }
    touchPointLayer = [[CALayer alloc] init];
    touchPointLayer.bounds = CGRectMake(0, 0, 10, 10);
    touchPointLayer.position = [touch locationInView:self.view];
    touchPointLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:touchPointLayer];
    
    
    
    CGFloat x = [touch locationInView:self.view].x/self.view.bounds.size.width;
    CGFloat y = [touch locationInView:self.view].y/self.view.bounds.size.height;
    NSLog(@"x:%f y:%f",x,y);
    
    showLayer.anchorPoint = CGPointMake(x, y);
    anchorPointLayer.position = CGPointMake(showLayer.bounds.size.width*showLayer.anchorPoint.x, showLayer.bounds.size.height*showLayer.anchorPoint.y);
    
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //    animation.toValue = [NSNumber numberWithFloat:90];
    //    animation.duration = 3;
    //    animation.repeatCount = 1;
    //    [showLayer addAnimation:animation forKey:@"..."];
    
    showLayer.transform = CATransform3DMakeRotation(90, 0, 0, 1);
    //    showLayer.position = [touch locationInView:self.view];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    showLayer.transform = CATransform3DIdentity;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
