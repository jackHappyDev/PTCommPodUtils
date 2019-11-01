//
//  UIImage+changePath.m
//  runtimeImg
//
//  Created by Jack on 14/10/2019.
//  Copyright © 2019 Jack. All rights reserved.
//

#import "UIImage+changePath.h"
#import <objc/message.h>


@implementation UIImage (changePath)

+(void)load
{
//    #if TARGET_IPHONE_SIMULATOR
//        NSLog(@"run on simulator");
//    #define SIMULATOR_TEST
//    #else
    //不定义SIMULATOR_TEST这个宏
        NSLog(@"run on device");
       Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
       Method jzg_imageMethod = class_getClassMethod(self, @selector(jzg_imageNamed:));
       method_exchangeImplementations(imageNamedMethod, jzg_imageMethod);
//    method_exchangeImplementations(imageNamedMethod, imageNamedMethod);

//    #endif
   
}

+ (BOOL)isContainerImageName:(NSString*)imgName{
//    NSArray *arr =@[@"cycle",@"tiptext",@"pgress_top",@"progress_botom",@"1080",@"common_placeholder_circle",@"common_placeholder_horizontal",@"common_placeholder_vertical",@"home_left_website",@"home_websit_logo",@"guide_1",@"guide_2",@"guide_3"];
    NSArray *arr =@[@"cycle",@"tiptext",@"pgress_top",@"progress_botom",@"1080"];
    __block BOOL con;
    [arr enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        con =NO;
        if ([obj isEqualToString:imgName]) {
            con =YES;
            *stop =YES;
        }
    }];
    
    return con;
};

+ (NSString * )getPath
{
    
     //Caches路径
      NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
      //解压目标路径
      NSString *destinationPath =[cachesPath stringByAppendingPathComponent:CommonResource];
     
    return destinationPath;
}


+ (UIImage*)getBundleImage:(NSString*)img{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[img stringByAppendingString:@"@2x"] ofType:@"png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    return image;
};

+ (UIImage *)jzg_imageNamed:(NSString *)name {

    NSString * path = [[self getPath] stringByAppendingPathComponent:name];
    UIImage * image;
    if ([self isContainerImageName:name]) {
        image =[self getBundleImage:name];
    } else {
        image= [[UIImage alloc]initWithContentsOfFile:path];
    }

//    if (image) {
//        NSLog(@"图片加载成功");
//    }else{
//        NSLog(@"图片加载失败");
//    }
    return image;
}

@end
