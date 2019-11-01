//
//  NSString+DDCSHA256.m
//  Lottery
//
//  Created by tank on 2017/9/26.
//  Copyright © 2017年 tank. All rights reserved.
//

#import "NSString+DDCSHA256.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (DDCSHA256)


+ (NSString *)SHA256:(NSString *)string
{
    const char *str = [string UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG) strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for ( int i=0; i<CC_SHA256_DIGEST_LENGTH; i++ ) {
        [ret appendFormat:@"%02x",result[i]];
    }
    
    return ret;
    
}

@end

