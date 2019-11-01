//
//  UIUtils.h
//  SinaWeiBo
//
//  Created by amber on 14-8-19.
//  Copyright (c) 2014年 amber. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIUtils : NSObject

//获取documents下的文件路径
+ (NSString *)getDocumentsPath:(NSString *)fileName;
// date 格式化为 string
+ (NSString*) stringFromFomate:(NSDate*)date formate:(NSString*)formate;
// string 格式化为 date
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;

//获取当前时间
+ (NSString *)getCurrentDate:(NSString *)dateFormat;

//格式化这样的日期：Mon Sep 08 20:29:11 +0800 2014
+ (NSString *)fomateString:(NSString *)datestring;

//字符串链接等解析方法
+ (NSString *)parseLink:(NSString *)text;

//随机生成字符串
+ (NSString *)randomString:(int)length;


//比较两个时间的大小
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

//计算两个时间之差
+ (NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2;

/**
 *  将字符串转为NSDate
 *
 *  @param uiDate 要转的字符串
 *
 *  @return NSDate
 */
+ (NSDate*) convertDateFromString:(NSString*)uiDate;

//获取本地document目录
+ (NSString *)getDocumentFile:(NSString *)fileName;

//判断输入的是否是数字
+ (BOOL)isPureInt:(NSString*)string;

//判断字母和数字组合
+(BOOL)isNumberAndLetter:(NSString *)str;

/**
 *  图片等比缩放
 *
 *  @param scaleImage 想要缩放的图片
 *
 *  @param scale     想要缩放的倍数
 *
 *  @return scale    缩放后的图片
 */
+ (UIImage *)scaleImage:(UIImage *)image proportion:(float)scale;

//将RGB颜色值转为16进制
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;

//隐藏tablView多余的分割线
+ (void)setExtraCellLineHidden: (UITableView *)tableView;

//将UIView转成UIImage
+ (UIImage*)convertViewToImage:(UIView*)v;

//将时间戳转换为时间
+ (NSString *)converDateTime:(NSString *)time;

//将时间戳转换为时间
+ (NSDate *)converDateTime:(NSString *)time dateFormat:(NSString *)dateFormat;

//将时间转为时间戳
+ (NSString *)converCurrentDate:(NSString *)timeStr formatter:(NSString *)formatterStr;

//指定边角花弧形
+ (void)drawViewBorder:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)lineWidth;

+ (void) setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners withColor:(UIColor*) color;

//获取当前汉字或字母的length
+ (int)getToInt:(NSString*)strtemp;

/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

//GCD方式延迟执行某个方法
void RunBlockAfterDelay(NSTimeInterval delay, void (^block)(void));


//只允许输入数字和小数点
+ (BOOL)validateWithString:(NSString*)str number:(NSString *)number;

