//
//  NSString+m3u8.h
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kM3U8FirstTag @"#EXTM3U"
#define kExtinfoString @"#EXTINF:"

#define kExtXStreamInf @"#EXT-X-STREAM-INF:"

#define kProgramID @"PROGRAM-ID="
#define kBandwidth @"BANDWIDTH="
#define kCodecs @"CODECS="
#define kResolution @"RESOLUTION="

@class M3U8ExtXStreamInfList, M3U8SegmentInfoList;
@interface NSString (m3u8)

- (BOOL)isEXTXSTREAMINF;
- (M3U8ExtXStreamInfList *)m3u8ExtXStreamInfListValueRelativeToURL:(NSURL *)baseURL;
- (M3U8SegmentInfoList *)m3u8SegementInfoListValueRelativeToURL:(NSURL *)baseURL;

@end
