//
//  UIActionSheet+Blocks.h
//  Shibui
//
//  Created by Jiva DeVoe on 1/5/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (Blocks) <UIActionSheetDelegate>



+ (id)actionSheetWithTitle:(NSString *)title
		 cancelButtonTitle:(NSString *)cancelButtonTitle
	destructiveButtonTitle:(NSString *)destructiveButtonTitle
		 otherButtonTitles:(NSArray *)otherButtonTitles
		   completionBlock:(void (^)(UIActionSheet* actionSheet, NSInteger selectedButtonIndex)) completionBlock
			   cancelBlock:(void (^)()) cancelBlock;

- (id)   initWithTitle:(NSString *)title
	 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
	 otherButtonTitles:(NSArray *)otherButtonTitles
	   completionBlock:(void (^)(UIActionSheet* actionSheet, NSInteger selectedButtonIndex)) completionBlock
		   cancelBlock:(void (^)()) cancelBlock;

+ (id)actionSheetWithStyle:(UIActionSheetStyle) style
					 title:(NSString *)title
		 cancelButtonTitle:(NSString *)cancelButtonTitle
	destructiveButtonTitle:(NSString *)destructiveButtonTitle
		 otherButtonTitles:(NSArray *)otherButtonTitles
		   completionBlock:(void (^)(UIActionSheet* actionSheet, NSInteger selectedButtonIndex)) completionBlock
			   cancelBlock:(void (^)()) cancelBlock;

- (id)   initWithStyle:(UIActionSheetStyle) style
				 title:(NSString *)title
	 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
	 otherButtonTitles:(NSArray *)otherButtonTitles
	   completionBlock:(void (^)(UIActionSheet* actionSheet, NSInteger selectedButtonIndex)) completionBlock
		   cancelBlock:(void (^)()) cancelBlock;



/** This block is called when the action sheet is dismssed for any reason.
 */

@end
