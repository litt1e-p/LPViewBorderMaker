//
//  UIView+Border.m
//  LPViewBorderMakerSample
//
//  Created by litt1e-p on 16/6/28.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "UIView+Border.h"

#define kLPPositionAll @[@(LPBorderPositionTop), @(LPBorderPositionLeft), @(LPBorderPositionBottom), @(LPBorderPositionRight)]
#define kLPDefaultBorderColor [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:0.5]

@implementation UIView (Border)

- (void)makeBorders
{
    [self makeBordersWithWidth:1.0 color:kLPDefaultBorderColor position:LPBorderPositionAll];
}

- (void)makeBordersWithWidth:(float)width color:(UIColor *)color position:(LPBorderPosition)position
{
    NSMutableArray *positions = [NSMutableArray array];
    if (position & LPBorderPositionTop) {
        [positions addObject:@(LPBorderPositionTop)];
    }
    if (position & LPBorderPositionRight) {
        [positions addObject:@(LPBorderPositionRight)];
    }
    if (position & LPBorderPositionBottom) {
        [positions addObject:@(LPBorderPositionBottom)];
    }
    if (position & LPBorderPositionLeft) {
        [positions addObject:@(LPBorderPositionLeft)];
    }
    [self createViewBordersWithWidth:width color:color positions:positions];
}

- (void)makeBordersWithWidth:(float)width color:(UIColor *)color positions:(NSArray *)positions
{
    NSMutableDictionary *directionDict = [[NSMutableDictionary alloc] init];
    for (NSNumber *pos in positions) {
        if ([kLPPositionAll containsObject:pos]) {
            [directionDict setObject:@1 forKey:pos];
        }
    }
    if ([directionDict allKeys].count > 0) {
        [self createViewBordersWithWidth:width color:color positions:[directionDict allKeys]];
    }
}

- (UIView *)createViewBordersWithWidth:(float)width color:(UIColor *)color positions:(NSArray *)positions
{
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
        [self.layer insertSublayer:borderLayer atIndex:0];
    }
    return self;
}

@end
