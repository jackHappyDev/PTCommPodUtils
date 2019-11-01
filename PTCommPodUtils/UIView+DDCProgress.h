//
//  UIView+DDCProgress.h
//  Lottery
//
//  Created by tank on 2017/12/25.
//  Copyright © 2017年 tank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDCProgress)

/**
 *  在界面上显示文字提示
 *
 *  @param title 提示标题
 *  @param delay 显示时间
 */
- (void)showProgress:(NSString *)title afterDelay:(NSTimeInterval)delay;

/**
 *  显示loading状态
 *
 *  @param title 显示的文字
 */
- (void)showProgressTitle:(NSString *)title;

/**
 *  隐藏当前试图上的loading状态
 */
- (void)hideHUDForView;

@end
