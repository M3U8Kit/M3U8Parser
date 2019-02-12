//
//  M3U8ExtXSessionKey.h
//  M3U8Kit
//
//  Created by Pierre Perrin on 01/02/2019.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface M3U8ExtXSessionKey : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)method;
- (NSString *)url;
- (NSString *)keyFormat;

@end
