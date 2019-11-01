//
//  UILabel+LineSpacing.h
//  妈妈去哪儿
//
//  Created by shlity on 16/7/22.
//  Copyright © 2016年 shlity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LineSpacing)

/**
 *  设置UILabel行高
 *
 *  @param text        内容
 *  @param lineSpacing 行高
 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

/**
 *  设置UILabel行高后，获取Label的高度
 *
 *  @param str        内容
 *  @param font    字体大小
 *  @param width       宽度
 *  @param lineSpacing 行高
 *
 *  @return 高度
 */
+ (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width height:(CGFloat)height lineSpacing:(CGFloat)lineSpacing;

/**
 *  设置UILabel行高后，获取Label的高度
 *
 *  @param str        内容
 *  @param font    字体大小
 *  @param width       宽度
 *  @param lineSpacing 行高
 *
 *  @return 高度
 */
+ (CGFloat)getSpaceLabelWithHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width height:(CGFloat)height lineSpacing:(CGFloat)lineSpacing;


/**
 *  设置UILabel行高后，获取Label的高度
 *
 *  @param str        内容
 *  @param font    字体大小
 *  @param width       宽度
 *  @param lineSpacing 行高
 *
 *  @return 高度
 */
+ (CGFloat)getSpaceLabelWithHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width height:(CGFloat)height lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)textColor withText:(NSString *)keyword;

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)textColor withText:(NSString *)keyword;

@end
