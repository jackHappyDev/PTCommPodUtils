//
//  PTAlertView.m
//  PlatformTop
//
//  Created by liuyun on 2019/8/25.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTAlertView.h"

#define BtnWidht 112 * 0.84
#define BtnHeight 43 * 0.84

@interface PTAlertView ()

@property (nonatomic,copy)PTAlertCancelBlock cancelBlock;
@property (nonatomic,copy)PTAlertFinishBlock finishBlock;

@property (nonatomic,strong)UIWindow    *alertWindow;
@property (nonatomic,strong)UIImageView *backgroundView;
@property (nonatomic,strong)UIButton    *finishBtn;
@property (nonatomic,strong)UIButton    *cancelBtn;
@property (nonatomic,strong)UILabel     *contentLabel;
@property (nonatomic,assign)PTAlertStyle style;
@property (nonatomic,strong)NSString *content;

@end

@implementation PTAlertView

+ (PTAlertView *)showAlertTitle:(NSString *)title
                        content:(NSString *)content
                     alertStyle:(PTAlertStyle)style
                    finishBlock:(PTAlertFinishBlock _Nullable)finishBlock
                    cancelBlock:(PTAlertCancelBlock _Nullable)cancelBlock
{
    PTAlertView *alertView = [[self alloc]initWithAlertTitle:title content:content alertStyle:style finishBlock:finishBlock cancelBlock:cancelBlock];
    return alertView;
}

- (instancetype)initWithAlertTitle:(NSString *)title
                           content:(NSString *)content
                        alertStyle:(PTAlertStyle)style
                       finishBlock:(PTAlertFinishBlock _Nullable)finishBlock
                       cancelBlock:(PTAlertCancelBlock _Nullable)cancelBlock
{
    self = [super init];
    if (self) {
        _style = style;
        _content = content;
        _finishBlock = finishBlock;
        _cancelBlock = cancelBlock;
        [self setupViews];
    }
    return self;
}


- (void)setupViews
{
    [self.alertWindow addSubview:self.view];
    [self.alertWindow addSubview:self.backgroundView];
    [self.backgroundView addSubview:self.cancelBtn];
    [self.backgroundView addSubview:self.finishBtn];
    [self.backgroundView addSubview:self.contentLabel];
    
    if (_style == PTAlertStyleSingle) {
        self.cancelBtn.hidden = YES;
        [self.finishBtn setLeft:self.finishBtn.left - self.finishBtn.width / 2 - 25/2];
    }else{
        
    }
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

- (UIImageView *)backgroundView
{
    if (!_backgroundView) {
        //获取图片的高度，然后等比算出宽度
        UIImage *newImg = [UIImage imageCompressForTitleHeightScale:[UIImage imageNamed:@"common_alert_bg"] targetHeight:ScreenHeight - (65 * 2) ];
        _backgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - newImg.size.width/2, 65,newImg.size.width,newImg.size.height)];
        _backgroundView.userInteractionEnabled = YES;
        _backgroundView.image = [UIImage imageNamed:@"common_alert_bg"];
        
        
        self.view.width = newImg.size.width;
        self.view.height = newImg.size.height;
        
        _backgroundView.transform = CGAffineTransformMakeScale(0.05, 0.05);
        UIView *tempView = _backgroundView;
        [UIView animateWithDuration:.15
                         animations:^{
                             tempView.transform = CGAffineTransformMakeScale(1.05, 1.05);
                         }completion:^(BOOL finish){
                             [UIView animateWithDuration:.15
                                              animations:^{
                                                  tempView.transform = CGAffineTransformMakeScale(0.95, 0.95);
                                              }completion:^(BOOL finish){
                                                  [UIView animateWithDuration:.15
                                                                   animations:^{
                                                                       tempView.transform = CGAffineTransformMakeScale(1, 1);
                                                                   }];
                                              }];
                         }];    }
    return _backgroundView;
}

- (UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        CGFloat startX = self.backgroundView.width /2 -  ((BtnWidht * 2) + 25) /2;
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(startX, self.backgroundView.height - BtnHeight - 40 - 10, BtnWidht, BtnHeight)];
        [_cancelBtn setImage:[UIImage imageNamed:@"common_alert_cancel"] forState:UIControlStateNormal];
        
        @weakify(self)
        [[_cancelBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            @strongify(self)
            if (self.cancelBlock) {
                self.cancelBlock();
            }
            [self hideViews];
        }];
    }
    return _cancelBtn;
}

- (UIButton *)finishBtn
{
    if (!_finishBtn) {
        CGFloat startX = self.cancelBtn.right + 25;
        _finishBtn = [[UIButton alloc]initWithFrame:CGRectMake(startX, self.cancelBtn.top, self.cancelBtn.width, self.cancelBtn.height)];
        [_finishBtn setImage:[UIImage imageNamed:@"common_alert_sure"] forState:UIControlStateNormal];
        
        @weakify(self)
        [[_finishBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            @strongify(self)
            if (self.finishBlock) {
                self.finishBlock();
            }
            [self hideViews];
        }];
    }
    return _finishBtn;
}

- (void)hideViews
{
    [UIView animateWithDuration:.20 animations:^{
        self.backgroundView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.backgroundView.alpha = 0.4;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.07
                         animations:^{
                             //                             self.alertBackgroundView.transform = CGAffineTransformMakeScale(0.35, 0.35);
                             self.backgroundView.alpha = 0;
                         }completion:^(BOOL finish){
                             self.alertWindow.hidden = YES;
                             self.backgroundView.hidden = YES;
                             [self.alertWindow removeFromSuperview];
                             self.alertWindow.rootViewController = nil;
                             self.alertWindow = nil;
                             
                         }];
    }];
}



- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.backgroundView.width - 55, self.backgroundView.height - (self.backgroundView.height - self.cancelBtn.top - 25))];
        _contentLabel.numberOfLines = 4;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = BaseColor;
        _contentLabel.font = kFont(15);
        [_contentLabel setText:self.content lineSpacing:5];
    }
    return _contentLabel;
}

- (void)dealloc
{
    NSLog(@"aad");
}

@end
