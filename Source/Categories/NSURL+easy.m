//
//  NSURL+easy.m
//  M3U8KitDemo
//
//  Created by Frank on 16/06/2017.
//  Copyright © 2017 iLegendsoft. All rights reserved.
//

#import "NSURL+easy.h"

@implementation NSURL (easy)

- (NSURL *)realBaseURL {
    NSURL *baseURL = self.baseURL;
    if (!baseURL) {
        NSString *string = [NSString stringWithFormat:@"%@://%@", self.scheme, self.host];
        
        baseURL = [NSURL URLWithString:string];
    }
    
    return baseURL;
}

@end
