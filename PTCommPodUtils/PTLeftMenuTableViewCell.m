//
//  PTLeftMenuTableViewCell.m
//  PlatformTop
//
//  Created by liuyun on 2019/9/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTLeftMenuTableViewCell.h"

@implementation PTLeftMenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _gameImgView = [[UIImageView alloc]init];
        [self.contentView addSubview:_gameImgView];
        [_gameImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self.contentView);
        }];
    }
    return self;
}


- (void)setModel:(PTHomeGameModel *)model
{
    self.gameImgView.image = [UIImage imageNamed:model.gameImgNormal];
}

- (void)setData:(NSDictionary *)data
{
    NSString *gameImgNormal = data[@"gameImgNormal"];
    self.gameImgView.image = [UIImage imageNamed:gameImgNormal];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
