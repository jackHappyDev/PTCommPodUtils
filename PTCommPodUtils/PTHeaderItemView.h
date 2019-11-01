//
//  PTHeaderItemView.h
//  PlatformTop
//
//  Created by liuyun on 2019/9/19.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTHeaderItemView : UIView

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;

@property (nonatomic,copy)void(^clickIndexBlock)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
