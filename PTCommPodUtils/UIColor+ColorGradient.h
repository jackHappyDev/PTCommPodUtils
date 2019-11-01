//
//  UIColor+ColorGradient.h
//  MumMum-Customer
//
//  Created by shlity on 17/6/29.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorGradient)

/**
 *  将颜色A变化到颜色B，可通过progress控制变化的程度
 *  @param fromColor 起始颜色
 *  @param toColor 目标颜色
 *  @param progress 变化程度，取值范围0.0f~1.0f
 */
+ (UIColor *)qmui_colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor progress:(CGFloat)progress;


@end
