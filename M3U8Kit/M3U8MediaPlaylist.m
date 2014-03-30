//
//  M3U8MediaPlaylist.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/26/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import "M3U8MediaPlaylist.h"

@interface M3U8MediaPlaylist()

@property (nonatomic, copy) NSString *originalText;
@property (nonatomic, strong) NSURL *baseURL;

@property (nonatomic, strong) M3U8SegmentInfoList *segmentList;

@end

@implementation M3U8MediaPlaylist

- (instancetype)initWithContent:(NSString *)string baseURL:(NSURL *)baseURL {
    if (NO == [string isMediaPlaylist]) {
        return nil;
    }
    if (self = [super init]) {
        self.originalText = string;
        self.baseURL = baseURL;
        self.segmentList = [string m3u8SegementInfoListValueRelativeToURL:baseURL];
        self.type = -1;
    }
    return self;
}

- (instancetype)initWithContentOfURL:(NSURL *)URL error:(NSError **)error {
    if (nil == URL) {
        return nil;
    }
    NSString *string = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:error];
    return [self initWithContent:string baseURL:URL];
}

@end
