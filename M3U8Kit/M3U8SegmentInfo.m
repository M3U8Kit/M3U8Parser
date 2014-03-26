//
//  M3U8SegmentInfo.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8SegmentInfo.h"

@interface M3U8SegmentInfo()
@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation M3U8SegmentInfo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.dictionary = dictionary;
    }
    return self;
}

- (NSURL *)baseURL {
    return self.dictionary[M3U8_BASE_URL];
}

- (NSURL *)mediaURL {
    return [NSURL URLWithString:self.URI relativeToURL:self.baseURL];
}

- (NSTimeInterval)duration {
    return [self.dictionary[M3U8_EXTINF_DURATION] doubleValue];
}

- (NSString *)URI {
    return self.dictionary[M3U8_EXTINF_URI];
}

@end
