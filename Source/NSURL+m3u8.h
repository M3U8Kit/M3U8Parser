//
//  NSURL+m3u8.h
//  M3U8Kit
//
//  Created by Frank on 16/06/2017.
//

#import <Foundation/Foundation.h>

@class M3U8PlaylistModel;
@interface NSURL (m3u8)

/**
 return baseURL if exists.
 if baseURL is nil, return [scheme://host]

 @return URL
 */
- (NSURL *)realBaseURL;

/**
 Load the specific url and get result model with completion block.
 
 @param completion when the url resource loaded, completion block could get model and detail error;
 */
- (void)loadM3U8AsyncCompletion:(void (^)(M3U8PlaylistModel *model, NSError *error))completion;

@end
