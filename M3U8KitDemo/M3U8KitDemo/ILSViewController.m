//
//  ILSViewController.m
//  M3U8KitDemo
//
//  Created by Sun Jin on 4/22/14.
//  Copyright (c) 2014 iLegendsoft. All rights reserved.
//

#import "ILSViewController.h"

#import "M3U8Kit.h"

@interface ILSViewController ()

@end

@implementation ILSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSTimeInterval begin = [NSDate timeIntervalSinceReferenceDate];
        
        NSError *error;
        
        //NSURL* url = [[NSBundle main] URLForResource:@"769" withExtension:@"m3u8"];
        NSURL* url =  [NSURL URLWithString:@"https://hls.ted.com/talks/2639.m3u8?preroll=Thousands"]
        M3U8PlaylistModel *model = [[M3U8PlaylistModel alloc] initWithURL:url error:&error];

        if (error) {
            NSLog(@"error: %@", error);
        }
        
        NSLog(@"Session Key %@", model.masterPlaylist.xSessionKey);
        
        NSLog(@"segments names: %@", [model segmentNamesForPlaylist:model.audioPl]);
        
        NSString *m3u8Path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"str.m3u8"];
        error = nil;
        [model savePlaylistsToPath:m3u8Path error:&error];
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
