//
//  M3U8ExtXMediaList.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/25/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#define KeyM3u8InfoList       @"key.m3u8InfoList"

#import "M3U8ExtXMediaList.h"

@interface M3U8ExtXMediaList ()

@property (nonatomic, strong) NSMutableArray *m3u8InfoList;

@end

@implementation M3U8ExtXMediaList

- (id)init {
    if (self = [super init]) {
        self.m3u8InfoList = [NSMutableArray array];
    }
    return self;
}

- (NSUInteger)count {
    return self.m3u8InfoList.count;
}

- (void)addExtXMedia:(M3U8ExtXMedia *)extXMedia {
    if (extXMedia) {
        [self.m3u8InfoList addObject:extXMedia];
    }
}

- (M3U8ExtXMedia *)extXMediaAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self.m3u8InfoList objectAtIndex:index];
}

- (M3U8ExtXMedia *)firstExtXMedia {
    return self.m3u8InfoList.firstObject;
}

- (M3U8ExtXMedia *)lastExtXMedia {
    return self.m3u8InfoList.lastObject;
}

- (M3U8ExtXMediaList *)audioList {
    M3U8ExtXMediaList *audioList = [[M3U8ExtXMediaList alloc] init];
    NSArray *copy = [self.m3u8InfoList copy];
    for (M3U8ExtXMedia *media in copy) {
        if ([media.type isEqualToString:@"AUDIO"]) {
            [audioList addExtXMedia:media];
        }
    }
    return audioList;
}

- (M3U8ExtXMediaList *)videoList {
    M3U8ExtXMediaList *videoList = [[M3U8ExtXMediaList alloc] init];
    NSArray *copy = [self.m3u8InfoList copy];
    for (M3U8ExtXMedia *media in copy) {
        if ([media.type isEqualToString:@"VIDEO"]) {
            [videoList addExtXMedia:media];
        }
    }
    return videoList;
}

- (M3U8ExtXMediaList *)subtitleList {
    M3U8ExtXMediaList *subtitleList = [[M3U8ExtXMediaList alloc] init];
    NSArray *copy = [self.m3u8InfoList copy];
    for (M3U8ExtXMedia *media in copy) {
        if ([media.type isEqualToString:@"SUBTITLES"]) {
            [subtitleList addExtXMedia:media];
        }
    }
    return subtitleList;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    M3U8ExtXMediaList *copy = [[M3U8ExtXMediaList allocWithZone:zone] init];
    copy.m3u8InfoList = [self.m3u8InfoList copy];
    
    return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.m3u8InfoList = [aDecoder decodeObjectForKey:KeyM3u8InfoList];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.m3u8InfoList forKey:KeyM3u8InfoList];
}

@end
