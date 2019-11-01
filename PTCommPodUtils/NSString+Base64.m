//
//  NSString+Base64.m
//  Lottery
//
//  Created by tank on 2017/12/28.
//  Copyright © 2017年 tank. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)


+ (NSString *)decodeBase64:(NSString *)base64String
{
    //NSData *base64data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    return string;
}

@end
