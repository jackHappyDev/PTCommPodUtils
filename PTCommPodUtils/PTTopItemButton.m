//
//  PTTopItemButton.m
//  PlatformTop
//
//  Created by liuyun on 2019/9/21.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTTopItemButton.h"

@implementation PTTopItemButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        imgView.image = [UIImage imageNamed:@"common_title_bg"];
        imgView.userInteractionEnabled = YES;
        [self addSubview:imgView];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, -1, self.width, self.height)];
        self.titleLabel.font = kFont(16);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = TextButtonTitleColor;
        [imgView addSubview:self.titleLabel];
    }
    return self;
}

@end
