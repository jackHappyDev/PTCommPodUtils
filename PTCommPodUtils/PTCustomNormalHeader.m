//
//  PTCustomNormalHeader.m
//  PlatformTop
//
//  Created by liuyun on 2019/9/20.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTCustomNormalHeader.h"

@implementation PTCustomNormalHeader

- (void)prepare
{
    [super prepare];
    
    self.lastUpdatedTimeLabel.textColor = TextColorWhite;
    self.stateLabel.textColor = TextColorWhite;
}

@end
