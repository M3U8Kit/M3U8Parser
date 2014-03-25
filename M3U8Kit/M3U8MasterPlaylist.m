//
//  M3U8MasterPlaylist.m
//  M3U8Kit
//
//  Created by Sun Jin on 3/25/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//

#import "M3U8MasterPlaylist.h"

@interface M3U8MasterPlaylist ()

@property (nonatomic, copy) NSString *originalText;

@end

@implementation M3U8MasterPlaylist

- (id)initWithContent:(NSString *)string baseURL:(NSURL *)baseURL {
    if (self = [super init]) {
        if ([string isExtendedM3Ufile]) {
            if ([string isMasterPlaylist]) {
                
            } else {
                
            }
        }
    }
    return self;
}

@end
