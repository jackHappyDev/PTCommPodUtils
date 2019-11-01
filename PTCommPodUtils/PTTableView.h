//
//  PTTableView.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "PTEmptyType.h"

NS_ASSUME_NONNULL_BEGIN



typedef void(^MJHeaderBlock) (void);
typedef void(^MJFooterBlock) (void);


@interface PTTableView : UITableView

@property (nonatomic,copy)MJHeaderBlock addHeaderBlock;
@property (nonatomic,copy)MJFooterBlock addFooterBlock;

@property (nonatomic,assign)BOOL endHeaderRefresh;
@property (nonatomic,assign)BOOL endFooterRefresh;

- (void)addMJHeader:(MJHeaderBlock)block;

- (void)addMJFooter:(MJFooterBlock)block;



@property (nonatomic,assign) PTEmptyType type;


@end

NS_ASSUME_NONNULL_END
