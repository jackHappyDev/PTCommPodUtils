//
//  UIButton+Action.h
//  MumMum-Customer
//
//  Created by shlity on 17/7/28.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ButtonTouch)(UIButton *button);
@interface UIButton (Action)
- (void)addClick:(ButtonTouch)block;
/**
 * 可以自定义事件
 */
- (void)addAction:(ButtonTouch)block forControlEvents:(UIControlEvents)controlEvents;
@end
