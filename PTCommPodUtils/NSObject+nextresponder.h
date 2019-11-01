//
//  UIViewController+nextresponder.h
//  MumMum-Customer
//
//  Created by Onery on 17/7/29.
//  Copyright © 2017年 Mamaqunaer Inc. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface NSObject (nextresponder)
- (UIViewController *)responder:(NSObject *)_s className:(NSString *)_c;
- (UITableViewCell *)cellResponder:(NSObject *)_s className:(NSString *)_c;
@end
