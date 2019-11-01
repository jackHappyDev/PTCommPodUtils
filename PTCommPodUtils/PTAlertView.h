//
//  PTAlertView.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/25.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 按钮数量

 - PTAlertStyleSingle: 直选显示一个确定按钮
 - PTAlertStyleDouble: 分别显示确定和取消按钮
 */
typedef NS_ENUM(NSInteger,PTAlertStyle) {
    PTAlertStyleSingle,
    PTAlertStyleDouble,
};

typedef void(^PTAlertCancelBlock)(void);
typedef void(^PTAlertFinishBlock)(void);


@interface PTAlertView : UIViewController

+ (PTAlertView *)showAlertTitle:(NSString *)title
                        content:(NSString *)content
                     alertStyle:(PTAlertStyle)style
                    finishBlock:(PTAlertFinishBlock _Nullable)finishBlock
                    cancelBlock:(PTAlertCancelBlock _Nullable)cancelBlock;



@end

NS_ASSUME_NONNULL_END
