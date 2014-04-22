//
//  M3U8MediaPlaylist.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/26/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import "M3U8MediaPlaylist.h"

@interface M3U8MediaPlaylist()

@property (nonatomic, copy) NSString *originalText;
@property (nonatomic, strong) NSString *baseURL;

@property (nonatomic, strong) NSString *version;

@property (nonatomic, strong) M3U8SegmentInfoList *segmentList;

@end

@implementation M3U8MediaPlaylist

- (instancetype)initWithContent:(NSString *)string type:(M3U8MediaPlaylistType)type baseURL:(NSString *)baseURL {
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
    NSString *string = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:error];
    return [self initWithContent:string type:type baseURL:URL.absoluteString];
}

- (NSArray *)allSegmentURLs {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < self.segmentList.count; i ++) {
        M3U8SegmentInfo *info = [self.segmentList segmentInfoAtIndex:i];
        if (info.mediaURL.length > 0) {
            if (NO == [array containsObject:info.mediaURL]) {
                [array addObject:info.mediaURL];
            }
        }
    }
    return [array copy];
}

- (void)parseMediaPlaylist {
    
    self.segmentList = [[M3U8SegmentInfoList alloc] init];
    
    NSRange segmentRange = [self.originalText rangeOfString:M3U8_EXTINF];
    NSString *remainingSegments = self.originalText;
    
    while (NSNotFound != segmentRange.location) {
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        if (self.baseURL) {
            [params setObject:self.baseURL forKey:M3U8_BASE_URL];
        }
        
		// Read the EXTINF number between #EXTINF: and the comma
		NSRange commaRange = [remainingSegments rangeOfString:@","];
        NSRange valueRange = NSMakeRange(segmentRange.location + 8, commaRange.location - (segmentRange.location + 8));
        if (commaRange.location == NSNotFound || valueRange.location > remainingSegments.length -1)
            break;
        
		NSString *value = [remainingSegments substringWithRange:valueRange];
		[params setValue:value forKey:M3U8_EXTINF_DURATION];
        
        // ignore the #EXTINF line
        remainingSegments = [remainingSegments substringFromIndex:segmentRange.location];
        NSRange extinfoLFRange = [remainingSegments rangeOfString:@"\n"];
        remainingSegments = [remainingSegments substringFromIndex:extinfoLFRange.location + 1];
        
        // Read the segment link, and ignore line start with # && blank line
        while (1) {
            NSRange lfRange = [remainingSegments rangeOfString:@"\n"];
            NSString *line = [remainingSegments substringWithRange:NSMakeRange(0, lfRange.location)];
            line = [line stringByReplacingOccurrencesOfString:@" " withString:@""];
            
            remainingSegments = [remainingSegments substringFromIndex:lfRange.location + 1];
            
            if ([line characterAtIndex:0] != '#' && 0 != line.length) {
                // remove the CR character '\r'
                unichar lastChar = [line characterAtIndex:line.length - 1];
                if (lastChar == '\r') {
                    line = [line substringToIndex:line.length - 1];
                }
                
                [params setValue:line forKey:M3U8_EXTINF_URI];
                break;
            }
        }
        
        M3U8SegmentInfo *segment = [[M3U8SegmentInfo alloc] initWithDictionary:params];
        if (segment) {
            [self.segmentList addSegementInfo:segment];
        }
        
		segmentRange = [remainingSegments rangeOfString:M3U8_EXTINF];
    }
}

@end
