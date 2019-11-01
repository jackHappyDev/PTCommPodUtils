//
//  UIImage+RescaleImage.m
//  MumMum-Customer
//
//  Created by shlity on 17/6/27.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import "UIImage+RescaleImage.h"

@implementation UIImage (RescaleImage)

- (UIImage *)rescaleImageToSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    [self drawInRect:rect];  // scales image to rect
    
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resImage;
    
}

@end
