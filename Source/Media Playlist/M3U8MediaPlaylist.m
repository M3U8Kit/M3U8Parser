//
//  M3U8MediaPlaylist.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/26/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import "M3U8MediaPlaylist.h"
#import "NSString+m3u8.h"
#import "M3U8TagsAndAttributes.h"
#import "NSURL+easy.h"
#import "M3U8LineReader.h"

@interface M3U8MediaPlaylist()

@property (nonatomic, copy) NSString *originalText;
@property (nonatomic, copy) NSURL *baseURL;
@property (nonatomic, copy) NSURL *originalURL;

@property (nonatomic, strong) NSString *version;

@property (nonatomic, strong) M3U8SegmentInfoList *segmentList;

@property (assign, nonatomic) BOOL isLive;

@end

@implementation M3U8MediaPlaylist

- (instancetype)initWithContent:(NSString *)string type:(M3U8MediaPlaylistType)type baseURL:(NSURL *)baseURL {
    if (NO == [string isMediaPlaylist]) {
        return nil;
    }
    
    if (self = [super init]) {
        self.originalText = string;
        self.baseURL = baseURL;
        self.type = type;
        [self parseMediaPlaylist];
    }
    return self;
}

- (instancetype)initWithContentOfURL:(NSURL *)URL type:(M3U8MediaPlaylistType)type error:(NSError **)error {
    if (nil == URL) {
        return nil;
    }
    
    self.originalURL = URL;
    
    NSString *string = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:error];
    
    return [self initWithContent:string type:type baseURL:URL.realBaseURL];
}

- (NSArray *)allSegmentURLs {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < self.segmentList.count; i ++) {
        M3U8SegmentInfo *info = [self.segmentList segmentInfoAtIndex:i];
        if (info.mediaURL.absoluteString.length > 0) {
            if (NO == [array containsObject:info.mediaURL]) {
                [array addObject:info.mediaURL];
            }
        }
    }
    return [array copy];
}

- (void)parseMediaPlaylist
{
    self.segmentList = [[M3U8SegmentInfoList alloc] init];
    BOOL isLive = [self.originalText rangeOfString:M3U8_EXT_X_ENDLIST].location == NSNotFound;
    self.isLive = isLive;
    
    M3U8LineReader* lines = [[M3U8LineReader alloc] initWithText:self.originalText];
    
    while (true) {
        
        NSString* line = [lines next];
        if (!line) {
            break;
        }
        
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        if (self.originalURL) {
            [params setObject:self.originalURL forKey:M3U8_URL];
        }
        
        if (self.baseURL) {
            [params setObject:self.baseURL forKey:M3U8_BASE_URL];
        }
        
        //check if it's #EXTINF:
        if ([line hasPrefix:M3U8_EXTINF])
        {
            line = [line stringByReplacingOccurrencesOfString:M3U8_EXTINF withString:@""];
            line = [line stringByReplacingOccurrencesOfString:@"," withString:@""];
            [params setValue:line forKey:M3U8_EXTINF_DURATION];
            
            //then get URI
            NSString *nextLine = [lines next];
            [params setValue:nextLine forKey:M3U8_EXTINF_URI];
            
            M3U8SegmentInfo *segment = [[M3U8SegmentInfo alloc] initWithDictionary:params];
            if (segment) {
                [self.segmentList addSegementInfo:segment];
            }
        }
    }
}

@end

