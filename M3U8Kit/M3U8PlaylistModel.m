//
//  M3U8Parser.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8PlaylistModel.h"

#define INDEX_PLAYLIST_NAME @"index.m3u8"

#define PREFIX_MAIN_MEDIA_PLAYLIST @"main_media_"
#define PREFIX_AUDIO_PLAYLIST @"x_media_audio_"
#define PREFIX_SUBTITLES_PLAYLIST @"x_media_subtitles_"

@interface M3U8PlaylistModel()

@property (nonatomic, strong) M3U8MasterPlaylist *masterPlaylist;

@property (nonatomic, strong) M3U8ExtXStreamInf *currentXStreamInf;

@property (nonatomic, strong) M3U8MediaPlaylist *mainMediaPl;
@property (nonatomic, strong) M3U8MediaPlaylist *audioPl;
//@property (nonatomic, strong) M3U8MediaPlaylist *subtitlePl;

@end

@implementation M3U8PlaylistModel

- (id)initWithURL:(NSURL *)URL error:(NSError **)error {
    
    NSString *str = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:error];
    
    return [self initWithString:str baseURL:URL];
}

- (id)initWithString:(NSString *)string baseURL:(NSURL *)URL {
    
    if (NO == [string isExtendedM3Ufile]) {
        return nil;
    }
    
    if (self = [super init]) {
        if ([string isMasterPlaylist]) {
            self.masterPlaylist = [[M3U8MasterPlaylist alloc] initWithContent:string baseURL:URL];
            self.masterPlaylist.name = INDEX_PLAYLIST_NAME;
            self.currentXStreamInf = self.masterPlaylist.xStreamList.firstStreamInf;
            if (self.currentXStreamInf) {
                NSError *error;
                self.mainMediaPl = [[M3U8MediaPlaylist alloc] initWithContentOfURL:self.currentXStreamInf.m3u8URL type:M3U8MediaPlaylistTypeMedia error:&error];
                self.mainMediaPl.name = [NSString stringWithFormat:@"%@1.m3u8", PREFIX_MAIN_MEDIA_PLAYLIST];
                if (error) {
                    NSLog(@"Get main media playlist failed, error: %@", error);
                }
            }
            
            // get audioPl
            M3U8ExtXStreamInfList *list = self.masterPlaylist.xStreamList;
            if (list.count > 1) {
                for (int i = 0; i < list.count; i++) {
                    M3U8ExtXStreamInf *xsinf = [list xStreamInfAtIndex:i];
                    if (xsinf.codecs.count == 1) {
                        self.audioPl = [[M3U8MediaPlaylist alloc] initWithContentOfURL:xsinf.m3u8URL type:M3U8MediaPlaylistTypeAudio error:NULL];
                        self.audioPl.name = [NSString stringWithFormat:@"%@0", PREFIX_AUDIO_PLAYLIST];
                        break;
                    }
                }
            }
            
        } else if ([string isMediaPlaylist]) {
            self.mainMediaPl = [[M3U8MediaPlaylist alloc] initWithContent:string type:M3U8MediaPlaylistTypeMedia baseURL:URL];
            self.mainMediaPl.name = INDEX_PLAYLIST_NAME;
        }
    }
    return self;
}

- (NSSet *)allAlternativeURLStrings {
    NSMutableSet *allAlternativeURLStrings = [NSMutableSet set];
    M3U8ExtXStreamInfList *xsilist = self.masterPlaylist.xStreamList;
    for (int i = 0; i < xsilist.count; i ++) {
        M3U8ExtXStreamInf *xsinf = [xsilist xStreamInfAtIndex:0];
        [allAlternativeURLStrings addObject:xsinf.m3u8URL.absoluteString];
    }
    
    // 暂时只有在分辨率选择的时候用到
//    M3U8ExtXMediaList *xmlist = self.masterPlaylist.xMediaList.videoList;
//    for (int i = 0; i < xmlist.count; i ++) {
//        M3U8ExtXMedia *media = [xmlist extXMediaAtIndex:i];
//        [allAlternativeURLStrings addObject:media.m3u8URL.absoluteString];
//    }
    return allAlternativeURLStrings;
}