//图片居中裁剪
+ (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size;

//设置边框
+ (void)setupViewBorder:(UIView *)view cornerRadius:(CGFloat )cornerRadius borderWidth:(CGFloat )borderWidth borderColor:(UIColor *)borderColor;
+ (void)setupViewRadius:(UIView *)view cornerRadius:(CGFloat )cornerRadius;

//图片等比居中
+ (void)cutCurrentImageView:(UIImageView *)imageView;

//根据2个经纬度计算距离
+(double) LantitudeLongitudeDist:(double)lon1 other_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2;

//获得设备型号
+ (NSString *)deviceVersion;

/**
 *  判断昨天、今天、明天
 *
 *  @param date
 *
 *  @return str
 */
+ (NSString *)compareDate:(NSDate *)date;

/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/

+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate;

/**
 *  判断昨天、今天、明天
 *
 *  @param date
 *
 *  @return str
 */
+ (NSString *)transformedValue:(NSDate *)date;

//13位时间戳转换
+ (NSString *)convertDateToString:(NSString *)time;

/**
 *  对label画线
 *
 *  @param label 当前的label
 *  @param length 线条长度
 *  @param color 线条颜色
 */
+ (void)setTextLabelLine:(UILabel *)label withText:(NSString *)text withLineLength:(NSUInteger)length withLineColor:(UIColor *)color;

/**
 *  计算两个时间差，之间相差的天数
 *
 *  @param fromDateTime 开始日期
 *  @param toDateTime   结束日期
 *
 *  @return 天数
 */
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

/**
 *  判断中英混合的字符串长度,中文和中文符号算2个，英文和英文符号算1个，空格算1个
 */
+ (int)convertToInt1:(NSString*)strtemp;

/**
 *  字典转json
 */
+ (NSString *)jsonDataWithInfo:(NSDictionary *)jsonData;



/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  返回一个指定图片大小尺寸的值
 *
 *  @param image   原图片
 *  @param newSize 图片尺寸
 *  
 *  @param representation 图片质量
 *
 *  @return 文件流
 */
+ (NSData *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
            representation:(float) representation;

/**
 *  让图片有毛玻璃状态
 */
+ (UIImage *)applyBlurRadius:(CGFloat)radius toImage:(UIImage *)image;


/**
 *  改变image的frame
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

/**
 *  字符串截取
 *
 *  @param string 字符串
 *  @param range  范围
 *
 *  @return 截取后的字符串
 */
+ (NSString *)substringWitString:(NSString *)string range:(NSRange )range;


+(NSString*)DataTOjsonString:(id)object;

//根据时间戳获取星期几
+ (NSString *)getWeekDayFordate:(long long)data;

+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

//传入 秒  得到 xx:xx:xx
+ (NSString *)getMMSSFromSS:(NSString *)totalTime;

/**
 *  将数组转成json对象
 *
 *  @param data 数组
 */
+ (NSString *)dataToJsonString:(NSArray *)data;

//将服务器13位的时间搓转换为iOS的10位的时间搓
+ (NSString *)handleRemainTime:(NSString *)remainTime;

//计算服务器时间与本地时间的时间差
+ (NSString *)calculationTimeDifference:(NSString *)sysTime;

//13位时间搓转换成时间
// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
+ (NSString *)getDateStringWithTimeStr:(NSString *)str;

//判断文件是否已经在沙盒中已经存在？
+ (BOOL) isFileExist:(NSString *)fileName;

#pragma mark - 定时器 (GCD)
+ (dispatch_source_t)timerWithTimeTotalInterval:(NSInteger)time
                                     invocation:(float)invocation
                                        repeats:(BOOL)yesOrNo
                                 countdownBlock:(void(^)(NSInteger timer))countdownBlock;
//边框线绘制
+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

//判断最多1位小数的正则表达式
+ (BOOL)validateMoney:(NSString *)money;

/**
 *  formatterNumber .00 小数点后两位
 *
 *  @param number
 *
 *  @return
 */
+ (NSString *)y_formatterNumber:(NSNumber *)number;

+ (UIImage *)setupTransitionWithStartColor:(NSString *)startColor
                                  endColor:(NSString *)endColor;

+ (UIImage *)setupTransitionWithFrame:(CGRect)frame
                           startColor:(NSString *)startColor
                             endColor:(NSString *)endColor;

/**
 *
 *  判断用户输入的密码是否符合规范，符合规范的密码要求：
 *  长度大于6位
 *  密码中必须同时包含数字和字母
 */
+(BOOL)judgePassWordLegal:(NSString *)pass;

/**
 *  计算选中的时候的金额
 *  x:选中的数字
 *  y:三、四、五
 */
+(NSInteger)sumBetCount:(NSInteger)x
                      y:(NSInteger)y;

/** 根据汉字返回数字 */
+(NSInteger)getWithNumberWithHanzi:(NSString *)hanzi;

+(int)convertToInt:(NSString*)strtemp;

/*邮箱验证 MODIFIED BY HELENSONG*/
+(BOOL)isValidateEmail:(NSString *)email;

/**
 *  对象转换为字典
 *
 *  @param obj 需要转化的对象
 *
 *  @return 转换后的字典
 */
+ (NSDictionary*)getObjectData:(id)obj;

+ (BOOL) isEmpty:(NSString *) str;

//生成一张毛玻璃图片
+ (UIImage*)blur:(UIImage*)theImage;

+ (UIImageView *)addLine:(CGRect)frame;

//将对象保存为json格式的文件
+ (BOOL)writeStringToFile:(NSString*)aString
                 fileName:(NSString *)fileName;


//读取本地json文件
+ (NSString*)readStringFromFileName:(NSString *)fileName;


// 读取本地JSON或plist等文件
+ (NSDictionary *)readLocalFileWithFileName:(NSString *)fileName ofType:(NSString *)type;

//获取当前时间戳  （以毫秒为单位）
+(NSString *)getNowTimeTimestamp;

+ (UIImage *)decodeBase64:(NSString *)base64String;

+(UIImage *)changeGrayImage:(UIImage *)oldImage;

@end
