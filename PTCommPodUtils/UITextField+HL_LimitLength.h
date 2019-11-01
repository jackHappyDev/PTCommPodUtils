//
//  UITextField+HL_LimitLength.h
//  jobs
//
//  Created by amber on 2018/10/2.
//  Copyright © 2018年 tank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (HL_LimitLength)

/**
 *  使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制,配合tools中的方法  可以支持汉字。汉字占2个长度
 *
 *  @param length
 */
- (void)limitTextLength:(int)length;
/**
 *  uitextField 抖动效果
 */
- (void)shake;

@end

NS_ASSUME_NONNULL_END
