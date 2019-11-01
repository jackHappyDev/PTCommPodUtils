//
//  UILabel+VerticalUpAlignment.m
//  妈妈去哪儿
//
//  Created by shlity on 15/9/2.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#import "UILabel+VerticalUpAlignment.h"

@implementation UILabel (VerticalUpAlignment)


- (void)verticalUpAlignmentWithText:(NSString *)text maxHeight:(CGFloat)maxHeight
{
    self.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
    CGRect frame = self.frame;
    self.numberOfLines = 0;
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(frame.size.width, maxHeight) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    frame.size = CGSizeMake(frame.size.width, size.height);
    self.frame = frame;
    self.text = text;
}

@end
