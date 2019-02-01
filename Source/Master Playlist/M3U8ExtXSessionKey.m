//
//  M3U8ExtXSessionKey.m
//  M3U8Kit
//
//  Created by Pierre Perrin on 01/02/2019.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "M3U8ExtXSessionKey.h"
#import "M3U8TagsAndAttributes.h"

@interface M3U8ExtXSessionKey()
@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation M3U8ExtXSessionKey

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.dictionary = dictionary;
    }
    return self;
}

- (NSString *)method {
    return self.dictionary[M3U8_EXT_X_KEY_METHOD];
}

- (NSString *)url {
    return self.dictionary[M3U8_EXT_X_KEY_URI];
}

- (NSString *)keyFormat {
    return self.dictionary[M3U8_EXT_X_KEY_KEYFORMAT];
}
@end
