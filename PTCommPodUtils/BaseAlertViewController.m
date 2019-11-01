//
//  BaseAlertViewController.m
//  PlatformTop
//
//  Created by liuyun on 2019/8/9.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "BaseAlertViewController.h"

@interface BaseAlertViewController ()

@property (nonatomic,strong)UIWindow    *alertWindow;
@property (nonatomic,strong)UIImage     *backgroundImg;
@property (nonatomic,strong)UIButton    *closeButton;
@property (nonatomic,assign)CGRect      defaultBgFrame;
@property (nonatomic,strong)UIImageView *titleImgView;

@end

@implementation BaseAlertViewController

+ (BaseAlertViewController *)showWithBackgroundImg:(UIImage *)image
                                              data:(id)data
                                       finishBlock:(PTBaseAlertFinishBlock _Nullable)finishBlock
                                       cancelBlock:(PTBaseAlertCancelBlock)cancelBlock
{
    return [[self alloc]initWithBackgroundImg:image data:data finishBlock:finishBlock cancelBlock:cancelBlock];
}


- (instancetype )initWithBackgroundImg:(UIImage *)image
                                  data:(id)data
                           finishBlock:(PTBaseAlertFinishBlock _Nullable)finishBlock
                               cancelBlock:(PTBaseAlertCancelBlock)cancelBlock
{
    self = [super init];
    if (self) {
        _data = data;
        _backgroundImg = image;
        _cancelBlock = cancelBlock;
        _finishBlock = finishBlock;
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    [self.alertWindow addSubview:self.view];
    [self.view addSubview:self.alertBackgroundView];
    [self.alertBackgroundView addSubview:self.closeButton];
}

#pragma mark -- UI
- (UIWindow *)alertWindow
{
    if (!_alertWindow) {
        _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.windowLevel = UIWindowLevelAlert + 1;
        _alertWindow.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        [_alertWindow makeKeyAndVisible];
        _alertWindow.rootViewController = self;
    }
    return _alertWindow;
}

- (UIImageView *)alertBackgroundView
{
    if (!_alertView) {
        //获取图片的高度，然后等比算出宽度
        UIImage *newImg = [UIImage imageCompressForTitleHeightScale:self.backgroundImg targetHeight:ScreenHeight - (30 * 2) ];
        _alertView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - newImg.size.width/2, 30,newImg.size.width,newImg.size.height)];
        _alertView.userInteractionEnabled = YES;
        _alertView.image = self.backgroundImg;
        self.defaultBgFrame = _alertView.frame;
        
        CGSize tempSize = self.view.size;
        
        self.view.width = newImg.size.width;
        self.view.height = newImg.size.height;
        

        _alertView.transform = CGAffineTransformMakeScale(0.05, 0.05);
        UIView *tempView = _alertView;
        
        [UIView animateWithDuration:.15 animations:^{
            tempView.transform = CGAffineTransformMakeScale(1.05, 1.05);
            
        }completion:^(BOOL finish){
            
            [UIView animateWithDuration:.15 animations:^{
                tempView.transform = CGAffineTransformMakeScale(0.95, 0.95);
            }completion:^(BOOL finish){
                
                [UIView animateWithDuration:.15 animations:^{
                    tempView.transform = CGAffineTransformMakeScale(1, 1);
                    self.view.size = tempSize;
                }];
            }];
        }];
    }
    return _alertView;
}

- (void)setTitleImage:(UIImage *)titleImage
{
    self.titleImgView.image = titleImage;
    [self.alertBackgroundView addSubview:self.titleImgView];
}

- (UIImageView *)titleImgView
{
    if (!_titleImgView) {
        _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                     4,
                                                                     self.defaultBgFrame.size.width,
                                                                     49 * ViewScaleValue)];
        _titleImgView.contentMode = UIViewContentModeCenter;
    }
    return _titleImgView;
}

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [[UIButton alloc]initWithFrame:CGRectMake(self.defaultBgFrame.size.width  - 28,self.defaultBgFrame.origin.y - 50 ,50, 50)];
        [_closeButton setImage:[UIImage imageNamed:@"commen_btn_popup_close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *otherClose = [[UIButton alloc]initWithFrame:CGRectMake(self.alertBackgroundView.right - 30, 10, 50, 40)];
        [otherClose addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        [self.alertWindow addSubview:otherClose];
    }
    return _closeButton;
}

#pragma mark -- action
- (void)closeAction
{
    [self hideViews];
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

- (void)hideViews
{
    [UIView animateWithDuration:.20 animations:^{
        self.alertBackgroundView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.alertBackgroundView.alpha = 0.4;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.07
                         animations:^{
//                             self.alertBackgroundView.transform = CGAffineTransformMakeScale(0.35, 0.35);
                             self.alertBackgroundView.alpha = 0;
                         }completion:^(BOOL finish){
                             self.alertWindow.hidden = YES;
                             self.alertBackgroundView.hidden = YES;
                             [self.alertWindow removeFromSuperview];
                             self.alertWindow.rootViewController = nil;
                             self.alertWindow = nil;
                             
                         }];
    }];
}

- (void)dismiss:(BOOL)animations
{
    if (animations) {
        [self hideViews];
    }else{
        self.alertWindow.hidden = YES;
        self.alertBackgroundView.hidden = YES;
        [self.alertWindow removeFromSuperview];
        self.alertWindow.rootViewController = nil;
        self.alertWindow = nil;
    }
}

- (void)dealloc
{
    NSLog(@"移除了");
}

@end
