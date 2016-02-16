//
//  UIView+Border.h
//  LPViewBorderMaker
//
//  Created by litt1e-p on 16/2/14.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LPBorderPosition)
{
    LPBorderPositionAll,
    LPBorderPositionTop,
    LPBorderPositionLeft,
    LPBorderPositionBottom,
    LPBorderPositionRight
};

@interface UIView (Border)

- (void)makeBorders;
- (void)makeBordersWithWidth:(float)width color:(UIColor *)color position:(LPBorderPosition)position;
- (void)makeBordersWithWidth:(float)width color:(UIColor *)color positions:(NSArray *)positions;

@end
