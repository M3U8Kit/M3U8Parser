//
//  M3U8ExtXStreamInf.m
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import "M3U8ExtXStreamInf.h"

const MediaResoulution MediaResoulutionZero = {0, 0};

NSString * NSStringFromMediaResolution(MediaResoulution resolution) {
    return [NSString stringWithFormat:@"%gx%g", resolution.width, resolution.height];
}

MediaResoulution MediaResoulutionMake(CGFloat width, CGFloat height) {
    MediaResoulution resolution = {width, height};
    return resolution;
}

// key for Copying
NSString *keyM3U8ProgramID = @"key.M3U8ProgramID";
NSString *keyM3U8Bandwidth = @"key.M3U8Bandwidth";
NSString *keyM3U8CodecsString = @"key.M3U8CodecsString";
NSString *keyM3U8MediaResolution = @"key.M3U8MediaResolutionString";
NSString *keyM3U8URLString = @"key.M3U8URLString";

// key for Coding
#define KeyProgramID        @"key.ProgramID"
#define KeyBandwidth        @"key.Bandwidth"
#define KeyCodecsString     @"key.CodecsString"
#define KeyMediaResolution  @"key.MediaResolution"
#define KeyM3U8URL          @"key.M3U8URL"

@interface M3U8ExtXStreamInf ()

@property (nonatomic) NSInteger programId;
@property (nonatomic) NSInteger bandwidth;
@property (nonatomic, copy) NSString *codecs;
@property (nonatomic) MediaResoulution resolution;
@property (nonatomic, copy) NSString   *m3u8URLString;

@property (nonatomic, strong) NSURL *baseURL;

@end

@implementation M3U8ExtXStreamInf

- (id)initWithDictionary:(NSDictionary *)params {
    self = [super init];
    if (self) {
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            if ([key isEqualToString:keyM3U8ProgramID]) {
                self.programId = [obj integerValue];
            } else if ([key isEqualToString:keyM3U8Bandwidth]) {
                self.bandwidth = [obj integerValue];
            } else if ([key isEqualToString:keyM3U8CodecsString]) {
                self.codecs = [obj copy];
            } else if ([key isEqualToString:keyM3U8MediaResolution]) {
                NSArray *segments = [(NSString *)obj componentsSeparatedByString:@"x"];
                MediaResoulution res = {[segments[0] floatValue], [segments[1] floatValue]};
                self.resolution = res;
            } else if ([key isEqualToString:keyM3U8URLString]) {
                if ((NSNull *)obj != [NSNull null]) {
                    self.m3u8URLString = obj;
                }
            } else if ([key isEqualToString:M3U8_BASE_URL]) {
                if (obj != [NSNull null]) {
                    self.baseURL = obj;
                }
            }
        }];
    }
    
    return self;
}

- (NSDictionary *)dictionaryValue {
    NSString *m3u8URLString = (self.m3u8URLString.length == 0) ?
    (NSString *)[NSNull null] : self.m3u8URLString;
    NSString *mediaCodecs = (self.codecs && self.codecs.length) ? (NSString *)[NSNull null] : self.codecs;
    NSURL *baseURL = self.baseURL ?: (NSURL *)[NSNull null];
    NSDictionary *dictionay = @{keyM3U8ProgramID : @(self.programId),
                                keyM3U8Bandwidth : @(self.bandwidth),
                                keyM3U8CodecsString : mediaCodecs,
                                keyM3U8MediaResolution : [NSValue valueWithBytes:&_resolution objCType:@encode(MediaResoulution)],
                                keyM3U8URLString : m3u8URLString,
                                M3U8_BASE_URL : baseURL};
    
    return dictionay;
}

- (NSURL *)m3u8URL {
    return [NSURL URLWithString:self.m3u8URLString relativeToURL:self.baseURL];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{ M3U8Info: <PROGRAM-ID: %ld>, <BANDWIDTH: %ld>, <CODECS: %@>, <RESOLUTION: %@>, <url:%@> }", (long)self.programId, (long)self.bandwidth, self.codecs, NSStringFromMediaResolution(self.resolution), self.m3u8URLString];
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    M3U8ExtXStreamInf *copy = [[[self class] allocWithZone:zone] initWithDictionary:[self dictionaryValue]];
    
    return copy;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.programId forKey:KeyProgramID];
    [aCoder encodeInteger:self.bandwidth forKey:KeyBandwidth];
    [aCoder encodeObject:self.codecs forKey:KeyCodecsString];
    [aCoder encodeObject:[NSValue valueWithBytes:&_resolution objCType:@encode(MediaResoulution)] forKey:KeyMediaResolution];
    [aCoder encodeObject:self.m3u8URLString forKey:KeyM3U8URL];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.programId = [aDecoder decodeIntegerForKey:KeyProgramID];
        self.bandwidth = [aDecoder decodeIntegerForKey:KeyBandwidth];
        self.codecs = [[aDecoder decodeObjectForKey:KeyCodecsString] copy];
        [[aDecoder decodeObjectForKey:KeyMediaResolution] getValue:&_resolution];
        self.m3u8URLString = [aDecoder decodeObjectForKey:KeyM3U8URL];
    }
    
    return self;
}

@end
