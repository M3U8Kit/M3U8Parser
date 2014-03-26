//
//  M3U8MediaPlaylist.h
//  M3U8Kit
//
//  Created by Sun Jin on 3/26/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "M3U8SegmentInfoList.h"

@interface M3U8MediaPlaylist : NSObject

@property (readonly, nonatomic, copy) NSString *originalText;
@property (readonly, nonatomic, strong) NSURL *baseURL;

@property (readonly, nonatomic, strong) M3U8SegmentInfoList *segmentList;

- (instancetype)initWithContent:(NSString *)string baseURL:(NSURL *)baseURL;
- (instancetype)initWithContentOfURL:(NSURL *)URL error:(NSError **)error;

@end
