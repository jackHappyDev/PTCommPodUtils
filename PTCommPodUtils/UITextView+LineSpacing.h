//
//  UITextView+LineSpacing.h
//  妈妈去哪儿
//
//  Created by shlity on 16/7/22.
//  Copyright © 2016年 shlity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LineSpacing)

/**
 *  设置UITextView行高
 *
 *  @param text        内容
 *  @param lineSpacing 行高
 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

/**
 *  设置UILabel行高后，获取Label的高度
 *
 *  @param text        内容
 *  @param fontSize    字体大小
 *  @param width       宽度
 *  @param lineSpacing 行高
 *
 *  @return 高度
 */
+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

@end
