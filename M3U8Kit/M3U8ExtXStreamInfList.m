//
//  M3U8ExtXStreamInfList.m
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import "M3U8ExtXStreamInfList.h"

#define KeyM3u8InfoList       @"key.m3u8InfoList"

@interface M3U8ExtXStreamInfList ()

@property (nonatomic, strong) NSMutableArray *m3u8InfoList;

@end

@implementation M3U8ExtXStreamInfList

- (id)init {
    self = [super init];
    if (self) {
        self.m3u8InfoList = [NSMutableArray array];
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
    [aCoder encodeObject:self.m3u8InfoList forKey:KeyM3u8InfoList];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.m3u8InfoList = [aDecoder decodeObjectForKey:KeyM3u8InfoList];
    }
    
    return self;
}

#pragma mark - Getter && Setter
- (NSUInteger)count {
    return [self.m3u8InfoList count];
}

#pragma mark - Public
- (void)addExtXStreamInf:(M3U8ExtXStreamInf *)extStreamInf {
    [self.m3u8InfoList addObject:extStreamInf];
}

- (M3U8ExtXStreamInf *)extXStreamInfAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self.m3u8InfoList objectAtIndex:index];
}

- (M3U8ExtXStreamInf *)firstStreamInf {
    return [self.m3u8InfoList lastObject];
}

- (M3U8ExtXStreamInf *)lastXStreamInf {
    return [self.m3u8InfoList lastObject];
}

- (void)sortByBandWidthOrder:(NSComparisonResult)order {
    
    NSArray *array = [self.m3u8InfoList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSInteger bandwidth1 = ((M3U8ExtXStreamInf *)obj1).bandwidth;
        NSInteger bandwidth2 = ((M3U8ExtXStreamInf *)obj2).bandwidth;
        if ( bandwidth1 == bandwidth2 ) {
            return NSOrderedSame;
        } else if (bandwidth1 < bandwidth2) {
            return order;
        } else {
            return order * (-1);
        }
    }];
    
    self.m3u8InfoList = [array mutableCopy];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.m3u8InfoList];
}

@end
