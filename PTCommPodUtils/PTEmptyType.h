//
//  Header.h
//  PlatformTop
//
//  Created by liuyun on 2019/8/14.
//  Copyright © 2019 liuyun. All rights reserved.
//

#ifndef Header_h
#define Header_h

/**
 无数据或无网络的展位图
 
 - PTEmptyTypeNoNetwork: 无网络
 - PTEmptyTypeNoData: 无数据
 */
typedef NS_ENUM(NSInteger, PTEmptyType) {
    PTEmptyTypeNoData  = 0,
    PTEmptyTypeNoNetwork = 1,
};


#endif /* Header_h */
