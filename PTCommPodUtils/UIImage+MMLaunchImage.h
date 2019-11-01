//
//  UIImage+MMLaunchImage.h
//  MumMum-Customer
//
//  Created by shlity on 17/6/21.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MMLaunchImage)

/**
 *  通过imageWithContentsOfFile方法获取本地的图片。
 *  由于imageWithContentsOfFile方法无法获取UILaunchImages中的图片，所以才在本地再copy一份的
 *  @return image
 */
+ (UIImage *)getCurrentLaunchImage;

@end
