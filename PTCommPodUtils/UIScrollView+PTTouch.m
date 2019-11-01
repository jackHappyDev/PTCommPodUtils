//
//  UIScrollView+PTTouch.m
//  PlatformTop
//
//  Created by liuyun on 2019/9/11.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "UIScrollView+PTTouch.h"
#import <AVFoundation/AVFoundation.h>
#import "PTSlectedItemView.h"
#import "PTPopCollectionViewCell.h"

@implementation UIScrollView (PTTouch)



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    //获取触摸点的集合
    NSSet *allTouches = [event allTouches];
    //获取触摸对象
    UITouch *touch = [allTouches anyObject];
    
    if ([touch.view isKindOfClass:[PTSlectedItemView class]] ||
        [touch.view.superview isKindOfClass:[UICollectionViewCell class]] ||
        [touch.view.superview isKindOfClass:[UITableViewCell class]]) {
        [self playCoinSound];
    }
}

- (void) playCoinSound {
    
    NSString *soundPath = [[NSBundle mainBundle]pathForResource:@"button_tap" ofType:@"mp3"];
     AVAudioPlayer *audioPlay ;
          if (soundPath.length>0) {
              NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
              audioPlay = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:nil];
          } else {
              NSString *strUrl =[[self getPath] stringByAppendingPathComponent:@"button_tap.mp3"];
              NSData *data =[NSData dataWithContentsOfFile:strUrl];
              audioPlay = [[AVAudioPlayer alloc] initWithData:data error:nil];
          }
    //设置声音的大小
    
    NSString *volume = [[NSUserDefaults standardUserDefaults]objectForKey:kBtnVolume];
    if (volume.length == 0) {
        audioPlay.volume = 0.5;//范围为（0到1）；
    }else{
        audioPlay.volume = volume.floatValue;//范围为（0到1）；
    }
    
    //设为0仅播放一次；设为1则循环1次播放2次；设为-1则循环播放不间断；
    audioPlay.numberOfLoops = 0;
    //设置播放进度
    audioPlay.currentTime = 0;
    //准备播放
    [audioPlay prepareToPlay];
    [audioPlay play];
    self.audioPlay = audioPlay;
}

- (NSString * )getPath
{
     //Caches路径
      NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
      //解压目标路径
      NSString *destinationPath =[cachesPath stringByAppendingPathComponent:CommonResource];
     
    return destinationPath;
}



- (AVAudioPlayer *)audioPlay {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAudioPlay:(AVAudioPlayer *)audioPlay
{
    objc_setAssociatedObject(self, @selector(audioPlay), audioPlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//- (CGFloat)volume {
//    NSNumber *volume = objc_getAssociatedObject(self, (__bridge const void *)(AUDIO_VOLUME));
//    return volume.floatValue;
//}
//
//- (void)setVolume:(CGFloat)volume {
//    
//    objc_setAssociatedObject(self, (__bridge const void *)(AUDIO_VOLUME), @(volume), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    self.audioPlay.volume = volume;
//}


@end
