//
//  MBProgressHUD+Add.h
//  MumMum
//
//  Created by shlity on 16/6/16.
//  Copyright © 2016年 Moresing Inc. All rights reserved.
//

#import "MBProgressHUD.h"


@interface MBProgressHUD (Add)

+ (void)showProgress:(UIView *)view;
+ (void)showProgress:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (void)showWarning:(NSString *)warning toView:(UIView *)view;
+ (void)showWarning:(NSString *)warning toView:(UIView *)view afterDelay:(NSTimeInterval)delay;


+ (void)hideHUD;
+ (void)hideAllHUD;
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideAllHUDForView:(UIView *)view;

@end
