//
//  UILabel+LineSpacing.m
//  妈妈去哪儿
//
//  Created by shlity on 16/7/22.
//  Copyright © 2016年 shlity. All rights reserved.
//

#import "UILabel+LineSpacing.h"
#import "NSMutableAttributedString+Color.h"


@implementation UILabel (LineSpacing)

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    [attributedString addAttribute:NSBaselineOffsetAttributeName value:@(0) range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}

+ (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width height:(CGFloat)height lineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


+ (CGFloat)getSpaceLabelWithHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width height:(CGFloat)height lineSpacing:(CGFloat)lineSpacing {
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    label.font = font;
    label.numberOfLines = 0;
    
    if (str.length == 0 || [UIUtils isEmpty:str]) {
        [label setText:str lineSpacing:0];
    }else{
        [label setText:str lineSpacing:lineSpacing];
    }
    [label sizeToFit];

    //只有1行的情况下就取testLabel的高度
    NSInteger count = (label.height) / label.font.lineHeight;
    if (count == 1) {
        CGSize textSize = [str sizeWithFont:font maxSize:CGSizeMake(width, 20)];
        label.height = textSize.height;
    }
    
    return label.height;
}

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)textColor withText:(NSString *)keyword;
 {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
     [attributedString setColorForText:keyword withColor:textColor];
    self.attributedText = attributedString;
}


@end
