//
//  UILabel+TextDifferentColor.m
//  妈妈去哪儿
//
//  Created by shlity on 16/1/8.
//  Copyright © 2016年 shlity. All rights reserved.
//

#import "UILabel+TextDifferentColor.h"
#import "NSMutableAttributedString+Color.h"

@implementation UILabel (TextDifferentColor)

- (void)setTextColor:(UIColor *)textColor withText:(NSString *)keyword
{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.text];
    [string setColorForText:keyword withColor:textColor];
    [self setAttributedText:string];
}

- (void)setTextColor:(UIColor *)textColor range:(NSRange)range
{
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:self.text];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithAttributedString:str];
    [text addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    [self setAttributedText:text];
}

- (void)setFont:(UIFont *)font range:(NSRange)range
{
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:self.text];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithAttributedString:str];
    [text addAttribute:NSFontAttributeName value:font range:range];
    [self setAttributedText:text];
}

- (void)setTextColor:(UIColor *)textColor withFont:(UIFont *)font range:(NSRange)range
{
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:self.text];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithAttributedString:str];
    [text addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    [text addAttribute:NSFontAttributeName value:font range:range];
    [self setAttributedText:text];
}

- (void)setTextFont:(UIFont *)font withText:(NSString *)keyword
{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.text];
    [string setFontForText:keyword withFont:font];
    [self setAttributedText:string];
}

@end
