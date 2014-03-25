//
//  NSString+m3u8.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "NSString+m3u8.h"
#import "M3U8SegmentInfo.h"
#import "M3U8SegmentInfoList.h"
#import "M3U8ExtXStreamInf.h"
#import "M3U8ExtXStreamInfList.h"

#import "M3U8TagsAndAttributes.h"

@implementation NSString (m3u8)

- (BOOL)isExtendedM3Ufile {
    NSRange rangeOfEXTM3U = [self rangeOfString:M3U8_EXTM3U];
    return rangeOfEXTM3U.location != NSNotFound;
}

- (BOOL)isMasterPlaylist {
    BOOL isM3U = [self isExtendedM3Ufile];
    if (isM3U) {
        NSRange r1 = [self rangeOfString:M3U8_EXT_X_STREAM_INF];
        NSRange r2 = [self rangeOfString:M3U8_EXT_X_I_FRAME_STREAM_INF];
        if (r1.location != NSNotFound || r2.location != NSNotFound) {
            return YES;
        }
    }
    return NO;
}

- (M3U8ExtXStreamInfList *)m3u8ExtXStreamInfListValueRelativeToURL:(NSURL *)baseURL {
    if (0 == self.length || ![self isMasterPlaylist])
        return nil;
    
    M3U8ExtXStreamInfList *xStreamInfLsit = [[M3U8ExtXStreamInfList alloc] init];
    
    NSArray *components = [self componentsSeparatedByString:M3U8_EXT_X_STREAM_INF];
    
    [components enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSArray *lines = [(NSString *)obj componentsSeparatedByString:@"\n"];
        if (!(lines && lines.count > 1))
            return;
        
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:5];
        if (baseURL) {
            [params setObject:baseURL forKey:M3U8_BASE_URL];
        }
        
        NSString *url = lines[1];
        url = [url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (url && url.length != 0) {
            [params setValue:url forKey:keyM3U8URLString];
        } else
            return;
        
        NSString *attributeString = [lines[0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSArray *array = [attributeString componentsSeparatedByString:@","];
        
        NSMutableArray *attributeList = [array mutableCopy];
        for (NSInteger index = 0; index < array.count; index ++) {
            NSString *str = array[index];
            if ([str rangeOfString:@"="].location == NSNotFound) {
                if (index > 0) {
                    NSString *prevousStr = array[index -1];
                    NSString *theWholeStr = [NSString stringWithFormat:@"%@,%@", prevousStr, str];
                    [attributeList removeObject:prevousStr];
                    [attributeList removeObject:str];
                    [attributeList addObject:theWholeStr];
                }
                
            }
        }
        
        [attributeList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSString *value = nil;
            if ([obj hasPrefix:M3U8_EXT_X_STREAM_INF_PROGRAM_ID]) {
                value = [obj stringByReplacingOccurrencesOfString:M3U8_EXT_X_STREAM_INF_PROGRAM_ID withString:@""];
                if (value) {
                    [params setValue:value forKey:keyM3U8ProgramID];
                }
                
            } else if ([obj hasPrefix:M3U8_EXT_X_STREAM_INF_BANDWIDTH]) {
                value = [obj stringByReplacingOccurrencesOfString:M3U8_EXT_X_STREAM_INF_BANDWIDTH withString:@""];
                if (value) {
                    [params setValue:value forKey:keyM3U8Bandwidth];
                }
                
            } else if ([obj hasPrefix:M3U8_EXT_X_STREAM_INF_CODECS]) {
                value = [obj stringByReplacingOccurrencesOfString:M3U8_EXT_X_STREAM_INF_CODECS withString:@""];
                value = [value stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                if (value) {
                    [params setValue:value forKey:keyM3U8CodecsString];
                }
            } else if ([obj hasPrefix:M3U8_EXT_X_STREAM_INF_RESOLUTION]) {
                value = [obj stringByReplacingOccurrencesOfString:M3U8_EXT_X_STREAM_INF_RESOLUTION withString:@""];
                if (value) {
                    [params setValue:value forKey:keyM3U8MediaResolution];
                }
            }
        }];
        
        M3U8ExtXStreamInf *xStreamInf = [[M3U8ExtXStreamInf alloc] initWithDictionary:params];
        [xStreamInfLsit addExtXStreamInf:xStreamInf];
    }];
    
    return xStreamInfLsit;
}

- (M3U8SegmentInfoList *)m3u8SegementInfoListValueRelativeToURL:(NSURL *)baseURL {
    // self == @""
    if (0 == self.length)
        return nil;
    
    /**
     The Extended M3U file format defines two tags: EXTM3U and EXTINF.  An
     Extended M3U file is distinguished from a basic M3U file by its first
     line, which MUST be #EXTM3U.
     
     reference url:http://tools.ietf.org/html/draft-pantos-http-live-streaming-00
     */
    NSRange rangeOfEXTM3U = [self rangeOfString:M3U8_EXTM3U];
    if (rangeOfEXTM3U.location == NSNotFound ||
        rangeOfEXTM3U.location != 0) {
        return nil;
    }
    
    M3U8SegmentInfoList *segmentInfoList = [[M3U8SegmentInfoList alloc] init];
    
    NSRange segmentRange = [self rangeOfString:M3U8_EXTINF];
    NSString *remainingSegments = self;
    
    while (NSNotFound != segmentRange.location) {
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        if (baseURL) {
            [params setObject:baseURL forKey:M3U8_BASE_URL];
        }
        
		// Read the EXTINF number between #EXTINF: and the comma
		NSRange commaRange = [remainingSegments rangeOfString:@","];
        NSRange valueRange = NSMakeRange(segmentRange.location + 8, commaRange.location - (segmentRange.location + 8));
        if (commaRange.location == NSNotFound || valueRange.location > remainingSegments.length -1)
            break;
        
		NSString *value = [remainingSegments substringWithRange:valueRange];
		[params setValue:value forKey:keyM3U8SegmentDuration];
        
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
                
                [params setValue:line forKey:keyM3U8SegmentMediaURLString];
                break;
            }
        }
        
        M3U8SegmentInfo *segment = [[M3U8SegmentInfo alloc] initWithDictionary:params];
        [segmentInfoList addSegementInfo:segment];
        
        
		segmentRange = [remainingSegments rangeOfString:M3U8_EXTINF];
    }
    
    return segmentInfoList;
}

@end
