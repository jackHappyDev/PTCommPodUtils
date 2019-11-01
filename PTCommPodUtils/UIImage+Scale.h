//
//  UIImage+Scale.h
//  妈妈去哪儿
//
//  Created by shlity on 15/8/27.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

/**
 *  改变image的frame
 *
 *  @param img  要改变的image
 *  @param size 设置尺寸
 *
 *  @return 返回改变后的image
 */

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;


/**
 根据宽度来等比缩放

 @param sourceImage 原图片
 @param defineWidth 宽度
 @return image
 */
+ (UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

/**
 根据高度来等比缩放
 
 @param sourceImage 原图片
 @param defineHeight 高度
 @return image
 */
+ (UIImage *) imageCompressForTitleHeightScale:(UIImage *)sourceImage targetHeight:(CGFloat)defineHeight;


@end
