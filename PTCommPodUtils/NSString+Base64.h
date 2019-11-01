//
//  NSString+Base64.h
//  Lottery
//
//  Created by tank on 2017/12/28.
//  Copyright © 2017年 tank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

+ (NSString *)decodeBase64:(NSString *)base64String;

@end
