//
//  NSDictionary+YWJSONString.m
//  jobs
//
//  Created by amber on 2019/6/15.
//  Copyright © 2019 tank. All rights reserved.
//

#import "NSDictionary+YWJSONString.h"

@implementation NSDictionary (YWJSONString)

-(NSString*) yw_jsonStringWithPrettyPrint:(BOOL) prettyPrint{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"%s: error: %@", __func__, error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}


@end
