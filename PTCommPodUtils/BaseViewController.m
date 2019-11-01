//
//  BaseViewController.m
//  PlatformTop
//
//  Created by liuyun on 2019/8/6.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UIButton    *backBtn;
@property (nonatomic,strong)UIImageView *topBgImgView;
@property (nonatomic,strong)UIImageView *topImgView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _bgImageView.hidden = YES;
    [self.view addSubview:_bgImageView];
    
    self.topBgImgView.hidden = YES;
    [self.view addSubview:self.topBgImgView];
    
    self.backBtn.hidden = YES;
    [self.view addSubview:self.backBtn];
    
    
}


- (void)setBgImage:(UIImage *)bgImage
{
    _bgImage = bgImage;
    _bgImageView.hidden = NO;
    _bgImageView.image = bgImage;
}

- (void)setIsShowBack:(BOOL)isShowBack
{
    if (isShowBack) {
        self.backBtn.hidden = NO;
    }else{
        self.backBtn.hidden = YES;
    }
}

- (void)setIsShowTopView:(BOOL)isShowTopView
{
    if (isShowTopView) {
        self.topBgImgView.hidden = NO;
    }else{
        self.topBgImgView.hidden = YES;
    }
}


- (void)setBackType:(BackType)backType
{
    _backType = backType;
}

- (void)setTopTitleImg:(UIImage *)topTitleImg
{
    if (topTitleImg) {
        [self.view addSubview:self.topImgView];
        self.topImgView.image = topTitleImg;
        self.topImgView.top = self.topBgImgView.height/2 - topTitleImg.size.height/2;
        self.topImgView.width = topTitleImg.size.width;
        self.topImgView.height = topTitleImg.size.height;
    }
}

- (UIImageView *)topBgImgView
{
    if (!_topBgImgView) {
        UIImage *img = [UIImage imageNamed:@"common_top_bg"];
        CGFloat width = img.size.width;
        if (width < ScreenWidth) {
            width = ScreenWidth;
        }
        _topBgImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, TopBarHeight)];
        _topBgImgView.image = [UIImage imageNamed:@"common_top_bg"];
    }
    return _topBgImgView;
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 132 + AdaptNaviHeight, 49)]; //132 + 34
        [_backBtn setBackgroundImage:iPhoneX ? [UIImage imageNamed:@"common_back_iphoneX"] : [UIImage imageNamed:@"common_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (void)backAction
{
    if (_backType == BackTypeDismiss) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (UIImageView *)topImgView
{
    if (!_topImgView) {
        _topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.backBtn.right + 10, 0, 0, 0)];
    }
    return _topImgView;
}

- (void)dealloc
{
    NSLog(@"移除了");
}

@end
