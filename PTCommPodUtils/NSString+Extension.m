//
//  NSString+Extension.m
//  妈妈去哪儿
//
//  Created by shlity on 16/12/20.
//  Copyright © 2016年 shlity. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)VerticalString{
    NSMutableString * str = [[NSMutableString alloc] initWithString:self];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2 - 1];
    }
    return str;
}

// 字符串中根据关键字搜索该字符串中之前的值
- (NSString *)resultSearchStringKeyword:(NSString *)keyword
{
    NSString *newString = @"";
    NSRange range = [self rangeOfString:keyword];
    if (range.location != NSNotFound) {
        newString = [self substringWithRange:NSMakeRange(0, range.location)];
        //NSLog(@"find str:%@",newString);
    } else {
        //NSLog(@"= is not found");
        newString = @"";
    }
    return newString;
}

@end
