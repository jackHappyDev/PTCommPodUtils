//
//  PTVoiceMananger.m
//  PlatformTop
//
//  Created by liuyun on 2019/9/11.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTVoiceMananger.h"
#import <AVFoundation/AVFoundation.h>

@interface PTVoiceMananger()

@property (nonatomic,strong)AVAudioPlayer *audioPlay;


@end

@implementation PTVoiceMananger


+ (PTVoiceMananger *)startWithVoiceName:(NSString *)name
{
    PTVoiceMananger *voiceManager = [[self alloc]initWithVoiceName:name];
    return voiceManager;
}

- (instancetype)initWithVoiceName:(NSString *)name
{
    self = [super init];
    if (self) {
        

        NSString *soundPath = [[NSBundle mainBundle]pathForResource:name ofType:@"mp3"];
         AVAudioPlayer *audioPlay ;
               if (soundPath.length>0) {
                   NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
                   audioPlay = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:nil];
               } else {
                   NSString *strUrl =[[self getPath] stringByAppendingPathComponent:[name stringByAppendingString:@".mp3"]];
                   NSData *data =[NSData dataWithContentsOfFile:strUrl];
                   audioPlay = [[AVAudioPlayer alloc] initWithData:data error:nil];
               }
        self.audioPlay =audioPlay;
        //设置声音的大小
        
        NSString *volume = [[NSUserDefaults standardUserDefaults]objectForKey:kBtnVolume];
        if (volume.length == 0) {
            self.audioPlay.volume = 0.5;//范围为（0到1）；
        }else{
            self.audioPlay.volume = volume.floatValue;//范围为（0到1）；
        }
        
        //设为0仅播放一次；设为1则循环1次播放2次；设为-1则循环播放不间断；
        self.audioPlay.numberOfLoops = 0;
        //设置播放进度
        self.audioPlay.currentTime = 0;
        //准备播放
        [self.audioPlay prepareToPlay];
        [self.audioPlay play];
    }
    return self;
}

- (NSString * )getPath
{
     //Caches路径
      NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
      //解压目标路径
      NSString *destinationPath =[cachesPath stringByAppendingPathComponent:@"CommonResource"];
     
    return destinationPath;
}


- (void)dealloc
{
    NSLog(@"声音播放完啦");
}

@end
