//
//  NSString+Extension.h
//  妈妈去哪儿
//
//  Created by shlity on 16/12/20.
//  Copyright © 2016年 shlity. All rights reserved.
//  让文字竖排显示

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (NSString *)VerticalString;

// 字符串中根据关键字搜索该字符串中之前的值
- (NSString *)resultSearchStringKeyword:(NSString *)keyword;

@end
