//
//  M3U8SegmentInfo.h
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

extern NSString *keyM3U8SegmentDuration;
extern NSString *keyM3U8SegmentMediaURLString;

/*!
 @class M3U8SegmentInfo
 @abstract This is the class indicates #EXTINF:<duration>,<title> + media in m3u8 file
 */

@interface M3U8SegmentInfo : NSObject
<
NSCopying,
NSCoding
>

@property (nonatomic, readonly) CGFloat duration;
@property (nonatomic, copy) NSURL   *mediaURL;

- (id)initWithDictionary:(NSDictionary *)params;
- (NSDictionary *)dictionaryValue;

@end
