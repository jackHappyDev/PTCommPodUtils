//
//  UINavigationItem+ItemrSpace.m
//  MumMum-Seller
//
//  Created by shlity on 16/9/22.
//  Copyright © 2016年 Moresing Inc. All rights reserved.
//

#import "UINavigationItem+ItemrSpace.h"

@implementation UINavigationItem (ItemrSpace)

//- (void)setLeftBarButtonItem:(UIBarButtonItem *)_leftBarButtonItem
//{
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
//    {
//        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        negativeSeperator.width = -16;//此处修改到边界的距离，请自行测试
//        
//        if (_leftBarButtonItem)
//        {
//            [self setLeftBarButtonItems:@[negativeSeperator, _leftBarButtonItem]];
//        }
//        else
//        {
//            [self setLeftBarButtonItems:@[negativeSeperator]];
//        }
//        
//    }
//    else
//    {
//        [self setLeftBarButtonItem:_leftBarButtonItem animated:NO];
//    }
//}

- (void)setRightBarButtonItem:(UIBarButtonItem *)_rightBarButtonItem withSeperator:(CGFloat)seperator;
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSeperator.width = seperator ? seperator : -12;//此处修改到边界的距离，请自行测试
        
        if (_rightBarButtonItem)
        {
            [self setRightBarButtonItems:@[negativeSeperator, _rightBarButtonItem]];
        }
        else
        {
            [self setRightBarButtonItems:@[negativeSeperator]];
        }
        
    }
    else
    {
        [self setRightBarButtonItem:_rightBarButtonItem animated:NO];
    }
}

@end
