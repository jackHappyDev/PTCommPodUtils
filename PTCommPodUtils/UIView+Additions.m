//
//  UIView+Additions.m
//  妈妈去哪儿
//
//  Created by amber on 15-10-17.
//  Copyright (c) 2015年 amber. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (UIViewController *)viewController
{
    UIResponder *next = [self nextResponder];  //拿到下一个响应者，就是UIResponder的子类
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        else{
            next = [next nextResponder];  //如果没有找到就继续我往上找
        }
    } while (next != nil);
    
    
    return nil;
}

@end
