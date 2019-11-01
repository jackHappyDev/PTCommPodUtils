//
//  UIButton+Action.m
//  MumMum-Customer
//
//  Created by shlity on 17/7/28.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import "UIButton+Action.h"
#import <objc/runtime.h>
@implementation UIButton (Action)
static char ActionTag;

- (void)addClick:(ButtonTouch)block {
    [self addAction:block forControlEvents:UIControlEventTouchUpInside];
}

- (void)addAction:(ButtonTouch)block forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:controlEvents];
}

- (void)action:(id)sender {
    ButtonTouch blockAction = (ButtonTouch)objc_getAssociatedObject(self, &ActionTag);
    if (blockAction) {
        blockAction(self);
    }
}
@end
