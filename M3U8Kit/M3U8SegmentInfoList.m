//
//  M3U8SegmentInfoList.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8SegmentInfoList.h"

#define KeyOriginalText         @"key.originalText"
#define KeyBaseURL              @"key.baseURL"
#define KeySegmentInfList       @"key.segmentList"

@interface M3U8SegmentInfoList ()

@property (nonatomic, copy) NSString *originalText;
@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) NSMutableArray *segmentInfoList;

@end

@implementation M3U8SegmentInfoList

- (id)init {
    return [self initWithBaseURL:nil];
}

- (id)initWithBaseURL:(NSURL *)URL {
    if (self = [super init]) {
        self.segmentInfoList = [NSMutableArray array];
        self.baseURL = URL;
    }
    return self;
}

#pragma mark - NSCopyding
- (id)copyWithZone:(NSZone *)zone {
    M3U8SegmentInfoList *copy = [[[self class] allocWithZone:zone] init];
    copy.originalText = self.originalText;
    copy.baseURL = [self.baseURL copy];
    
    for (int i = 0; i < [self count]; i++) {
        M3U8SegmentInfo *infoCopy = [[self segmentInfoAtIndex:i] copyWithZone:zone];
        [copy addSegementInfo:infoCopy];
    }
    
    return copy;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.originalText forKey:KeyOriginalText];
    [aCoder encodeObject:self.baseURL forKey:KeyBaseURL];
    [aCoder encodeObject:self.segmentInfoList forKey:KeySegmentInfList];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.originalText = [aDecoder decodeObjectForKey:KeyOriginalText];
        self.baseURL = [aDecoder decodeObjectForKey:KeyBaseURL];
        self.segmentInfoList = [aDecoder decodeObjectForKey:KeySegmentInfList];
    }
    
    return self;
}

#pragma mark - Getter && Setter
- (NSUInteger)count {
    return [self.segmentInfoList count];
}

#pragma mark - Public
- (void)addSegementInfo:(M3U8SegmentInfo *)segment {
    if (segment) {
        [self.segmentInfoList addObject:segment];
    }
}

- (M3U8SegmentInfo *)segmentInfoAtIndex:(NSUInteger)index {
    return [self.segmentInfoList objectAtIndex:index];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.segmentInfoList];
}

@end
