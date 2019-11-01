//
//  BaseViewController.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/6.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTVoiceMananger.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,BackType) {
    BackTypeBack,
    BackTypeDismiss,
};

@interface BaseViewController : UIViewController

@property (nonatomic,assign)BOOL isShowBack;

@property (nonatomic,assign)BOOL isShowTopView;

@property (nonatomic,strong)UIImage *topTitleImg;

@property (nonatomic,strong)UIImage *bgImage;

@property (nonatomic,assign)BackType backType;

@property (nonatomic,strong)PTVoiceMananger *voiceManager;

@end

NS_ASSUME_NONNULL_END
