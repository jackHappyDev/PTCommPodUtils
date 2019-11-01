//
//  PTEmptyView.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTEmptyType.h"

NS_ASSUME_NONNULL_BEGIN


@interface PTEmptyView : UIView

- (instancetype)initWithFrame:(CGRect)frame emptyType:(PTEmptyType)type;

@end

NS_ASSUME_NONNULL_END
