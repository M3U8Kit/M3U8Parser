//
//  M3U8ExtXMedia.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/25/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import "M3U8ExtXMedia.h"


@implementation M3U8ExtXMedia

- (NSURL *)baseURL {
    return self[M3U8_BASE_URL];
}

- (NSString *)type {
    return self[M3U8_EXT_X_MEDIA_TYPE];
}

- (NSString *)URI {
    return self[M3U8_EXT_X_MEDIA_URI];
}

- (NSString *)groupId {
    return self[M3U8_EXT_X_MEDIA_GROUP_ID];
}

- (NSString *)language {
    return self[M3U8_EXT_X_MEDIA_LANGUAGE];
}

- (NSString *)assocLanguage {
    return self[M3U8_EXT_X_MEDIA_ASSOC_LANGUAGE];
}

- (NSString *)name {
    return self[M3U8_EXT_X_MEDIA_NAME];
}

- (BOOL)isDefault {
    return [self[M3U8_EXT_X_MEDIA_DEFAULT] boolValue];
}

- (BOOL)autoSelect {
    return [self[M3U8_EXT_X_MEDIA_AUTOSELECT] boolValue];
}

- (BOOL)forced {
    return [self[M3U8_EXT_X_MEDIA_FORCED] boolValue];
}

- (NSString *)instreamId {
    return self[M3U8_EXT_X_MEDIA_INSTREAM_ID];
}

- (NSString *)characteristics {
    return self[M3U8_EXT_X_MEDIA_CHARACTERISTICS];
}

- (NSString *)m3u8UrlStr {
    return [NSURL URLWithString:self.URI relativeToURL:[self baseURL]];
}

@end
