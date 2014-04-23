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
@property (nonatomic) MediaResoulution resolution;
@end

@implementation M3U8ExtXStreamInf

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.dictionary = dictionary;
        self.resolution = MediaResoulutionZero;
    }
    return self;
}

- (NSString *)baseURL {
    return self.dictionary[M3U8_BASE_URL];
}

- (NSString *)m3u8URL {
    NSURL *baseURL = [NSURL URLWithString:[self baseURL]];
    return [[NSURL URLWithString:self.URI relativeToURL:baseURL] absoluteString];
}

- (NSInteger)bandwidth {
    return [self.dictionary[M3U8_EXT_X_STREAM_INF_BANDWIDTH] integerValue];
}

- (NSInteger)programId {
    return [self.dictionary[M3U8_EXT_X_STREAM_INF_PROGRAM_ID] integerValue];
}

- (NSArray *)codecs {
    NSString *codecsString = self.dictionary[M3U8_EXT_X_STREAM_INF_CODECS];
    return [codecsString componentsSeparatedByString:@","];
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

- (NSString *)description {
    return [NSString stringWithString:self.dictionary.description];
}

/*
 #EXT-X-STREAM-INF:AUDIO="600k",BANDWIDTH=1049794,PROGRAM-ID=1,CODECS="avc1.42c01e,mp4a.40.2",RESOLUTION=640x360,SUBTITLES="subs"
 main_media_0.m3u8
 */
- (NSString *)m3u8PlanString {
    NSMutableString *str = [NSMutableString string];
    [str appendString:M3U8_EXT_X_STREAM_INF];
    if (self.audio.length > 0) {
        [str appendString:[NSString stringWithFormat:@"AUDIO=\"%@\"", self.audio]];
        [str appendString:[NSString stringWithFormat:@",BANDWIDTH=%ld", (long)self.bandwidth]];
    } else {
        [str appendString:[NSString stringWithFormat:@"BANDWIDTH=%ld", (long)self.bandwidth]];
    }
    
    [str appendString:[NSString stringWithFormat:@",PROGRAM-ID=%ld", (long)self.programId]];
    NSString *codecsString = self.dictionary[M3U8_EXT_X_STREAM_INF_CODECS];
    [str appendString:[NSString stringWithFormat:@",CODECS=\"%@\"", codecsString]];
    NSString *rStr = self.dictionary[M3U8_EXT_X_STREAM_INF_RESOLUTION];
    if (rStr.length > 0) {
        [str appendString:[NSString stringWithFormat:@",RESOLUTION=%@", rStr]];
    }
    [str appendString:[NSString stringWithFormat:@"\n%@", self.URI]];
    return str;
}

@end





