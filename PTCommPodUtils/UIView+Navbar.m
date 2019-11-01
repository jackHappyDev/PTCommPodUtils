//
//  UIView+Navbar.m
//  Lottery
//
//  Created by tank on 2017/10/31.
//  Copyright © 2017年 tank. All rights reserved.
//

#import "UIView+Navbar.h"

@implementation UIView (Navbar)

- (void)applyNavBarConstraints:(CGFloat)width height:(CGFloat)height
{
    if (width == 0 || height == 0) {
        return;
    }
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
    [heightConstraint setActive:TRUE];
    [widthConstraint setActive:TRUE];
}

@end
