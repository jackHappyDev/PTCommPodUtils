//
//  NSObject+MMLog.h
//  MumMum-Customer
//
//  Created by shlity on 17/7/25.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MMLog)

// 自动打印属性字符串
+ (void)resolveDict:(NSDictionary *)dict;

@end
