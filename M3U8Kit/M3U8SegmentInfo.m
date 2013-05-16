//
//  M3U8SegmentInfo.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8SegmentInfo.h"

// key for Copying
NSString *keyM3U8SegmentDuration = @"key.M3U8SegmentDuration";
NSString *keyM3U8SegmentMediaURLString = @"key.M3U8SegmentMediaURLString";

// key for Coding
#define KeySegmentDuration      @"key.SegmentDuration"
#define KeyMeidaURL             @"key.MediaURL"

@implementation M3U8SegmentInfo

- (id)initWithDictionary:(NSDictionary *)params {
    self = [super init];
    if (self) {
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            if ([key isEqualToString:keyM3U8SegmentDuration]) {
                _duration = [obj doubleValue];
            } else if ([key isEqualToString:keyM3U8SegmentMediaURLString]) {
                if ((NSNull *)obj != [NSNull null]) {
                    NSURL *baseURL = [params objectForKey:@"baseURL"];
                    _mediaURL = [[[NSURL URLWithString:obj relativeToURL:baseURL] absoluteURL] copy];
                }
            }
        }];
    }
    
    return self;
}


- (NSDictionary *)dictionaryValue {
    NSString *mediaURLString = (_mediaURL == nil || (_mediaURL.absoluteString && !_mediaURL.absoluteString.length)) ?
    (NSString *)[NSNull null] : _mediaURL.absoluteString;
    NSDictionary *dictionay = @{keyM3U8SegmentDuration: @(self.duration),
    keyM3U8SegmentMediaURLString: mediaURLString};
    
    return dictionay;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"SegmentInfo:<duration: %f>, <url:%@>", self.duration, self.mediaURL.absoluteString];
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    M3U8SegmentInfo *copy = [[[self class] allocWithZone:zone] initWithDictionary:[self dictionaryValue]];
    
    return copy;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat:_duration forKey:KeySegmentDuration];
    [aCoder encodeObject:_mediaURL forKey:KeyMeidaURL];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _duration = [aDecoder decodeFloatForKey:KeySegmentDuration];
        _mediaURL = [[aDecoder decodeObjectForKey:KeyMeidaURL] copy];
    }
    
    return self;
}

@end
