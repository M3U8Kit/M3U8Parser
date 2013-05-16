//
//  NSURL+m3u8.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "NSURL+m3u8.h"

@implementation NSURL (m3u8)

- (NSString *)m3u8PlanString {
    NSString *planString = [NSString stringWithContentsOfURL:self
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    return planString;
}

@end
