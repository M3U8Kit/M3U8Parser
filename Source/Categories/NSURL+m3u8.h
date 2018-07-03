//
//  NSURL+m3u8.h
//  M3U8Kit
//
//  Created by Frank on 16/06/2017.
//

#import <Foundation/Foundation.h>
#import "M3U8PlaylistModel.h"

@interface NSURL (m3u8)

/**
 如果baseURL存在, 则正常返回, 若为nil, 则返回scheme和host拼接的URL

 @return URL
 */
- (NSURL *)realBaseURL;

/**
 Load the specific url and get result model with completion block.
 
 @param completion when the url resource loaded, completion block could get model and detail error;
 */
- (void)loadM3U8AsynchronouslyCompletion:(void (^)(M3U8PlaylistModel *model, NSError *error))completion;

@end
