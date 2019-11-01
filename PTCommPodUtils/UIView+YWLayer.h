//
//  UIView+YWLayer.h
//  jobs
//
//  Created by tank on 2019/2/15.
//  Copyright © 2019年 tank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YWLayer)

/**
 圆角
 使用自动布局，需要在layoutsubviews 中使用
 @param radius 圆角尺寸
 @param corner 圆角位置
 */
- (void)acs_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner;

@end

NS_ASSUME_NONNULL_END
