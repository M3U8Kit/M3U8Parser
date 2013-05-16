//
//  M3U8ExtXStreamInf.h
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

extern NSString *keyM3U8ProgramID;
extern NSString *keyM3U8Bandwidth;
extern NSString *keyM3U8CodecsString;
extern NSString *keyM3U8MediaResolution;
extern NSString *keyM3U8URLString;

typedef struct _MediaResoulution{
    CGFloat width;
    CGFloat height;
} MediaResoulution;

NSString * NSStringFromMediaResolution(MediaResoulution resolution);

/*!
 @class M3U8SegmentInfo
 @abstract This is the class indicates #EXTINF:<duration>,<title> + media in m3u8 file
 */
@interface M3U8ExtXStreamInf : NSObject
<
NSCopying,
NSCoding
>

@property (nonatomic, readonly) NSInteger programId;
@property (nonatomic, readonly) NSInteger bandwidth;
@property (nonatomic, readonly, copy) NSString *codecs;
@property (nonatomic, readonly) MediaResoulution resolution;
@property (nonatomic, readonly, copy) NSURL   *m3u8URL;

- (id)initWithDictionary:(NSDictionary *)params;
- (NSDictionary *)dictionaryValue;

@end
