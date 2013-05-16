//
//  M3U8ExtXStreamInfList.h
//  ILSLoader
//
//  Created by Jin Sun on 13-4-15.
//  Copyright (c) 2013年 iLegendSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "M3U8ExtXStreamInf.h"

@interface M3U8ExtXStreamInfList : NSObject
<
NSCopying,
NSCoding
>

@property (nonatomic, assign ,readonly) NSUInteger count;

- (void)addExtXStreamInf:(M3U8ExtXStreamInf *)extStreamInf;
- (M3U8ExtXStreamInf *)extXStreamInfAtIndex:(NSUInteger)index;
- (M3U8ExtXStreamInf *)lastXStreamInf;

- (void)sortByBandWidthOrder:(NSComparisonResult)order;

- (NSString *)originalM3U8PlanStringValue;


@end
