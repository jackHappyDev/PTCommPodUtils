//
//  NSString+UtilString.h
//  MumMum-Customer
//
//  Created by Onery on 17/7/29.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger , COMPUTE_STYLE) {
    COMPUTE_WIDTH =0,
    COMPRTE_HEIGHT = 1,
};


@interface NSString (UtilString)
+(BOOL) isEmpty : (NSString * ) str;

+(CGFloat) getWidth:(NSString *) str font:(UIFont *) font;
+(CGFloat) getHeight:(NSString *) str font:(UIFont *)font label:(UILabel *)label;
+(CGFloat) getHeight:(NSString *) str font:(UIFont *)font;
+(CGFloat) getHeight:(NSString *) str font:(UIFont *)font width:(CGFloat)width;

// 将字典或者数组转化为JSON串
+ (NSString *)toJSONData:(id)theData;


/**
 *  判断是否包含该目标字段
 *
 *  @param srcContent
 *  @param targetContent
 *
 *  @return
 */
+ (BOOL)isContainSrc:(NSString *) srcContent target:(NSString *)targetContent;
/**
 *  数据的字符串加入分隔符
 *
 *  @param arrays
 *  @param delim
 *
 *  @return
 */
+(NSString *) joinArrays:(NSArray *) arrays inChar:(NSString *)delim;
/**
*  验证身份证号码
*/
+(BOOL)isContainsChar:(NSString *)target src:(NSString *)src;
+ (BOOL)checkIDCard:(NSString *)sPaperId;
+ (NSArray *)provinceArr;
+ (BOOL)isAreaCode:(NSString *)province;
+ (NSString *)getStringWithRange:(NSString *)str Value1:(int)v1 Value2:(int)v2;
/**
 *  正则判断网址
 */
+(NSString*)isEffectivelyURL:(NSString*)str;
+(BOOL)stringBaseString:(NSString *)baseString SubString:(NSString *)subString;
+ (CGFloat)sizeOfString:(NSString *)string Label:(UILabel *)label WidthOfHeight:(COMPUTE_STYLE)style Fixate:(CGFloat)fixate;

/**
 *  验证手机号码
 */
+ (BOOL)validateMobile:(NSString *)mobile;

@end
