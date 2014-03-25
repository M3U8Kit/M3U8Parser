//
//  M3U8MasterPlaylist.h
//  M3U8Kit
//
//  Created by Sun Jin on 3/25/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M3U8MasterPlaylist : NSObject

@property (readonly, nonatomic, copy) NSString *originalText;

- (id)initWithContent:(NSString *)string baseURL:(NSURL *)baseURL;

@end
