//
//  UISwitch+SetImage.m
//  MumMum-Customer
//
//  Created by lfy on 2017/7/21.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//

#import "UISwitch+SetImage.h"

@implementation UISwitch (SetImage)

-(void)setMyOnImage:(UIImage *)myOnImage{
    [self cleanOriginImage];
    UIView *elementView = self.subviews[0];
    UIView *result = elementView.subviews[2];
    
    UIImageView *newView = [UIImageView new];
    newView.tag = 100;
    newView.contentMode = UIViewContentModeScaleAspectFit;
    newView.image = myOnImage;
    [result addSubview:newView];
    [newView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height).multipliedBy(2);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(result.mas_left).mas_offset(0.5*ViewScaleValue);
    }];
    
    
}

-(void)setMyOffImage:(UIImage *)myOffImage{
    [self cleanOriginImage];
    UIView *elementView = self.subviews[0];
    UIView *result = elementView.subviews[2];//此view包含两个imageView
    
    UIImageView *newView = [UIImageView new];
    newView.contentMode = UIViewContentModeScaleAspectFit;
    newView.image = myOffImage;
    newView.tag = 101;
    [result addSubview:newView];
    [newView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(result.mas_height).multipliedBy(0.35);
        make.height.mas_equalTo(result.mas_height).multipliedBy(0.35);
        make.centerY.mas_equalTo(result.mas_centerY);
        make.right.mas_equalTo(result.mas_right).with.offset(-(result.bounds.size.width * 0.5  - result.bounds.size.height * 0.35) * 0.5);
        
        
    }];
    
}


//把原有ImageView隐藏
-(void)cleanOriginImage{
    
    UIView *elementView = self.subviews[0];
    UIView *result = elementView.subviews[2];//此view包含两个imageView
    for (UIImageView * item in result.subviews) {
        if ( [item isKindOfClass:[UIImageView class]] && item.tag != 100 && item.tag != 101) {
            item.hidden = YES;
        }
    }
    
}

@end
