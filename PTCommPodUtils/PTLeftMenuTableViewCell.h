//
//  PTLeftMenuTableViewCell.h
//  PlatformTop
//
//  Created by liuyun on 2019/9/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTHomeGameModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PTLeftMenuTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *gameImgView;

@property (nonatomic,strong)PTHomeGameModel *model;

@property (nonatomic,strong)NSDictionary *data;

@end

NS_ASSUME_NONNULL_END
