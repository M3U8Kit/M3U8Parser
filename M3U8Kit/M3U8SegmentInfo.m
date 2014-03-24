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
NSString *keyM3U8BaseURL = @"baseURL";

// key for Coding
#define KeySegmentDuration      @"key.SegmentDuration"
#define KeyMeidaURLString       @"key.MediaURLString"
#define KeyBaseURL              @"key.baseURL"

@interface M3U8SegmentInfo ()

@property (readwrite, nonatomic) CGFloat duration;
@property (readwrite, nonatomic, copy) NSString *mediaURLString;

@property (nonatomic, strong) NSURL *baseURL;

@end

@implementation M3U8SegmentInfo

- (id)initWithDictionary:(NSDictionary *)params {
    self = [super init];
    if (self) {
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            if ([key isEqualToString:keyM3U8SegmentDuration]) {
                self.duration = [obj floatValue];
            } else if ([key isEqualToString:keyM3U8SegmentMediaURLString]) {
                if ((NSNull *)obj != [NSNull null]) {
                    self.mediaURLString = obj;
                }
            } else if ([key isEqualToString:keyM3U8BaseURL]) {
                if (obj != [NSNull null]) {
                    self.baseURL = obj;
                }
            }
        }];
    }
    
    return self;
}


- (NSDictionary *)dictionaryValue {
    NSString *mediaURLString = (self.mediaURLString.length == 0) ?
    (NSString *)[NSNull null] : self.mediaURLString;
    NSURL *baseURL = self.baseURL?:(NSURL *)[NSNull null];
    NSDictionary *dictionay = @{keyM3U8SegmentDuration: @(self.duration),
                                keyM3U8SegmentMediaURLString: mediaURLString,
                                keyM3U8BaseURL: baseURL
                                };
    
    return dictionay;
}

- (NSURL *)mediaURL {
    return [NSURL URLWithString:self.mediaURLString relativeToURL:self.baseURL];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"SegmentInfo:<duration: %f>, <url:%@>", self.duration, self.mediaURLString];
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    M3U8SegmentInfo *copy = [[[self class] allocWithZone:zone] initWithDictionary:[self dictionaryValue]];
    
    return copy;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat:self.duration forKey:KeySegmentDuration];
    [aCoder encodeObject:self.mediaURLString forKey:KeyMeidaURLString];
    [aCoder encodeObject:self.baseURL forKey:KeyBaseURL];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.duration = [aDecoder decodeFloatForKey:KeySegmentDuration];
        self.mediaURLString = [aDecoder decodeObjectForKey:KeyMeidaURLString];
        self.baseURL = [aDecoder decodeObjectForKey:KeyBaseURL];
    }
    
    return self;
}

@end
