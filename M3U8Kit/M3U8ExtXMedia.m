//
//  M3U8ExtXMedia.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/25/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import "M3U8ExtXMedia.h"

@interface M3U8ExtXMedia()
@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation M3U8ExtXMedia

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.dictionary = dictionary;
    }
    return self;
}

- (NSURL *)baseURL {
    return self.dictionary[M3U8_BASE_URL];
}

- (NSString *)type {
    return self.dictionary[M3U8_EXT_X_MEDIA_TYPE];
}

- (NSString *)URI {
    return self.dictionary[M3U8_EXT_X_MEDIA_URI];
}

- (NSString *)groupId {
    return self.dictionary[M3U8_EXT_X_MEDIA_GROUP_ID];
}

- (NSString *)language {
    return [self.dictionary[M3U8_EXT_X_MEDIA_LANGUAGE] lowercaseString];
}

- (NSString *)assocLanguage {
    return self.dictionary[M3U8_EXT_X_MEDIA_ASSOC_LANGUAGE];
}

- (NSString *)name {
    return self.dictionary[M3U8_EXT_X_MEDIA_NAME];
}

- (BOOL)isDefault {
    return [self.dictionary[M3U8_EXT_X_MEDIA_DEFAULT] boolValue];
}

- (BOOL)autoSelect {
    return [self.dictionary[M3U8_EXT_X_MEDIA_AUTOSELECT] boolValue];
}

- (BOOL)forced {
    return [self.dictionary[M3U8_EXT_X_MEDIA_FORCED] boolValue];
}

- (NSString *)instreamId {
    return self.dictionary[M3U8_EXT_X_MEDIA_INSTREAM_ID];
}

- (NSString *)characteristics {
    return self.dictionary[M3U8_EXT_X_MEDIA_CHARACTERISTICS];
}

- (NSURL *)m3u8URL {
    return [NSURL URLWithString:self.URI relativeToURL:[self baseURL]];
}

- (NSString *)description {
    return [NSString stringWithString:self.dictionary.description];
}

@end
