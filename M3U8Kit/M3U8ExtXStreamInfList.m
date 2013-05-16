//
//  M3U8ExtXStreamInfList.m
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import "M3U8ExtXStreamInfList.h"

#define KeySegmentInfList       @"key.segmentList"

@interface M3U8ExtXStreamInfList ()

@property (nonatomic, strong) NSMutableArray *m3u8InfoList;

@end

@implementation M3U8ExtXStreamInfList

- (id)init {
    self = [super init];
    if (self) {
        _m3u8InfoList = [[NSMutableArray alloc] init];
    }
    
    return self;
}


#pragma mark - NSCopyding
- (id)copyWithZone:(NSZone *)zone {
    M3U8ExtXStreamInfList *copy = [[[self class] allocWithZone:zone] init];
    
    for (int i = 0; i < [self count]; i++) {
        M3U8ExtXStreamInf *infCopy = [[self extXStreamInfAtIndex:i] copyWithZone:zone];
        [copy addExtXStreamInf:infCopy];
    }
    
    return copy;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_m3u8InfoList forKey:KeySegmentInfList];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _m3u8InfoList = [aDecoder decodeObjectForKey:KeySegmentInfList];
    }
    
    return self;
}

#pragma mark - Getter && Setter
- (NSUInteger)count {
    return [_m3u8InfoList count];
}

#pragma mark - Public
- (void)addExtXStreamInf:(M3U8ExtXStreamInf *)extStreamInf {
    [_m3u8InfoList addObject:extStreamInf];
}

- (M3U8ExtXStreamInf *)extXStreamInfAtIndex:(NSUInteger)index {
    return [_m3u8InfoList objectAtIndex:index];
}

- (M3U8ExtXStreamInf *)lastXStreamInf {
    return [_m3u8InfoList lastObject];
}

- (void)sortByBandWidthOrder:(NSComparisonResult)order {
    NSArray *array = [_m3u8InfoList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSInteger bandwidth1 = ((M3U8ExtXStreamInf *)obj1).bandwidth;
        NSInteger bandwidth2 = ((M3U8ExtXStreamInf *)obj2).bandwidth;
        if ( bandwidth1 == bandwidth2 ) {
            return NSOrderedSame;
        } else if (bandwidth1 < bandwidth2) {
            return order * NSOrderedDescending;
        } else {
            return order * NSOrderedAscending;
        }
    }];
    
    self.m3u8InfoList = [array mutableCopy];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", _m3u8InfoList];
}

- (NSString *)originalM3U8PlanStringValue {
    NSMutableString *m3u8String = [[NSMutableString alloc] init];
    
    [m3u8String appendString:@"#EXTM3U\n"];
    
    for (M3U8ExtXStreamInf *xStreamInf in _m3u8InfoList) {
        [m3u8String appendString:[NSString stringWithFormat:@"#EXT-X-STREAM-INF:PROGRAM-ID=%d,BANDWIDTH=%d,CODECS=%@,RESOLUTION=%@,\n", xStreamInf.programId, xStreamInf.bandwidth, xStreamInf.codecs, NSStringFromMediaResolution(xStreamInf.resolution)]];
        [m3u8String appendString:[NSString stringWithFormat:@"%@\n", xStreamInf.m3u8URL.absoluteString]];
    }
    
    NSString *returnString = [m3u8String copy];
    
    return returnString;
    return nil;
}

@end
