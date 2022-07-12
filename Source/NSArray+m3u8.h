//
//  NSArray+m3u8.h
//  M3U8Kit
//
//  Created by Frank on 2022/7/12.
//  Copyright © 2022 M3U8Kit. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (m3u8)

/** @return "key=value" transform to dictionary */
- (NSMutableDictionary *)m3u_attributesFromAssignmentByMark:(NSString *)mark;

@end

NS_ASSUME_NONNULL_END
