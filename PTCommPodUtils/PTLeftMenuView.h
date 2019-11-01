//
//  PTLeftMenuView.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTLeftMenuView : UIView

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArray;

@property (nonatomic,copy)void(^clickIndexBlock)(NSInteger index);

@property (nonatomic,strong)NSIndexPath *currentIndexPath;

@end

NS_ASSUME_NONNULL_END
