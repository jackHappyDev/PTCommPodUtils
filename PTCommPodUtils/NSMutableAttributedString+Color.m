//
//  NSMutableAttributedString+Color.m
//  MumMum-Seller
//
//  Created by shlity on 16/10/12.
//  Copyright © 2016年 Moresing Inc. All rights reserved.
//

#import "NSMutableAttributedString+Color.h"

@implementation NSMutableAttributedString (Color)


-(void)setColorForText:(NSString*) textToFind withColor:(UIColor*) color
{
    NSRange range = [self.mutableString rangeOfString:textToFind options:NSCaseInsensitiveSearch];
    
    if (range.location != NSNotFound) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

-(void)setFontForText:(NSString*) textToFind withFont:(UIFont*) font
{
    NSRange range = [self.mutableString rangeOfString:textToFind options:NSCaseInsensitiveSearch];
    
    if (range.location != NSNotFound) {
        [self addAttribute:NSFontAttributeName value:font range:range];
    }
}

@end
