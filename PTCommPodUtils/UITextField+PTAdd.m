//
//  UITextField+PTAdd.m
//  PlatformTop
//
//  Created by liuyun on 2019/10/4.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "UITextField+PTAdd.h"

@implementation UITextField (PTAdd)



- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    objc_setAssociatedObject(self, @selector(placeholderColor), placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setupPlaceholderColor:self.placeholderColor placeholderFont:self.placeholderFont];
}

- (UIFont *)placeholderFont
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    objc_setAssociatedObject(self, @selector(placeholderFont), placeholderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setupPlaceholderColor:self.placeholderColor placeholderFont:self.placeholderFont];
}

- (void)setupPlaceholderColor:(UIColor *)placeholderColor
              placeholderFont:(UIFont *)placeholderFont
{
    if (placeholderFont == nil) {
        placeholderFont = self.font;
    }
    
    NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : placeholderColor, NSFontAttributeName : placeholderFont}];
    
    self.attributedPlaceholder = placeholderString;
}

@end
