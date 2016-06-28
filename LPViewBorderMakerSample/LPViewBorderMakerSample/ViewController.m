//
//  ViewController.m
//  LPViewBorderMakerSample
//
//  Created by litt1e-p on 16/2/14.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Border.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeNewBorders];
}

- (void)makeNewBorders
{
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [v1 makeBorders];
    [self.view addSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(50, 180, 100, 100)];
    [v2 makeBordersWithWidth:5.0 color:[UIColor brownColor] position:LPBorderPositionBottom];
    [self.view addSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(150, 170, 100, 70)];
    [v3 makeBordersWithWidth:0.5 color:[UIColor redColor] position:LPBorderPositionBottom|LPBorderPositionRight|LPBorderPositionLeft];
    [self.view addSubview:v3];

    UIView *v4 = [[UIView alloc] initWithFrame:CGRectMake(50, 330, 300, 50)];
    [v4 makeBordersWithWidth:1 color:[UIColor greenColor] positions:@[@(LPBorderPositionBottom), @(LPBorderPositionTop)]];
    [self.view addSubview:v4];

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 400, 300, 80);
    [btn1 setTitle:@"Button" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn1 makeBorders];
    [self.view addSubview:btn1];
    
}

//- (void)makeOldBorders
//{
//    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
//    [v1 makeBorders];
//    [self.view addSubview:v1];
//    
//    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(50, 180, 100, 100)];
//    [v2 makeBordersWithWidth:5.0 color:[UIColor brownColor] position:LPBorderPositionBottom];
//    [self.view addSubview:v2];
//    
//    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(150, 170, 100, 70)];
//    [v3 makeBordersWithWidth:0.5 color:[UIColor redColor] positions:@[@(LPBorderPositionBottom), @(LPBorderPositionRight), @(LPBorderPositionLeft)]];
//    [self.view addSubview:v3];
//    
//    UIView *v4 = [[UIView alloc] initWithFrame:CGRectMake(50, 330, 300, 50)];
//    [v4 makeBordersWithWidth:1 color:[UIColor greenColor] positions:@[@(LPBorderPositionBottom), @(LPBorderPositionTop)]];
//    [self.view addSubview:v4];
//    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.frame = CGRectMake(50, 400, 300, 80);
//    [btn1 setTitle:@"Button" forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    [btn1 makeBorders];
//    [self.view addSubview:btn1];
//
//}

@end
