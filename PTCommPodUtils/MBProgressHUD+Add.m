//
//  MBProgressHUD+Add.h
//  MumMum
//
//  Created by shlity on 16/6/16.
//  Copyright © 2016年 Moresing Inc. All rights reserved.
//

typedef NS_ENUM(NSInteger,MBProgressHUDType) {
    MBProgressHUDTypeError,
    MBProgressHUDTypeSuccess,
    MBProgressHUDTypeWarning,
};


#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)

#pragma mark 显示信息
+ (void)showProgress:(UIView *)view
{
    [self showProgress:view afterDelay:0];
}

+ (void)showProgress:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    //hud.minSize = CGSizeMake(165,90);//定义弹窗的大小
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    
    
    UIImage *image = [[UIImage imageNamed:@"common_loading0"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIImageView* mainImageView= [[UIImageView alloc] initWithImage:image];
    mainImageView.animationImages = [NSArray arrayWithObjects:
                                     [UIImage imageNamed:@"common_loading0"],
                                     [UIImage imageNamed:@"common_loading1"],
                                     [UIImage imageNamed:@"common_loading2"],
                                     [UIImage imageNamed:@"common_loading3"],
                                     [UIImage imageNamed:@"common_loading4"],
                                     [UIImage imageNamed:@"common_loading5"],
                                     [UIImage imageNamed:@"common_loading6"],nil];
    [mainImageView setAnimationDuration:0.7f];
    [mainImageView setAnimationRepeatCount:0];
    [mainImageView startAnimating];
    hud.customView = mainImageView;
    hud.animationType = MBProgressHUDAnimationFade;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    if (delay != 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
}

+ (void)showError:(NSString *)error toView:(UIView *)view
{
    if (view == nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self showMsg:error toView:view type:MBProgressHUDTypeError afterDelay:0];
}

+ (void)showError:(NSString *)error toView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self showMsg:error toView:view type:MBProgressHUDTypeError afterDelay:delay];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    if (view == nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self showMsg:success toView:view type:MBProgressHUDTypeSuccess afterDelay:0];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self showMsg:success toView:view type:MBProgressHUDTypeSuccess afterDelay:delay];
}

+ (void)showWarning:(NSString *)warning toView:(UIView *)view
{
    if (view == nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self showMsg:warning toView:view type:MBProgressHUDTypeWarning afterDelay:0];
}

+ (void)showWarning:(NSString *)warning toView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self showMsg:warning toView:view type:MBProgressHUDTypeWarning afterDelay:delay];
}


+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+ (void)hideAllHUD
{
    [self hideAllHUDForView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}


+ (void)hideAllHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideAllHUDsForView:view animated:YES];
}


+ (void)showMsg:(NSString *)msg toView:(UIView *)view
           type:(MBProgressHUDType)type
     afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    //hud.minSize = CGSizeMake(165,90);//定义弹窗的大小
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    
    UIImage *image = [UIImage imageNamed:@"alert_long_bg"];
    UIImageView *mainImageView = [[UIImageView alloc]initWithImage:image];
    
    UILabel *tipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, image.size.height / 2 - 10, image.size.width, 20)];
    tipsLabel.font = kFont(15);
    tipsLabel.text = msg;
    tipsLabel.textColor = TextColorWhite;
    UIImage *alertImg = nil;
    if (type == MBProgressHUDTypeError) {
        alertImg = [UIImage imageNamed:@"common_alert_error"];
    }else if(type == MBProgressHUDTypeSuccess){
        alertImg = [UIImage imageNamed:@"common_alert_success"];
    }else{
        alertImg = [UIImage imageNamed:@"common_alert_warning"];
    }
    
    CGFloat imgWidth = alertImg.size.width * 0.8;
    CGFloat imgHeight = alertImg.size.height * 0.8;
    CGFloat textWidth = [msg sizeWithFont:tipsLabel.font maxSize:CGSizeMake(ScreenWidth, 40)].width;
    [tipsLabel setLeft:mainImageView.width / 2 - textWidth / 2 + imgWidth/2 + 5];
    UIImageView *alertImgView = [[UIImageView alloc]initWithFrame:CGRectMake(mainImageView.width / 2 - textWidth/2 - imgWidth/2 - 5,mainImageView.centerY - imgHeight/2,imgHeight, imgWidth)];
    alertImgView.image = alertImg;
    [mainImageView addSubview:alertImgView];
    [mainImageView addSubview:tipsLabel];
    
    hud.customView = mainImageView;
    hud.animationType = MBProgressHUDAnimationFade;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    if (delay != 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }else{
        [hud hideAnimated:YES afterDelay:1.5];
    }
}


- (void)dealloc
{
    NSLog(@"alert 移除");
}

@end
