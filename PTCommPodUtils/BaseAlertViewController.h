//
//  BaseAlertViewController.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/9.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PTBaseAlertCancelBlock)(void);
typedef void(^PTBaseAlertFinishBlock)(id _Nullable value);

@interface BaseAlertViewController : UIViewController

@property (nonatomic,strong)UIImageView *alertView;
@property (nonatomic,copy)PTBaseAlertCancelBlock cancelBlock;
@property (nonatomic,copy)PTBaseAlertFinishBlock finishBlock;
@property (nonatomic,assign)id data;
@property (nonatomic,strong)UIImage *titleImage;

+ (BaseAlertViewController *)showWithBackgroundImg:(UIImage *)image
                                              data:(id _Nullable)data
                                       finishBlock:(PTBaseAlertFinishBlock _Nullable)finishBlock
                                       cancelBlock:(PTBaseAlertCancelBlock _Nullable)cancelBlock;

- (instancetype )initWithBackgroundImg:(UIImage *)image
                                  data:(id )data
                           finishBlock:(PTBaseAlertFinishBlock _Nullable)finishBlock
                           cancelBlock:(PTBaseAlertCancelBlock)cancelBlock;

- (void)dismiss:(BOOL)animations;

@property (nonatomic,strong)PTVoiceMananger *voiceManager;

@end

NS_ASSUME_NONNULL_END
