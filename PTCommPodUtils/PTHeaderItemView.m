//
//  PTHeaderItemView.m
//  PlatformTop
//
//  Created by liuyun on 2019/9/19.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTHeaderItemView.h"

#define BTN_TAG 30000

@interface PTHeaderItemView ()

@property (nonatomic,strong)UIScrollView *topScrollView;

@end

@implementation PTHeaderItemView

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 0, self.width - 10, 35)];
        _topScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_topScrollView];

        CGFloat btnWidth = 120;
        CGFloat btnHeight = 35;
        for (NSInteger i = 0; i < dataArray.count; i ++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i * (btnWidth + 8), 0, btnWidth, btnHeight)];
            [btn setBackgroundImage:[UIImage imageNamed:@"common_top_normal"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"common_top_selected"] forState:UIControlStateSelected];
            [btn setTitleColor:TopTitleColorSelected forState:UIControlStateSelected];
            [btn setTitleColor:BaseColor forState:UIControlStateNormal];
            [btn setTitle:dataArray[i] forState:UIControlStateNormal];
            btn.titleLabel.font = kFont(14);
            btn.tag = i + BTN_TAG;
            if (i == 0) {
                btn.selected = YES;
            }
            if (i == dataArray.count - 1) {
                [_topScrollView setContentSize:CGSizeMake(btn.right, 0)];
            }
            
            [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_topScrollView addSubview:btn];
        }
    }
    return self;
}

- (void)onClick:(UIButton *)btn
{
    btn.selected = YES;
    for (UIButton *tempBtn in _topScrollView.subviews) {
        if (btn != tempBtn) {
            tempBtn.selected = NO;
        }
    }
    
    if (self.clickIndexBlock) {
        self.clickIndexBlock(btn.tag - BTN_TAG);
    }
}



@end
