//
//  M3U8SegmentInfoList.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8SegmentInfoList.h"

#define KeySegmentInfList       @"key.segmentList"

@implementation M3U8SegmentInfoList {
@private
    NSMutableArray  *_segmentInfoList;
}

- (id)init {
    self = [super init];
    if (self) {
        _segmentInfoList = [[NSMutableArray alloc] init];
    }
    
    return self;
}


#pragma mark - NSCopyding
- (id)copyWithZone:(NSZone *)zone {
    M3U8SegmentInfoList *copy = [[[self class] allocWithZone:zone] init];
    
    for (int i = 0; i < [self count]; i++) {
        M3U8SegmentInfo *infoCopy = [[self segmentInfoAtIndex:i] copyWithZone:zone];
        [copy addSegementInfo:infoCopy];
    }
    
    return copy;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_segmentInfoList forKey:KeySegmentInfList];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _segmentInfoList = [aDecoder decodeObjectForKey:KeySegmentInfList];
    }
    
    return self;
}

#pragma mark - Getter && Setter
- (NSUInteger)count {
    return [_segmentInfoList count];
}

#pragma mark - Public
- (void)addSegementInfo:(M3U8SegmentInfo *)segment {
    [_segmentInfoList addObject:segment];
}

- (M3U8SegmentInfo *)segmentInfoAtIndex:(NSUInteger)index {
    return [_segmentInfoList objectAtIndex:index];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", _segmentInfoList];
}

- (NSString *)originalM3U8PlanStringValue {
    NSMutableString *m3u8String = [[NSMutableString alloc] init];
    
    [m3u8String appendString:@"#EXTM3U\n"];
    [m3u8String appendString:@"#EXT-X-TARGETDURATION:32\n"];
    [m3u8String appendString:@"#EXT-X-VERSION:3\n"];
    [m3u8String appendString:@"#EXT-X-DISCONTINUITY\n"];
    
    for (M3U8SegmentInfo *segmentInfo in _segmentInfoList) {
        [m3u8String appendString:[NSString stringWithFormat:@"#EXTINF:%.2f,\n", segmentInfo.duration]];
        [m3u8String appendString:[NSString stringWithFormat:@"%@\n", segmentInfo.mediaURL.absoluteString]];
    }
    [m3u8String appendString:@"#EXT-X-ENDLIST\n"];
    
    NSString *returnString = [m3u8String copy];
    
    return returnString;
}

@end
