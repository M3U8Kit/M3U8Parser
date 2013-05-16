//
//  M3U8ExtXStreamInf.m
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import "M3U8ExtXStreamInf.h"

NSString * NSStringFromMediaResolution(MediaResoulution resolution) {
    return [NSString stringWithFormat:@"%gx%g", resolution.width, resolution.height];
}

// key for Copying
NSString *keyM3U8ProgramID = @"key.M3U8ProgramID";
NSString *keyM3U8Bandwidth = @"key.M3U8Bandwidth";
NSString *keyM3U8CodecsString = @"key.M3U8CodecsString";
NSString *keyM3U8MediaResolution = @"key.M3U8CodecsString";
NSString *keyM3U8URLString = @"key.M3U8URLString";

// key for Coding
#define KeyProgramID        @"key.ProgramID"
#define KeyBandwidth        @"key.Bandwidth"
#define KeyCodecsString     @"key.CodecsString"
#define KeyMediaResolution  @"key.CodecsString"
#define KeyM3U8URL          @"key.M3U8URL"

@implementation M3U8ExtXStreamInf

- (id)initWithDictionary:(NSDictionary *)params {
    self = [super init];
    if (self) {
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            if ([key isEqualToString:keyM3U8ProgramID]) {
                _programId = [obj integerValue];
            } else if ([key isEqualToString:keyM3U8Bandwidth]) {
                _bandwidth = [obj integerValue];
            } else if ([key isEqualToString:keyM3U8CodecsString]) {
                _codecs = [obj copy];
            } else if ([key isEqualToString:keyM3U8MediaResolution]) {
                NSArray *segments = [(NSString *)obj componentsSeparatedByString:@"x"];
                _resolution.width = [segments[0] floatValue];
                _resolution.height = [segments[1] floatValue];
            } else if ([key isEqualToString:keyM3U8URLString]) {
                if ((NSNull *)obj != [NSNull null]) {
                    NSURL *baseURL = [params objectForKey:@"baseURL"];
                    _m3u8URL = [[[NSURL URLWithString:obj relativeToURL:baseURL] absoluteURL] copy];
                }
            }
        }];
    }
    
    return self;
}


- (NSDictionary *)dictionaryValue {
    NSString *m3u8URLString = (_m3u8URL == nil || (_m3u8URL.absoluteString && !_m3u8URL.absoluteString.length)) ?
    (NSString *)[NSNull null] : _m3u8URL.absoluteString;
    NSString *mediaCodecs = (self.codecs && self.codecs.length) ? (NSString *)[NSNull null] : _codecs;
    NSDictionary *dictionay = @{keyM3U8ProgramID : @(self.programId),
                                keyM3U8Bandwidth : @(self.bandwidth),
                                keyM3U8CodecsString : mediaCodecs,
                                keyM3U8MediaResolution : [NSValue valueWithBytes:&_resolution objCType:@encode(MediaResoulution)],
                                keyM3U8URLString : m3u8URLString};
    
    return dictionay;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{ M3U8Info: <PROGRAM-ID: %d>, <BANDWIDTH: %d>, <CODECS: %@>, <RESOLUTION: %@>, <url:%@> }", self.programId, self.bandwidth, self.codecs, NSStringFromMediaResolution(self.resolution), self.m3u8URL.absoluteString];
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    M3U8ExtXStreamInf *copy = [[[self class] allocWithZone:zone] initWithDictionary:[self dictionaryValue]];
    
    return copy;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:_programId forKey:KeyProgramID];
    [aCoder encodeInteger:_bandwidth forKey:KeyBandwidth];
    [aCoder encodeObject:_codecs forKey:KeyCodecsString];
    [aCoder encodeObject:[NSValue valueWithBytes:&_resolution objCType:@encode(MediaResoulution)] forKey:KeyMediaResolution];
    [aCoder encodeObject:_m3u8URL forKey:KeyM3U8URL];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _programId = [aDecoder decodeIntegerForKey:KeyProgramID];
        _bandwidth = [aDecoder decodeIntegerForKey:KeyBandwidth];
        _codecs = [[aDecoder decodeObjectForKey:KeyCodecsString] copy];
        [[aDecoder decodeObjectForKey:KeyMediaResolution] getValue:&_resolution];
        _m3u8URL = [[aDecoder decodeObjectForKey:KeyM3U8URL] copy];
    }
    
    return self;
}

@end
