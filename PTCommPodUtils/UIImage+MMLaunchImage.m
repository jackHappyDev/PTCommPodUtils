//
//  UIImage+MMLaunchImage.m
//  MumMum-Customer
//
//  Created by shlity on 17/6/21.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import "UIImage+MMLaunchImage.h"

@implementation UIImage (MMLaunchImage)

+ (UIImage *)getCurrentLaunchImage
{
    NSString *imageName;
    if (isIPhone4s) {
        imageName = @"launchImage-iphone4";
    }else if (isIPhone5){
        imageName = @"launchImage-iphone5";
    }else if (isIPhone6){
        imageName = @"launchImage-iphone6";
    }else if (isIPhone6plus){
        imageName = @"launchImage-iphone6p";
    }else{
        imageName = @"launchImage-iphone6";
    }
    
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
    return [self imageWithContentsOfFile:imagePath];
}

@end
