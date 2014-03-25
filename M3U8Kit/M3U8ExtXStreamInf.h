//
//  M3U8ExtXStreamInf.h
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

struct MediaResoulution{
    float width;
    float height;
};
typedef struct MediaResoulution MediaResoulution;

extern MediaResoulution MediaResolutionMake(float width, float height);

extern const MediaResoulution MediaResoulutionZero;
NSString * NSStringFromMediaResolution(MediaResoulution resolution);

/*!
 @class M3U8SegmentInfo
 @abstract This is the class indicates #EXT-X-STREAM-INF:<attribute-list> + <URI> in master playlist file.
 */
@interface M3U8ExtXStreamInf : NSMutableDictionary

@property (nonatomic, readonly) NSInteger bandwidth;
@property (nonatomic, readonly) NSInteger programId;        // removed by draft 12
@property (nonatomic, readonly) NSString *codecs;
@property (nonatomic, readonly) MediaResoulution resolution;
@property (nonatomic, readonly) NSString *audio;
@property (nonatomic, readonly) NSString *video;
@property (nonatomic, readonly) NSString *subtitles;
@property (nonatomic, readonly) NSString *closedCaptions;
@property (nonatomic, readonly) NSString   *URI;

- (NSURL *)m3u8URL; // the absolute url

@end
