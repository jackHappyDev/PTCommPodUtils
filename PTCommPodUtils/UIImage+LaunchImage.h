//
//  UIImage+LaunchImage.h
//  MumMum-Customer
//
//  Created by shlity on 17/6/21.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LaunchImage)

/**
 *  此功能主要是自定义启动页，在系统的启动页上面加载自定义图片和事件
 *  1. 拿到本地的启动图片
 *  2. 然后再将该图片传给启动页，自定义图片的地图
 */
+ (UIImage *)getTheLaunchImage;


@end
