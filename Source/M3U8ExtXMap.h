//
//  M3U8ExtXMap.h
//  M3U8Kit
//
//  Created by Darren Jones on 07/05/2025.
//

#import <Foundation/Foundation.h>

@class M3U8ExtXByteRange;
@interface M3U8ExtXMap : NSObject

@property (nonatomic, readonly) NSURL *URI;
@property (nonatomic, readonly) M3U8ExtXByteRange *byteRange;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
