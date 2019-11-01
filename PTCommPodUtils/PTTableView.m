//
//  PTTableView.m
//  PlatformTop
//
//  Created by liuyun on 2019/8/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTTableView.h"
#import "PTEmptyView.h"
#import "PTCustomNormalHeader.h"
#import "PTCustomNormalFooter.h"

@interface PTTableView()<CYLTableViewPlaceHolderDelegate>

@end

@implementation PTTableView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initWithConfig];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initWithConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithConfig];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initWithConfig];
    }
    return self;
}

- (void)initWithConfig {
    
    self.backgroundColor = [UIColor clearColor];
//    self.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.delaysContentTouches = NO;
//    self.canCancelContentTouches = YES;
    self.showsVerticalScrollIndicator = NO;
    [UIUtils setExtraCellLineHidden:self];
}

-(void)addMJHeader:(MJHeaderBlock)block{
    self.mj_header = [PTCustomNormalHeader headerWithRefreshingBlock:^{
        block();
    }];
    //[self.mj_header beginRefreshing];
}

-(void)addMJFooter:(MJFooterBlock)block{
    self.mj_footer = [PTCustomNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
}

- (void)setEndHeaderRefresh:(BOOL)endHeaderRefresh
{
    if (endHeaderRefresh) {
        [self.mj_header endRefreshing];
    }
}

- (void)setEndFooterRefresh:(BOOL)endFooterRefresh
{
    if (endFooterRefresh) {
        [self.mj_footer endRefreshing];
    }
}

- (void)setAddHeaderBlock:(MJHeaderBlock)addHeaderBlock
{
    self.mj_header = [PTCustomNormalHeader headerWithRefreshingBlock:^{
        addHeaderBlock();
    }];
}

- (void)setAddFooterBlock:(MJFooterBlock)addFooterBlock
{
    self.mj_footer = [PTCustomNormalFooter footerWithRefreshingBlock:^{
        addFooterBlock();
    }];
}


- (void)setType:(PTEmptyType)type
{
    _type = type;
}

- (UIView *)makePlaceHolderView
{
    return [[PTEmptyView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height) emptyType:_type];
}

- (BOOL)enableScrollWhenPlaceHolderViewShowing
{
    return YES;
}

@end
