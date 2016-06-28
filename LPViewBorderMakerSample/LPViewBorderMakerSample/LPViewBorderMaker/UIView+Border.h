//
//  UIView+Border.h
//  LPViewBorderMakerSample
//
//  Created by litt1e-p on 16/6/28.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, LPBorderPosition)
{
    LPBorderPositionNone   = 0,
    LPBorderPositionTop    = 1 << 0,
    LPBorderPositionLeft   = 1 << 1,
    LPBorderPositionBottom = 1 << 2,
    LPBorderPositionRight  = 1 << 3,
    LPBorderPositionAll    = LPBorderPositionTop | LPBorderPositionLeft | LPBorderPositionBottom | LPBorderPositionRight
};

@interface UIView (Border)

- (void)makeBorders;
- (void)makeBordersWithWidth:(float)width color:(UIColor *)color position:(LPBorderPosition)position;
- (void)makeBordersWithWidth:(float)width color:(UIColor *)color positions:(NSArray *)positions NS_DEPRECATED_IOS(2_0, 6_0, "Use makeBordersWithWidth:color:postion: instead");

@end
