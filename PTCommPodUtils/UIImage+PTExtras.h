//
//  UIImage+PTExtras.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/8.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (PTExtras)

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

@end

NS_ASSUME_NONNULL_END
