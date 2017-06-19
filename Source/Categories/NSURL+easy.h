//
//  NSURL+easy.h
//  M3U8KitDemo
//
//  Created by Frank on 16/06/2017.
//

#import <Foundation/Foundation.h>

@interface NSURL (easy)

/**
 如果baseURL存在, 则正常返回, 若为nil, 则返回scheme和host拼接的URL

 @return URL
 */
- (NSURL *)realBaseURL;

@end
