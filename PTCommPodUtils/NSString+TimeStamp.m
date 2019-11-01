//
//  NSString+TimeStamp.m
//  LotteryAutoTools
//
//  Created by tank on 2017/12/23.
//  Copyright © 2017年 tank. All rights reserved.
//

#import "NSString+TimeStamp.h"

@implementation NSString (TimeStamp)


+ (NSString *)currentTimeStamp
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long dTime = ([[NSNumber numberWithDouble:time] longLongValue] * 1000) + arc4random() % 1000; ;
    NSString *timeSp = [NSString stringWithFormat:@"%llu",dTime];
    
    return timeSp;
}

@end
