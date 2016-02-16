//
//  UIView+Border.m
//  LPViewBorderMaker
//
//  Created by litt1e-p on 16/2/14.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "UIView+Border.h"
#import <QuartzCore/QuartzCore.h>

#define kPositionAll @[@(LPBorderPositionTop), @(LPBorderPositionLeft), @(LPBorderPositionBottom), @(LPBorderPositionRight)]
#define kDefaultBorderColor [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:0.5]

@implementation UIView (Border)


- (void)makeBorders
{
    UIView *border = [self createBordersWithWidth:1 color:kDefaultBorderColor positions:[kPositionAll copy]];
    [self addSubview:border];
}

- (void)makeBordersWithWidth:(float)width color:(UIColor *)color position:(LPBorderPosition)position
{
    NSArray *positions = [NSArray array];
    if (position == LPBorderPositionAll) {
        positions = [kPositionAll copy];
    } else {
        positions = @[@(position)];
    }
    UIView *border = [self createBordersWithWidth:width color:color positions:positions];
    [self addSubview:border];
}

- (void)makeBordersWithWidth:(float)width color:(UIColor *)color positions:(NSArray *)positions
{
    NSMutableDictionary *directionDict = [[NSMutableDictionary alloc] init];
    for (NSNumber *pos in positions) {
        if ([kPositionAll containsObject:pos]) {
            [directionDict setObject:@1 forKey:pos];
        }
    }
    if ([directionDict allKeys].count > 0) {
        UIView *border = [self createBordersWithWidth:width color:color positions:[directionDict allKeys]];
        [self addSubview:border];
    }
}

- (UIView *)createBordersWithWidth:(float)width color:(UIColor *)color positions:(NSArray *)positions
{
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    borderView.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i < positions.count; i++) {
        CAGradientLayer *borderLayer = [CAGradientLayer layer];
        LPBorderPosition position = (LPBorderPosition)[positions[i] integerValue];
        switch (position) {
            case LPBorderPositionTop:
                [borderLayer setStartPoint:CGPointMake(0.5, 0.0)];
                [borderLayer setEndPoint:CGPointMake(0.5, 1.0)];
                borderLayer.frame = CGRectMake(0, 0, self.bounds.size.width, width);
                break;
                
            case LPBorderPositionBottom:
                [borderLayer setStartPoint:CGPointMake(0.5, 1.0)];
                [borderLayer setEndPoint:CGPointMake(0.5, 0.0)];
                borderLayer.frame = CGRectMake(0, self.bounds.size.height - width, self.bounds.size.width, width);
                break;
                
            case LPBorderPositionLeft:
                borderLayer.frame = CGRectMake(0, 0, width, self.bounds.size.height);
                [borderLayer setStartPoint:CGPointMake(0.0, 0.5)];
                [borderLayer setEndPoint:CGPointMake(1.0, 0.5)];
                break;
                
            case LPBorderPositionRight:
                borderLayer.frame = CGRectMake(self.bounds.size.width - width, 0, width, self.bounds.size.height);
                [borderLayer setStartPoint:CGPointMake(1.0, 0.5)];
                [borderLayer setEndPoint:CGPointMake(0.0, 0.5)];
                break;
                
            default:
                break;
        }
        borderLayer.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
        [borderView.layer insertSublayer:borderLayer atIndex:0];
    }
    return borderView;
}

@end
