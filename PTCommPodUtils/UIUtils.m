//
//  UIUtils.m
//  SinaWeiBo
//
//  Created by amber on 14-8-19.
//  Copyright (c) 2014年 amber. All rights reserved.
//

#import "UIUtils.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"
#include <objc/runtime.h>
//#import "RegexKitLite.h"
//#import "NSString+URLEncoding.h"

@implementation UIUtils


+ (NSString *)getDocumentsPath:(NSString *)fileName {
    
    //两种获取document路径的方式
    //    NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documents = [paths objectAtIndex:0];
    NSString *path = [documents stringByAppendingPathComponent:fileName];
    
    return path;
}

+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}

//Sat Jan 12 11:50:16 +0800 2013
+ (NSString *)fomateString:(NSString *)datestring {
    NSString *formate = @"E M d HH:mm:ss Z yyyy";
    NSDate *createDate = [UIUtils dateFromFomate:datestring formate:formate];
    NSString *text = [UIUtils stringFromFomate:createDate formate:@"MM-dd HH:mm"];
    return text;
}


+ (NSString *)getCurrentDate:(NSString *)dateFormat
{
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    return currentTime;
}

+ (NSString *)randomString:(int)length
{
    char data[length];
    for (int x=0;x < length;data[x++] = (char)('a' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:length encoding:NSUTF8StringEncoding];
}

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    
    if (result == NSOrderedDescending) {
        NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        NSLog(@"Date1 is in the past");
        return -1;
    }
    NSLog(@"Both dates are the same");
    return 0;
}

+ (NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2
{
    NSArray *timeArray1=[dateString1 componentsSeparatedByString:@"."];
    dateString1=[timeArray1 objectAtIndex:0];
    
    
    NSArray *timeArray2=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray2 objectAtIndex:0];
    
    NSLog(@"%@.....%@",dateString1,dateString2);
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    
    
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    NSString *house=@"";
    NSString *min=@"";
    NSString *sen=@"";
    
    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
    //        min = [min substringToIndex:min.length-7];
    //    秒
    sen=[NSString stringWithFormat:@"%@", sen];
    
    
    
    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    //        min = [min substringToIndex:min.length-7];
    //    分
    min=[NSString stringWithFormat:@"%@", min];
    
    
    //    小时
    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    //        house = [house substringToIndex:house.length-7];
    house=[NSString stringWithFormat:@"%@", house];
    
    
    timeString=[NSString stringWithFormat:@"%@:%@:%@",house,min,sen];
    
    return timeString;
}


/**
 *  将字符串转为NSDate
 *
 *  @param uiDate 要转的字符串
 *
 *  @return NSDate
 */
+ (NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:uiDate];
    return date;
}

+ (NSString *)getDocumentFile:(NSString *)fileName
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
    return filename;
}

//判断输入的是否是数字
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断字母和数字组合
+(BOOL)isNumberAndLetter:(NSString *)str{
    BOOL result = false;
    if ([str length] > 0){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:str];
    }
    return result;
}

//图片等比缩放
+ (UIImage *)scaleImage:(UIImage *)image proportion:(float)scale {
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width/scale, image.size.height/scale));
    CGRect imageRect = CGRectMake(0.0, 0.0, image.size.width/scale, image.size.height/scale);
    [image drawInRect:imageRect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//将RGB颜色值转为16进制
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

//将UIView转成UIImage
+ (UIImage*)convertViewToImage:(UIView*)v{
    CGSize s = v.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (NSString *)converDateTime:(NSString *)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSDate *)converDateTime:(NSString *)time dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    
    NSString *currentDateString = time;
    [dateFormatter setDateFormat:dateFormat];
    NSDate *currentDate = [dateFormatter dateFromString:currentDateString];
    
    return currentDate;
}

+ (NSString *)converCurrentDate:(NSString *)timeStr formatter:(NSString *)formatterStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatterStr];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:timeStr];
    //时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}

+ (void) setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners withColor:(UIColor*) color
{
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds  byRoundingCorners:corners cornerRadii:CGSizeMake(9.0, 9.0)];
    
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    shape.strokeColor = [[UIColor grayColor] CGColor];
    
    view.backgroundColor=color;
    view.layer.mask = shape;
}

+ (void)drawViewBorder:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)lineWidth
{
    //指定区域画圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(cornerRadii.width, cornerRadii.height)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
    //
    // And then create the outline layer
    //
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = view.bounds;
    shape.path = maskPath.CGPath;
    shape.lineWidth = lineWidth;
    shape.strokeColor = strokeColor.CGColor;
    
    shape.fillColor = [UIColor clearColor].CGColor;
    [view.layer addSublayer:shape];
}

