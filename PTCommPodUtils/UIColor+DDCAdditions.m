//
//  UIColor+DDCAdditions.m
//  Lottery
//
//  Created by tank on 2017/9/14.
//  Copyright © 2017年 tank. All rights reserved.
//

#import "UIColor+DDCAdditions.h"

@implementation UIColor (DDCAdditions)

+ (UIColor *)randomColor

{
    
    CGFloat hue = (arc4random() %256/256.0);
    
    CGFloat saturation = (arc4random() %128/256.0) +0.5;
    
    CGFloat brightness = (arc4random() %128/256.0) +0.5;
    
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

    
    return color;
    
}

@end
