//
//  NSString+UtilString.m
//  MumMum-Customer
//
//  Created by Onery on 17/7/29.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import "NSString+UtilString.h"

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

@implementation NSString (UtilString)
/**
 判断NSString是否为空
 @params str NSString *
 */
+(BOOL)isEmpty:(NSString *)str{
    if (![str isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (!str || [str isEqual:[NSNull null]] || [str isEqualToString:@""] || [str isEqualToString:@"<null>"]||[str isEqualToString:@"(null)"])
        return YES;
    else
        return NO;
    
}

/**
 *  获取Label现实的宽度
 *
 *  @param str
 *  @param font
 *
 *  @return 宽度
 */
+(CGFloat)getWidth:(NSString *)str font:(UIFont *)font
{
    CGSize titleSize = [str sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
    return titleSize.width;
}

+(CGFloat)getHeight:(NSString *)str font:(UIFont *)font label:(UILabel *)label
{
    return [self getHeight:str font:font width:label.frame.size.width];
}

+(CGFloat)getHeight:(NSString *)str font:(UIFont *)font
{
    return [self getHeight:str font:font width:ScreenWidth];
}

+(CGFloat)getHeight:(NSString *)str font:(UIFont *)font width:(CGFloat)width
{
    if(![NSString isEmpty:str]){
        CGSize titleSize = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        return titleSize.height;
    }
    return 0 ;
}
/**
 *  源字符串是否包含目标字符串
 *
 *  @param target 目标字符串
 *  @param src    源字符串
 *
 *  @return YES NO
 */
+(BOOL)isContainsChar:(NSString *)target src:(NSString *)src
{
    NSRange range=[src rangeOfString:target];
    if(range.location!=NSNotFound){
        return true;
    }else{
        return false;
    }
    
}

// 将字典或者数组转化为JSON串
+ (NSString *)toJSONData:(id)theData{
    if(theData){
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        
        if ([jsonData length] > 0 && error == nil){
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }else{
            return @"";
        }
    }else{
        return @"";
    }
}
//串中包含子串判断


+ (BOOL)isContainSrc:(NSString *) srcContent target:(NSString *)targetContent
{
    if([self respondsToSelector:@selector(containsString:)]){
        return [srcContent containsString:targetContent];
    }else{
        return [self isContainsChar:targetContent src:srcContent];
    }
}

+(NSString *) joinArrays:(NSArray *) arrays inChar:(NSString *)delim
{
    NSString * loopDelim = @"";
    NSString * content = @"";
    for (NSString * s in arrays) {
        
        content = [NSString stringWithFormat:@"%@%@",content,loopDelim];
        content = [NSString stringWithFormat:@"%@%@",content,s];
        
        loopDelim = delim;
    }
    
    return content;
}
#pragma mark - 验证身份证号码
+ (BOOL)checkIDCard:(NSString *)sPaperId {
    //判断位数
    if (sPaperId.length != 15 && sPaperId.length != 18) {
        return NO;
    }
    NSString *carid = sPaperId;
    long lSumQT = 0 ;
    //加权因子
    int R[] = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
    //校验码
    unsigned char sChecker[11] = {'1','0','X','9','8','7','6','5','4','3','2'};
    //将15位身份证号转换为18位
    NSMutableString *mString = [NSMutableString stringWithString:sPaperId];
    if (sPaperId.length == 15) {
        [mString insertString:@"19" atIndex:6];
        long p =0;
        //        const char *pid = [mString UTF8String];
        for (int i =0; i<17; i++){
            NSString * s = [mString substringWithRange:NSMakeRange(i, 1)];
            p += [s intValue] * R[i];
            //            p += (long)(pid-48) * R;//
        }
        int o = p%11;
        NSString *string_content = [NSString stringWithFormat:@"%c",sChecker[o]];
        [mString insertString:string_content atIndex:[mString length]];
        carid = mString;
    }
    //判断地区码
    NSString *sProvince = [carid substringToIndex:2];
    NSLog(@"sProvince = %@",sProvince);
    if (![self isAreaCode:sProvince]) {
        return NO ;
    }
    //判断年月日是否有效
    //年份
    int strYear = [[self getStringWithRange:carid Value1:6 Value2:4] intValue];
    //月份
    int strMonth = [[self getStringWithRange:carid Value1:10 Value2:2] intValue];
    //日
    int strDay = [[self getStringWithRange:carid Value1:12 Value2:2] intValue];
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",strYear,strMonth,strDay]];
    if (date == nil) {
        return NO;
    }
    [carid uppercaseString];
    const char *PaperId = [carid UTF8String];
    //检验长度
    if (18!=strlen(PaperId)) {
        return NO;
    }
    //校验数字
    NSString * lst = [carid substringFromIndex:carid.length-1];
    char di = [carid characterAtIndex:carid.length-1];
    
    if (!isdigit(di)) {
        if ([lst isEqualToString:@"X"]) {
        }else{
            return NO;
        }
    }
    //验证最末的校验码
    lSumQT = 0;
    for (int i = 0; i<17; i++){
        NSString * s = [carid substringWithRange:NSMakeRange(i, 1)];
        lSumQT += [s intValue] * R[i];
    }
    if (sChecker[lSumQT%11] != PaperId[17]) {
        return NO;
    }
    return YES;
}


+ (NSArray *)provinceArr {
    NSArray *pArr = @[
                      @11,//北京市|110000，
                      @12,//天津市|120000，
                      @13,//河北省|130000，
                      @14,//山西省|140000，
                      @15,//内蒙古自治区|150000，
                      @21,//辽宁省|210000，
                      @22,//吉林省|220000，
                      @23,//黑龙江省|230000，
                      @31,//上海市|310000，
                      @32,//江苏省|320000，
                      @33,//浙江省|330000，
                      @34,//安徽省|340000，
                      @35,//福建省|350000，
                      @36,//江西省|360000，
                      @37,//山东省|370000，
                      @41,//河南省|410000，
                      @42,//湖北省|420000，
                      @43,//湖南省|430000，
                      @44,//广东省|440000，
                      @45,//广西壮族自治区|450000，
                      @46,//海南省|460000，
                      @50,//重庆市|500000，
                      @51,//四川省|510000，
                      @52,//贵州省|520000，
                      @53,//云南省|530000，
                      @54,//西藏自治区|540000，
                      @61,//陕西省|610000，
                      @62,//甘肃省|620000，
                      @63,//青海省|630000，
                      @64,//宁夏回族自治区|640000，
                      @65,//新疆维吾尔自治区|650000，
                      @71,//台湾省（886)|710000,
                      @81,//香港特别行政区（852)|810000，
                      @82,//澳门特别行政区（853)|820000
                      @91,//国外
                      ];
    return pArr;
}

+ (BOOL)isAreaCode:(NSString *)province {
    //在provinceArr中找
    NSArray * arr = [self provinceArr];
    int a = 0;
    for (NSString * pr in arr) {
        if ([pr isEqualToString:province]) {
            a ++;
        }
    }
    if (a == 0) {
        return NO;
    } else {
        return YES;
    }
}

+ (NSString *)getStringWithRange:(NSString *)str Value1:(int)v1 Value2:(int)v2 {
    NSString * sub = [str substringWithRange:NSMakeRange(v1, v2)];
    return sub;
}

+(NSString*)isEffectivelyURL:(NSString*)str{
    NSError *error;
    //http+:[^\\s]* 这是检测网址的正则表达式
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"http+:[^\\s]*" options:0 error:&error];//筛选
    if (regex != nil) {
        NSTextCheckingResult *firstMatch = [regex firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            //从urlString中截取数据
            NSString *result1 = [str substringWithRange:resultRange];
            NSLog(@"正则表达后的结果%@",result1);
            return result1;
        }
    }
    return nil;
}

#pragma Mark-
#pragma mark - 查找字符串
+(BOOL)stringBaseString:(NSString *)baseString SubString:(NSString *)subString{
    /**
     *  在 BaseString 中查找 SubString ,rangeOfString 是在 baseString 中找到 subString 的位置信息 NSNotFound 表示请求操作的某个内容或者item没有发现=或不存在
     */
    if ([baseString rangeOfString:subString].location!=NSNotFound) {
        return YES;
    }else {
        return NO;
    }
}

+ (CGFloat)sizeOfString:(NSString *)string Label:(UILabel *)label WidthOfHeight:(COMPUTE_STYLE)style Fixate:(CGFloat)fixate{
    if ( style == COMPUTE_WIDTH) {
            CGRect rect = [string boundingRectWithSize:CGSizeMake(0, fixate) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil];
            return rect.size.width +2;
    }
    
    if (style == COMPRTE_HEIGHT) {
        CGRect rect = [string boundingRectWithSize:CGSizeMake(fixate, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil];
        return rect.size.height+2;
    }
    return 0.0f;
}


+ (BOOL)validateMobile:(NSString *)mobile
{
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

@end
