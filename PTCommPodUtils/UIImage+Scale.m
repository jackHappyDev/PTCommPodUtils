//
//  UIImage+Scale.m
//  妈妈去哪儿
//
//  Created by shlity on 15/8/27.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{

    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;

}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 根据宽度来等比缩放
 
 @param sourceImage 原图片
 @param defineWidth 宽度
 @return uiimage
 */
+ (UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    CGSize size = sourceImage.size;

    if (size.width > defineWidth) {
        CGFloat offsetWidth = sourceImage.size.width / defineWidth;
        CGFloat height = sourceImage.size.height / offsetWidth;
        return  [UIImage scaleToSize:sourceImage size:CGSizeMake(defineWidth, height)];
    }else{
        return  [UIImage scaleToSize:sourceImage size:size];

    }
}

+ (UIImage *) imageCompressForTitleHeightScale:(UIImage *)sourceImage targetHeight:(CGFloat)defineHeight
{
    CGFloat offsetHeight = sourceImage.size.height / defineHeight;
    CGFloat width = sourceImage.size.width / offsetHeight;
    return  [UIImage scaleToSize:sourceImage size:CGSizeMake(width,defineHeight)];

//    if (size.height > defineHeight) {
//        CGFloat offsetHeight = sourceImage.size.height / defineHeight;
//        CGFloat width = sourceImage.size.width / offsetHeight;
//        return  [UIImage scaleToSize:sourceImage size:CGSizeMake(width,defineHeight)];
//    }else{
//        return  [UIImage scaleToSize:sourceImage size:size];
//    }
}

@end
