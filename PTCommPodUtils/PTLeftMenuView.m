//
//  PTLeftMenuView.m
//  PlatformTop
//
//  Created by liuyun on 2019/8/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTLeftMenuView.h"
#import "PTLeftMenuTableViewCell.h"

@interface PTLeftMenuView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSIndexPath *lastIndexPath;

@end

@implementation PTLeftMenuView

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = dataArray;
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        imgView.image = [UIImage imageNamed:@"left_menu_bg"];
        [self addSubview:imgView];
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 10)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setBackgroundColor:[UIColor clearColor]];
        [UIUtils setExtraCellLineHidden:_tableView];
        [self addSubview:_tableView];
        
    }
    return self;
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identityCell = @"cell";
    PTLeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identityCell];
    if (!cell) {
        cell = [[PTLeftMenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identityCell];
    }
    
    NSDictionary *data = self.dataArray[indexPath.row];
    NSString *gameImgSelect = data[@"gameImgSelect"];
    NSString *gameImgNormal = data[@"gameImgNormal"];
    cell.data = data;
    
    if (!self.lastIndexPath) {
        if (indexPath.row == 0) {
            cell.gameImgView.image = [UIImage imageNamed:gameImgSelect];
        }else{
            cell.gameImgView.image = [UIImage imageNamed:gameImgNormal];
        }
    }else{
        if (self.lastIndexPath == indexPath) {
            cell.gameImgView.image = [UIImage imageNamed:gameImgSelect];
        }else{
            cell.gameImgView.image = [UIImage imageNamed:gameImgNormal];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setCurrentIndexPath:indexPath];
}

- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath
{
    NSDictionary *data = self.dataArray[currentIndexPath.row];
    NSString *currentGameImgSelect = data[@"gameImgSelect"];
    
    NSDictionary *oldData = self.dataArray[self.lastIndexPath.row];
    NSString *oldGameImgNormal = oldData[@"gameImgNormal"];
    
    if (currentIndexPath == self.lastIndexPath) {
        return;
    }
    
    if (!self.lastIndexPath) {
        PTLeftMenuTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.gameImgView.image = [UIImage imageNamed:self.dataArray[0][@"gameImgNormal"]];
    }
    
    PTLeftMenuTableViewCell *currentCell = [self.tableView cellForRowAtIndexPath:currentIndexPath];
    currentCell.gameImgView.image = [UIImage imageNamed:currentGameImgSelect];
    
    PTLeftMenuTableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.lastIndexPath];
    cell.gameImgView.image = [UIImage imageNamed:oldGameImgNormal];
    
    self.lastIndexPath = currentIndexPath;
    
    if (self.clickIndexBlock) {
        self.clickIndexBlock(currentIndexPath.row);
    }
}

@end