- (void)specifyVideoURL:(NSString *)url completion:(void (^)(BOOL))completion {
    if (nil == url || nil == self.masterPlaylist) {
        return;
    }
    
    if ([self.allAlternativeURLStrings containsObject:url]) {
        NSError *error;
        M3U8MediaPlaylist *pl = [[M3U8MediaPlaylist alloc] initWithContentOfURL:[NSURL URLWithString:url] type:M3U8MediaPlaylistTypeMedia error:&error];
        if (pl) {
            self.mainMediaPl = pl;
        }
        
    } else {
        return;
    }
}

- (NSString *)prefixOfSegmentNameInPlaylist:(M3U8MediaPlaylist *)playlist {
    NSString *prefix = nil;
    
    switch (playlist.type) {
        case M3U8MediaPlaylistTypeMedia:
            prefix = @"main_media_";
            break;
        case M3U8MediaPlaylistTypeAudio:
            prefix = @"ext-x-media-audio_";
            break;
        case M3U8MediaPlaylistTypeSubtitle:
            prefix = @"ext-x-media-subtitle_";
            break;
        case M3U8MediaPlaylistTypeVideo:
            prefix = @"ext-x-media-video_";
            break;
            
        default:
            return @"";
            break;
    }
    return prefix;
}

- (NSArray *)segmentNamesForPlaylist:(M3U8MediaPlaylist *)playlist {
    
    NSUInteger count = playlist.segmentList.count;
    
    NSString *prefix = [self prefixOfSegmentNameInPlaylist:playlist];
    NSMutableArray *names = [NSMutableArray array];
    for (NSUInteger index = 0; index < count; index ++) {
        NSString *n = [NSString stringWithFormat:@"%@%ld", prefix, (long)index];
        [names addObject:n];
    }
    return names;
}

- (void)savePlaylistsToPath:(NSString *)path error:(NSError **)error {
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        if (NO == [[NSFileManager defaultManager] removeItemAtPath:path error:error]) {
            return;
        }
    }
    if (NO == [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error]) {
        return;
    }
    
    if (self.masterPlaylist) {
        
        // master playlist
        NSString *masterContext = self.masterPlaylist.originalText;
        for (int i = 0; i < self.masterPlaylist.xStreamList.count; i ++) {
            M3U8ExtXStreamInf *xsinf = [self.masterPlaylist.xStreamList xStreamInfAtIndex:i];
            NSString *name = [NSString stringWithFormat:@"%@%d.m3u8", PREFIX_MAIN_MEDIA_PLAYLIST, i];
            masterContext = [masterContext stringByReplacingOccurrencesOfString:xsinf.URI withString:name];
        }
        NSString *mPath = [path stringByAppendingPathComponent:self.indexPlaylistName];
        BOOL success = [masterContext writeToFile:mPath atomically:YES encoding:NSUTF8StringEncoding error:error];
        if (NO == success) {
            NSLog(@"M3U8Kit Error: failed to save master playlist to file.");
            return;
        }
        
        // main media playlist
        [self saveMediaPlaylist:self.mainMediaPl toPath:path error:error];
        
    } else {
        [self saveMediaPlaylist:self.mainMediaPl toPath:path error:error];
    }
}

- (void)saveMediaPlaylist:(M3U8MediaPlaylist *)playlist toPath:(NSString *)path error:(NSError **)error {
    NSString *mainMediaPlContext = playlist.originalText;
    for (int i = 0; i < playlist.segmentList.count; i ++) {
        M3U8SegmentInfo *sinfo = [playlist.segmentList segmentInfoAtIndex:i];
        NSString *name = [NSString stringWithFormat:@"%@%d", [self prefixOfSegmentNameInPlaylist:playlist], i];
        mainMediaPlContext = [mainMediaPlContext stringByReplacingOccurrencesOfString:sinfo.URI withString:name];
    }
    NSString *mainMediaPlPath = [path stringByAppendingPathComponent:playlist.name];
    BOOL success = [mainMediaPlContext writeToFile:mainMediaPlPath atomically:YES encoding:NSUTF8StringEncoding error:error];
    if (NO == success) {
        NSLog(@"M3U8Kit Error: failed to save mian media playlist to file.");
        return;
    }
}

- (NSString *)indexPlaylistName {
    return INDEX_PLAYLIST_NAME;
}

@end
