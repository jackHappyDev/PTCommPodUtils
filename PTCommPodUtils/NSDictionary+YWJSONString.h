//
//  NSDictionary+YWJSONString.h
//  jobs
//
//  Created by amber on 2019/6/15.
//  Copyright © 2019 tank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (YWJSONString)

-(NSString*) yw_jsonStringWithPrettyPrint:(BOOL) prettyPrint;


@end

NS_ASSUME_NONNULL_END
