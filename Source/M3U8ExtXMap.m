//
//  M3U8ExtXMap.m
//  M3U8Kit
//
//  Created by Darren Jones on 07/05/2025.
//

#import "M3U8ExtXMap.h"
#import "M3U8TagsAndAttributes.h"
#import "M3U8ExtXByteRange.h"

@interface M3U8ExtXMap()
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSURL *URI;
@property (nonatomic, strong) M3U8ExtXByteRange *byteRange;
@end

@implementation M3U8ExtXMap

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.dictionary = dictionary;
        
        _URI = [NSURL URLWithString:self.dictionary[M3U8_EXT_X_MAP_URI]];
        NSString *rangeString = dictionary[M3U8_EXT_X_MAP_BYTERANGE];
        _byteRange = [[M3U8ExtXByteRange alloc] initWithAtString:rangeString];
    }
    return self;
}

@end
