//
//  UIColor+ColorGradient.m
//  MumMum-Customer
//
//  Created by shlity on 17/6/29.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//  两个颜色之间的渐变

#import "UIColor+ColorGradient.h"

@implementation UIColor (ColorGradient)

+ (UIColor *)qmui_colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor progress:(CGFloat)progress {
    progress = MIN(progress, 1.0f);
    CGFloat fromRed = fromColor.qmui_red;
    CGFloat fromGreen = fromColor.qmui_green;
    CGFloat fromBlue = fromColor.qmui_blue;
    CGFloat fromAlpha = fromColor.qmui_alpha;
    
    CGFloat toRed = toColor.qmui_red;
    CGFloat toGreen = toColor.qmui_green;
    CGFloat toBlue = toColor.qmui_blue;
    CGFloat toAlpha = toColor.qmui_alpha;
    
    CGFloat finalRed = fromRed + (toRed - fromRed) * progress;
    CGFloat finalGreen = fromGreen + (toGreen - fromGreen) * progress;
    CGFloat finalBlue = fromBlue + (toBlue - fromBlue) * progress;
    CGFloat finalAlpha = fromAlpha + (toAlpha - fromAlpha) * progress;
    
    return [UIColor colorWithRed:finalRed green:finalGreen blue:finalBlue alpha:finalAlpha];
}


- (CGFloat)qmui_red {
    CGFloat r;
    if ([self getRed:&r green:0 blue:0 alpha:0]) {
        return r;
    }
    return 0;
}

- (CGFloat)qmui_green {
    CGFloat g;
    if ([self getRed:0 green:&g blue:0 alpha:0]) {
        return g;
    }
    return 0;
}

- (CGFloat)qmui_blue {
    CGFloat b;
    if ([self getRed:0 green:0 blue:&b alpha:0]) {
        return b;
    }
    return 0;
}

- (CGFloat)qmui_alpha {
    CGFloat a;
    if ([self getRed:0 green:0 blue:0 alpha:&a]) {
        return a;
    }
    return 0;
}

@end
