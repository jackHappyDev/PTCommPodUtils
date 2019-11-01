//
//  NSMutableAttributedString+Color.h
//  MumMum-Seller
//
//  Created by shlity on 16/10/12.
//  Copyright © 2016年 Moresing Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Color)

-(void)setColorForText:(NSString*) textToFind withColor:(UIColor*) color;

-(void)setFontForText:(NSString*) textToFind withFont:(UIFont*) font;

@end
