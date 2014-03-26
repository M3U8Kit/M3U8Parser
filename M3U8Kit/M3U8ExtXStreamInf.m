//
//  M3U8ExtXStreamInf.m
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import "M3U8ExtXStreamInf.h"

const MediaResoulution MediaResoulutionZero = {0.f, 0.f};

NSString * NSStringFromMediaResolution(MediaResoulution resolution) {
    return [NSString stringWithFormat:@"%gx%g", resolution.width, resolution.height];
}

MediaResoulution MediaResolutionFromString(NSString *string) {
    NSArray *comps = [string componentsSeparatedByString:@"x"];
    if (comps.count == 2) {
        float width = [comps[0] floatValue];
        float height = [comps[1] floatValue];
        return MediaResolutionMake(width, height);
    } else {
        return MediaResoulutionZero;
    }
}

MediaResoulution MediaResolutionMake(float width, float height) {
    MediaResoulution resolution = {width, height};
    return resolution;
}


@interface M3U8ExtXStreamInf()
@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation M3U8ExtXStreamInf

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.dictionary = dictionary;
    }
    return self;
}

- (NSURL *)baseURL {
    return self.dictionary[M3U8_BASE_URL];
}

- (NSURL *)m3u8URL {
    return [NSURL URLWithString:self.URI relativeToURL:self.baseURL];
}

- (NSInteger)bandwidth {
    return [self.dictionary[M3U8_EXT_X_STREAM_INF_BANDWIDTH] integerValue];
}

- (NSInteger)programId {
    return [self.dictionary[M3U8_EXT_X_STREAM_INF_PROGRAM_ID] integerValue];
}

- (NSString *)codecs {
    return self.dictionary[M3U8_EXT_X_STREAM_INF_CODECS];
}

- (MediaResoulution)resolution {
    NSString *rStr = self.dictionary[M3U8_EXT_X_STREAM_INF_RESOLUTION];
    MediaResoulution resolution = MediaResolutionFromString(rStr);
    return resolution;
}

- (NSString *)audio {
    return self.dictionary[M3U8_EXT_X_STREAM_INF_AUDIO];
}

- (NSString *)video {
    return self.dictionary[M3U8_EXT_X_STREAM_INF_VIDEO];
}

- (NSString *)subtitles {
    return self.dictionary[M3U8_EXT_X_STREAM_INF_SUBTITLES];
}

- (NSString *)closedCaptions {
    return self.dictionary[M3U8_EXT_X_STREAM_INF_CLOSED_CAPTIONS];
}

- (NSString *)URI {
    return self.dictionary[M3U8_EXT_X_STREAM_INF_URI];
}

@end
