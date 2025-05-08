//
//  M3U8ExtXMap.m
//  M3U8Kit
//
//  Created by Darren Jones on 07/05/2025.
//

#import "M3U8ExtXMap.h"
#import "M3U8TagsAndAttributes.h"

@interface M3U8ExtXMap()
@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation M3U8ExtXMap

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.dictionary = dictionary;
    }
    return self;
}

- (NSURL *)url {
    return [NSURL URLWithString:self.dictionary[M3U8_EXT_X_MAP_URI]];
}

@end