//获取当前汉字或字母的length
+ (int)getToInt:(NSString*)strtemp
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [strtemp dataUsingEncoding:enc];
    return (int)[da length];
}

/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect {
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}

//GCD方式延迟执行某个方法
void RunBlockAfterDelay(NSTimeInterval delay, void (^block)(void))
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay),
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0), block);
}

//只允许输入数字和小数点
+ (BOOL)validateWithString:(NSString*)str number:(NSString *)number{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:number];
    int i = 0;
    while (i < str.length) {
        NSString * string = [str substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

//图片居中裁剪
+ (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size
{
    double newCropWidth, newCropHeight;
    
    //=== To crop more efficently =====//
    if(image.size.width < image.size.height){
        if (image.size.width < size.width) {
            newCropWidth = size.width;
        }
        else {
            newCropWidth = image.size.width;
        }
        newCropHeight = (newCropWidth * size.height)/size.width;
    } else {
        if (image.size.height < size.height) {
            newCropHeight = size.height;
        }
        else {
            newCropHeight = image.size.height;
        }
        newCropWidth = (newCropHeight * size.width)/size.height;
    }
    //==============================//
    
    double x = image.size.width/2.0 - newCropWidth/2.0;
    double y = image.size.height/2.0 - newCropHeight/2.0;
    
    CGRect cropRect = CGRectMake(x, y, newCropWidth, newCropHeight);
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);
    
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return cropped;
}

+ (void)setupViewBorder:(UIView *)view cornerRadius:(CGFloat )cornerRadius borderWidth:(CGFloat )borderWidth borderColor:(UIColor *)borderColor
{
    view.layer.cornerRadius = cornerRadius;
    view.clipsToBounds = YES;
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = [borderColor CGColor];
}

+ (void)setupViewRadius:(UIView *)view cornerRadius:(CGFloat )cornerRadius
{
    view.layer.cornerRadius = cornerRadius;
    view.clipsToBounds = YES;
}

+(void)cutCurrentImageView:(UIImageView *)imageView
{
    [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    imageView.contentMode =  UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    imageView.clipsToBounds  = YES;
}

#define PI 3.1415926
+(double) LantitudeLongitudeDist:(double)lon1 other_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2{
    double er = 6378137; // 6378700.0f;
    //ave. radius = 6371.315 (someone said more accurate is 6366.707)
    //equatorial radius = 6378.388
    //nautical mile = 1.15078
    double radlat1 = PI*lat1/180.0f;
    double radlat2 = PI*lat2/180.0f;
    //now long.
    double radlong1 = PI*lon1/180.0f;
    double radlong2 = PI*lon2/180.0f;
    if( radlat1 < 0 ) radlat1 = PI/2 + fabs(radlat1);// south
    if( radlat1 > 0 ) radlat1 = PI/2 - fabs(radlat1);// north
    if( radlong1 < 0 ) radlong1 = PI*2 - fabs(radlong1);//west
    if( radlat2 < 0 ) radlat2 = PI/2 + fabs(radlat2);// south
    if( radlat2 > 0 ) radlat2 = PI/2 - fabs(radlat2);// north
    if( radlong2 < 0 ) radlong2 = PI*2 - fabs(radlong2);// west
    //spherical coordinates x=r*cos(ag)sin(at), y=r*sin(ag)*sin(at), z=r*cos(at)
    //zero ag is up so reverse lat
    double x1 = er * cos(radlong1) * sin(radlat1);
    double y1 = er * sin(radlong1) * sin(radlat1);
    double z1 = er * cos(radlat1);
    double x2 = er * cos(radlong2) * sin(radlat2);
    double y2 = er * sin(radlong2) * sin(radlat2);
    double z2 = er * cos(radlat2);
    double d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
    //side, side, side, law of cosines and arccos
    double theta = acos((er*er+er*er-d*d)/(2*er*er));
    double dist  = theta*er;
    return dist;
}

//获得设备型号
+ (NSString*)deviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //CLog(@"%@",deviceString);
    
    if ([deviceString isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([deviceString isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([deviceString isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    
    if ([deviceString isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([deviceString isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([deviceString isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([deviceString isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([deviceString isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([deviceString isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    
    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([deviceString isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    
    if ([deviceString isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([deviceString isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([deviceString isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([deviceString isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([deviceString isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([deviceString isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([deviceString isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([deviceString isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([deviceString isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([deviceString isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([deviceString isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([deviceString isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([deviceString isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([deviceString isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([deviceString isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([deviceString isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([deviceString isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([deviceString isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([deviceString isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([deviceString isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([deviceString isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([deviceString isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([deviceString isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([deviceString isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return deviceString;
}


-(NSString *)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return @"今天";
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return @"昨天";
    }else if ([dateString isEqualToString:tomorrowString])
    {
        return @"明天";
    }
    else
    {
        return dateString;
    }
}

/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/

+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate
{
    
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

// snippet from BDDateTransformer.m //
+ (NSString *)transformedValue:(NSDate *)date
{
    // Initialize the formatter.
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    
    // Initialize the calendar and flags.
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // Create reference date for supplied date.
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    NSDate *suppliedDate = [calendar dateFromComponents:comps];
    
    // Iterate through the eight days (tomorrow, today, and the last six).
    int i;
    for (i = -1; i < 7; i++)
    {
        // Initialize reference date.
        comps = [calendar components:unitFlags fromDate:[NSDate date]];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        [comps setDay:[comps day] - i];
        NSDate *referenceDate = [calendar dateFromComponents:comps];
        // Get week day (starts at 1).
        int weekday = (int)[[calendar components:unitFlags fromDate:referenceDate] weekday] - 1;
        
        if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == -1)
        {
            // Tomorrow
            NSString *dateStr = [NSString stringWithFormat:@"明天%@",[formatter stringFromDate:date]];
            return dateStr;
        }
        else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 0)
        {
            // Today's time (a la iPhone Mail)
            [formatter setDateStyle:NSDateFormatterNoStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            NSString *dateStr = [NSString stringWithFormat:@"今天%@",[formatter stringFromDate:date]];
            return dateStr;
        }
        else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 1)
        {
            NSString *dateStr = [NSString stringWithFormat:@"昨天%@",[formatter stringFromDate:date]];
            return dateStr;
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 2)
        {
            NSString *dateStr = [NSString stringWithFormat:@"后天%@",[formatter stringFromDate:date]];
            return dateStr;
        }
        else if ([suppliedDate compare:referenceDate] == NSOrderedSame)
        {
            // Day of the week
            NSString *day = [[formatter weekdaySymbols] objectAtIndex:weekday];
            return day;
        }
    }
    
    // It's not in those eight days.
    NSString *defaultDate = [formatter stringFromDate:date];
    return defaultDate;
}

+ (NSString *)convertDateToString:(NSString *)time
{
    NSTimeInterval _interval=[time doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [objDateformat stringFromDate: date];
    return str;
}

+ (void)setTextLabelLine:(UILabel *)label withText:(NSString *)text withLineLength:(NSUInteger)length withLineColor:(UIColor *)color
{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:text];
    [attri setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0,length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:color range:NSMakeRange(0, length)];
    [label setAttributedText:attri];
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

+ (int)convertToInt1:(NSString*)strtemp
{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
}

+ (NSString *)jsonDataWithInfo:(NSDictionary *)jsonData
{
    //dict转jsonData
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonData options:0 error:0];
    //jsonData转String
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonStr;
}

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSData *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
            representation:(float) representation
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, representation);
}

+ (UIImage *)applyBlurRadius:(CGFloat)radius toImage:(UIImage *)image
{
    if (radius < 0) radius = 0;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    
    // Setting up gaussian blur
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return returnImage;
}

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

/**
 *  字符串截取
 *
 *  @param string 字符串
 *  @param range  范围
 *
 *  @return 截取后的字符串
 */
+ (NSString *)substringWitString:(NSString *)string range:(NSRange )range
{
    return [string substringWithRange:range];
}

+(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

//根据时间戳获取星期几
+ (NSString *)getWeekDayFordate:(long long)data
{
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:data];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:newDate];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

//传入 秒  得到 xx:xx:xx
+ (NSString *)getMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
}

+ (NSString *)dataToJsonString:(NSArray *)data
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:kNilOptions
                                                         error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    return jsonString;
}

//将服务器13位的时间搓转换为iOS的10位的时间搓
+ (NSString *)handleRemainTime:(NSString *)remainTime
{
    //服务端是 Java（Jersey + Jackson）输出的时间戳是 13 位的，而 iOS 要求是 10 位的
    double timestampval =  [remainTime doubleValue]/1000;
    NSTimeInterval timestamp = (NSTimeInterval)timestampval;
    NSDate *updatetimestamp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [NSString stringWithFormat:@"%f",[updatetimestamp timeIntervalSince1970]];
}

//计算服务器时间与本地时间的时间差
+ (NSString *)calculationTimeDifference:(NSString *)sysTime
{
    //double serverTime = sysTime.longLongValue / 1000;
    double serverTime = sysTime.longLongValue;
    NSTimeInterval serverTimestamp = (NSTimeInterval)serverTime;
    NSDate *serverUpdatetimestamp = [NSDate dateWithTimeIntervalSince1970:serverTimestamp];
    NSInteger serverCurrentTime = [serverUpdatetimestamp timeIntervalSince1970];
    NSDate * date = [NSDate date];
    NSInteger nowTimeInteger = [date timeIntervalSince1970];
    NSInteger timeDifference = nowTimeInteger - serverCurrentTime;
    return [NSString stringWithFormat:@"%ld",timeDifference];
}

+ (NSString *)getDateStringWithTimeStr:(NSString *)str{
    NSTimeInterval time=[str doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}


//判断文件是否已经在沙盒中已经存在？
+ (BOOL) isFileExist:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    NSLog(@"这个文件已经存在：%@",result?@"是的":@"不存在");
    return result;
}

+ (dispatch_source_t)timerWithTimeTotalInterval:(NSInteger)time
                                     invocation:(float)invocation
                                        repeats:(BOOL)yesOrNo
                                 countdownBlock:(void(^)(NSInteger timer))countdownBlock
{
    
    
    //设置倒计时时间
    //通过检验发现，方法调用后，timeout会先自动-1，所以如果从15秒开始倒计时timeout应该写16
    //__block 如果修饰指针时，指针相当于弱引用，指针对指向的对象不产生引用计数的影响
    __block NSInteger timeout = time;
    
    //获取全局队列
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建一个定时器，并将定时器的任务交给全局队列执行(并行，不会造成主线程阻塞)
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
    
    // 设置触发的间隔时间
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, invocation * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    //设置定时器的触发事件
    dispatch_source_set_event_handler(timer, ^{
        
        timeout --;
        
        if (countdownBlock) {
            countdownBlock(timeout);
        }
        
        if (timeout == 0) {
            
            //不需要重复
            if (yesOrNo == NO) {
                dispatch_source_cancel(timer);
            }else{
                //timeout = time; //继续重复倒计时
            }
        }
    });
    
    //开启定时器
    dispatch_resume(timer);
    
    return timer;
}

+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}

+ (BOOL)validateMoney:(NSString *)money
{
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{1,1})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:money];
}


/**
 *  formatterNumber .00 小数点后两位
 *
 *  @param number
 *
 *  @return
 */
+ (NSString *)y_formatterNumber:(NSNumber *)number{
    
    return [self y_formatterNumber:number fractionDigits:2];
}

+ (NSString *)y_formatterNumber:(NSNumber *)number fractionDigits:(NSUInteger)fractionDigits{
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setMaximumFractionDigits:fractionDigits];
    [numberFormatter setMinimumFractionDigits:fractionDigits];
    
    return [numberFormatter stringFromNumber:number];
}

+ (UIImage *)setupTransitionWithStartColor:(NSString *)startColor
                                  endColor:(NSString *)endColor
{
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIView *theView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, NavHeight)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = theView.bounds;
    [theView.layer addSublayer:gradientLayer];
    gradientLayer.startPoint = CGPointMake(0,0);
    gradientLayer.endPoint = CGPointMake(1,0);
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:startColor].CGColor,
                             (__bridge id)[UIColor colorWithHexString:endColor].CGColor
                             ];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0), @(1.0f)];
    
    return [UIUtils convertViewToImage:theView];
}

+ (UIImage *)setupTransitionWithFrame:(CGRect)frame
                           startColor:(NSString *)startColor
                             endColor:(NSString *)endColor
{
    UIView *theView = [[UIView alloc]initWithFrame:frame];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = theView.bounds;
    [theView.layer addSublayer:gradientLayer];
    gradientLayer.startPoint = CGPointMake(0,0);
    gradientLayer.endPoint = CGPointMake(1,1);
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:startColor].CGColor,
                             (__bridge id)[UIColor colorWithHexString:endColor].CGColor
                             ];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0), @(1.0f)];
    
    return [UIUtils convertViewToImage:theView];
}


/**
*
*  判断用户输入的密码是否符合规范，符合规范的密码要求：
*  长度大于6位
*  密码中必须同时包含数字和字母
*/
+(BOOL)judgePassWordLegal:(NSString *)pass{
    BOOL result = false;
    // 判断长度大于8位后再接着判断是否同时包含数字和字符
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:pass];
    
    return result;
}

+(NSInteger)sumBetCount:(NSInteger)x
                      y:(NSInteger)y
{
    NSInteger sum = 0;
    
    if (y == 2) { //取2个
        
        sum = (x * (x - 1) ) / ((y * (y - 1) ));

    }if (y == 3) { //取3个
        
        sum = (x * (x - 1) * (x - 2)) / ((y * (y - 1) * (y - 2)));
        
    }else if (y == 4){ //取4个
        
        sum = (x *(x-1)*(x-2)*(x-3)) / (y * (y-1) *(y-2) *(y-3));
        
    }else if (y == 5){ //取5个
        
        sum = (x * (x - 1) * (x - 2) * (x - 3) * (x - 4)) / (y * (y - 1) * (y - 2) * (y - 3) * (y - 4));

    }
    
    return sum;
}

+(NSInteger )getWithNumberWithHanzi:(NSString *)hanzi
{
    NSInteger num;
    if ([hanzi isEqualToString:@"一"]) {
        num = 1;
    }else if ([hanzi isEqualToString:@"二"]){
        num = 2;
    }else if ([hanzi isEqualToString:@"三"]){
        num = 3;
    }else if ([hanzi isEqualToString:@"四"]){
        num = 4;
    }else if ([hanzi isEqualToString:@"五"]){
        num = 5;
    }else if ([hanzi isEqualToString:@"六"]){
        num = 6;
    }else if ([hanzi isEqualToString:@"七"]){
        num = 7;
    }else if ([hanzi isEqualToString:@"八"]){
        num = 8;
    }else if ([hanzi isEqualToString:@"九"]){
        num = 9;
    }else if ([hanzi isEqualToString:@"十"]){
        num = 10;
    }else{
        num = 0;
    }
    return num;
}

+ (int)convertToInt:(NSString*)strtemp {
    
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
    
}

/*邮箱验证 MODIFIED BY HELENSONG*/
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 *  对象转换为字典
 *
 *  @param obj 需要转化的对象
 *
 *  @return 转换后的字典
 */
+ (NSDictionary*)getObjectData:(id)obj {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    
    for(int i = 0;i < propsCount; i++) {
        
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        if(value == nil) {
            
            value = [NSNull null];
        } else {
            value = [self getObjectInternal:value];
        }
        if (value != [NSNull null]) {
            [dic setObject:value forKey:propName];
        }
    }
    
    return dic;
}

+ (id)getObjectInternal:(id)obj {
    
    if([obj isKindOfClass:[NSString class]]
       ||
       [obj isKindOfClass:[NSNumber class]]
       ||
       [obj isKindOfClass:[NSNull class]]) {
        
        return obj;
        
    }
    if([obj isKindOfClass:[NSArray class]]) {
        
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        
        for(int i = 0; i < objarr.count; i++) {
            
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    if([obj isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        
        for(NSString *key in objdic.allKeys) {
            
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
    
}

+ (BOOL) isEmpty:(NSString *) str {
    if (!str) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0 || str.length == 0) {
            return true;
        } else {
            return false;
        }
    }
}

//生成一张毛玻璃图片
+ (UIImage*)blur:(UIImage*)theImage
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:theImage.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:15.0f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return returnImage;
}

+ (UIImageView *)addLine:(CGRect)frame
{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:frame];
    imgView.image = [UIImage imageNamed:@"line_img"];
    return imgView;
}

//将对象保存为json格式的文件
+ (BOOL)writeStringToFile:(NSString*)aString
                 fileName:(NSString *)fileName
{
    // Build the path, and create if needed.
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    NSLog(@"fileAtPath:%@",fileAtPath);
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    // The main act...
    return [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}


+ (NSString*)readStringFromFileName:(NSString *)fileName
 {
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}


// 读取本地JSON或plist等文件
+ (NSDictionary *)readLocalFileWithFileName:(NSString *)fileName ofType:(NSString *)type{
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

//获取当前时间戳  （以毫秒为单位）
+(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
}

+ (UIImage *)decodeBase64:(NSString *)base64String
{
    // 将base64字符串转为NSData
    NSData *decodeData = [[NSData alloc]initWithBase64EncodedString:base64String options:(NSDataBase64DecodingIgnoreUnknownCharacters)];
    // 将NSData转为UIImage
    UIImage *decodedImage = [UIImage imageWithData: decodeData];
    
    return decodedImage;
}


+(UIImage *)changeGrayImage:(UIImage *)oldImage {
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
    int width = oldImage.size.width;
    int height = oldImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil, width, height, 8, 0, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
        
    }
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), oldImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

@end

