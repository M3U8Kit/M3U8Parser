//
//  M3U8MasterPlaylist.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/25/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import "M3U8MasterPlaylist.h"

// #define M3U8_EXT_X_STREAM_INF_CLOSED_CAPTIONS   @"CLOSED-CAPTIONS" // The value can be either a quoted-string or an enumerated-string with the value NONE.
//    NSArray *quotedValueAttrs = @[@"URI", @"KEYFORMAT", @"KEYFORMATVERSIONS", @"GROUP-ID", @"LANGUAGE", @"ASSOC-LANGUAGE", @"NAME", @"INSTREAM-ID", @"CHARACTERISTICS", @"CODECS", @"AUDIO", @"VIDEO", @"SUBTITLES", @"BYTERANGE"];

@interface M3U8MasterPlaylist ()

@property (nonatomic, copy) NSString *originalText;
@property (nonatomic, strong) NSURL *baseURL;

@property (nonatomic, strong) NSString *version;

@property (nonatomic, strong) M3U8ExtXStreamInfList *xStreamList;
@property (nonatomic, strong) M3U8ExtXMediaList *xMediaList;

@end

@implementation M3U8MasterPlaylist

- (instancetype)initWithContent:(NSString *)string baseURL:(NSURL *)baseURL {
    if (NO == [string isMasterPlaylist]) {
        return nil;
    }
    if (self = [super init]) {
        self.originalText = string;
        self.baseURL = baseURL;
        [self parseMasterPlaylist];
    }
    return self;
}

- (instancetype)initWithContentOfURL:(NSURL *)URL error:(NSError **)error {
    if (!URL) {
        return nil;
    }
    NSString *string = [NSString stringWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:error];
    return [self initWithContent:string baseURL:URL];
}

- (void)parseMasterPlaylist {
    
    self.xStreamList = [[M3U8ExtXStreamInfList alloc] init];
    self.xMediaList = [[M3U8ExtXMediaList alloc] init];
    
    NSRange crRange = [self.originalText rangeOfString:@"\n"];
    NSString *remainingPart = self.originalText;
    
    while (NSNotFound != crRange.location) {
        
        NSString *line = [remainingPart substringWithRange:NSMakeRange(0, crRange.location)];
        remainingPart = [remainingPart substringFromIndex:crRange.location +1];
        crRange = [remainingPart rangeOfString:@"\n"];
        
        // #EXT-X-VERSION:4
        if ([line hasPrefix:M3U8_EXT_X_VERSION]) {
            NSRange r_version = [line rangeOfString:M3U8_EXT_X_VERSION];
            self.version = [line substringFromIndex:r_version.location + r_version.length];
        }
        
        // #EXT-X-STREAM-INF:AUDIO="600k",BANDWIDTH=915685,PROGRAM-ID=1,CODECS="avc1.42c01e,mp4a.40.2",RESOLUTION=640x360,SUBTITLES="subs"
        // http://hls.ted.com/talks/769/video/600k.m3u8?sponsor=Ripple
        else if ([line hasPrefix:M3U8_EXT_X_STREAM_INF]) {
            NSRange range = [line rangeOfString:M3U8_EXT_X_STREAM_INF];
            NSString *attribute_list = [line substringFromIndex:range.location + range.length];
            NSMutableDictionary *attr = [self attributesFromString:attribute_list];
            
            // parse URI
            NSString *nextLine = [remainingPart substringToIndex:crRange.location]; // the URI
            attr[@"URI"] = nextLine;
            if (self.baseURL) {
                attr[M3U8_BASE_URL] = self.baseURL;
            }
            
            remainingPart = [remainingPart substringFromIndex:crRange.location +1];
            crRange = [remainingPart rangeOfString:@"\n"];
            
            M3U8ExtXStreamInf *xStreamInf = [[M3U8ExtXStreamInf alloc] initWithDictionary:attr];
            [self.xStreamList addExtXStreamInf:xStreamInf];
        }
        
        // #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=65531,PROGRAM-ID=1,CODECS="avc1.42c00c",RESOLUTION=320x180,URI="/talks/769/video/64k_iframe.m3u8?sponsor=Ripple"
        else if ([line hasPrefix:M3U8_EXT_X_I_FRAME_STREAM_INF]) {
            
            
        }
        
        // #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="600k",LANGUAGE="eng",NAME="Audio",AUTOSELECT=YES,DEFAULT=YES,URI="/talks/769/audio/600k.m3u8?sponsor=Ripple",BANDWIDTH=614400
        else if ([line hasPrefix:M3U8_EXT_X_MEDIA]) {
            NSRange range = [line rangeOfString:M3U8_EXT_X_MEDIA];
            NSString *attribute_list = [line substringFromIndex:range.location + range.length];
            NSMutableDictionary *attr = [self attributesFromString:attribute_list];
            if (self.baseURL) {
                attr[M3U8_BASE_URL] = self.baseURL;
            }
            M3U8ExtXMedia *media = [[M3U8ExtXMedia alloc] initWithDictionary:attr];
            [self.xMediaList addExtXMedia:media];
        }
    }
}

- (NSMutableDictionary *)attributesFromString:(NSString *)attribute_list {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSRange equalMarkRange = [attribute_list rangeOfString:@"="];
    
    while (NSNotFound != equalMarkRange.location) {
        NSString *key = [attribute_list substringToIndex:equalMarkRange.location];
        attribute_list = [attribute_list substringFromIndex:equalMarkRange.location +1];
        NSString *value = @"";
        
        if ([attribute_list hasPrefix:@"\""]) {
            attribute_list = [attribute_list substringFromIndex:1];
            NSRange quoteRange = [attribute_list rangeOfString:@"\""];
            value = [attribute_list substringToIndex:quoteRange.location];
            attribute_list = [attribute_list substringFromIndex:quoteRange.location +1];
        } else {
            NSRange commaRange = [attribute_list rangeOfString:@","];
            if (NSNotFound == commaRange.location) {
                value = attribute_list;
            } else {
                value = [attribute_list substringToIndex:commaRange.location];
                attribute_list = [attribute_list substringFromIndex:commaRange.location +1];
            }
        }
        if ([attribute_list hasPrefix:@","]) {
            attribute_list = [attribute_list substringFromIndex:1];
        }
        equalMarkRange = [attribute_list rangeOfString:@"="];
        
        dict[key] = value;
    }
    return dict;
}

@end











