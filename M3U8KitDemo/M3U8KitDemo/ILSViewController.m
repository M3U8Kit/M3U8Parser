//
//  ILSViewController.m
//  M3U8KitDemo
//
//  Created by Sun Jin on 4/22/14.
//  Copyright (c) 2014 iLegendsoft. All rights reserved.
//

#import "ILSViewController.h"

#import <M3U8Kit/M3U8Kit.h>

@interface ILSViewController ()

@end

@implementation ILSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSTimeInterval begin = [NSDate timeIntervalSinceReferenceDate];
        
        NSString *baseURL = @"http://hls.ted.com/";
        NSString *path = [[NSBundle mainBundle] pathForResource:@"769" ofType:@"m3u8"];
        NSError *error;
        NSString *str = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSLog(@"error: %@", error);
        }
        
        M3U8PlaylistModel *medel = [[M3U8PlaylistModel alloc] initWithString:str baseURL:baseURL error:NULL];
        
        NSLog(@"segments names: %@", [medel segmentNamesForPlaylist:medel.audioPl]);
        
        NSString *m3u8Path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"str.m3u8"];
        error = nil;
        [medel savePlaylistsToPath:m3u8Path error:&error];
        if (error) {
            NSLog(@"playlists save error: %@", error);
        }
        
        NSTimeInterval end = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"spend time = %f", end - begin);
        
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
