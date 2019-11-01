//
//  PTEmptyView.m
//  PlatformTop
//
//  Created by liuyun on 2019/8/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTEmptyView.h"

@implementation PTEmptyView

- (instancetype)initWithFrame:(CGRect)frame emptyType:(PTEmptyType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2 - (151*0.8)/2, self.height / 2 - (99 * 0.8)/2 - 15, 151*0.8, 99 * 0.8)];
        UILabel *tipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, imgView.bottom + 10, self.width - 40, 14)];
        tipsLabel.font = kFont(14);
        tipsLabel.textAlignment = NSTextAlignmentCenter;
        tipsLabel.textColor = TextColorWhite;
        tipsLabel.text = @"暂无数据";
        [self addSubview:tipsLabel];
        
        if (type == PTEmptyTypeNoNetwork) {
            imgView.frame = CGRectMake(self.width/2 - (120*0.76)/2, self.height/2 - (80*0.76)/2 - 15, 120*0.76, 80*0.76);
            tipsLabel.text = @"没有网络";
            tipsLabel.top = imgView.bottom + 10;
            imgView.image = [[UIImage imageNamed:@"empty_no_network"]imageWithBackgroundColor:TextColorWhite];
        }else{
            imgView.image = [[UIImage imageNamed:@"empty_icon"]imageWithBackgroundColor:TextColorWhite];
        }
        
        [self addSubview:imgView];
        
    }
    return self;
}

@end
