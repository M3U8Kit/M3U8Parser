//
//  M3U8Parser.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8PlaylistModel.h"

@interface M3U8PlaylistModel()

@property (nonatomic, strong) M3U8MediaPlaylist *mediaPlaylist;


@property (nonatomic, strong) M3U8MasterPlaylist *masterPlaylist;

@property (nonatomic, strong) M3U8ExtXStreamInf *currentXStreamInf;
@property (nonatomic, strong) M3U8ExtXMedia *currentAudio;
@property (nonatomic, strong) M3U8ExtXMedia *currentSubtitle;

@property (nonatomic, strong) M3U8MediaPlaylist *mainMediaPl;
@property (nonatomic, strong) M3U8MediaPlaylist *audioPl;
@property (nonatomic, strong) M3U8MediaPlaylist *subtitlePl;

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
            self.currentXStreamInf = self.masterPlaylist.xStreamList.firstStreamInf;
            if (self.currentXStreamInf) {
                NSError *error;
                self.mainMediaPl = [[M3U8MediaPlaylist alloc] initWithContentOfURL:self.currentXStreamInf.m3u8URL error:&error];
                if (error) {
                    NSLog(@"Get main media playlist failed, error: %@", error);
                }
            }
            M3U8ExtXMediaList *exmlist = self.masterPlaylist.xMediaList;
            M3U8ExtXMediaList *audioList = exmlist.audioList;
            M3U8ExtXMediaList *subtitleList = exmlist.subtitleList;
            
            M3U8ExtXMedia *audio = audioList.firstExtXMedia;
            
            NSString *lan = [[[NSLocale preferredLanguages].firstObject componentsSeparatedByString:@"-"] firstObject];
            for (int i = 0; i < audioList.count; i ++) {
                M3U8ExtXMedia *media = [audioList extXMediaAtIndex:i];
                if ([media.language hasPrefix:@"en"]) {
                    audio = media;
                }
                if (media.isDefault) {
                    audio = media;
                }
                if ([media.language hasPrefix:lan]) {
                    audio = media;
                    break;
                }
            }
            if (audio) {
                self.currentAudio = audio;
                NSError *error;
                self.audioPl = [[M3U8MediaPlaylist alloc] initWithContentOfURL:audio.m3u8URL error:&error];
                self.audioPl.type = M3U8MediaPlaylistTypeAudio;
                if (error) {
                    NSLog(@"Get audio playlist failed, error: %@", error);
                }
            }
            
            M3U8ExtXMedia *subtitle = subtitleList.firstExtXMedia;
            
            for (int i = 0; i < subtitleList.count; i ++) {
                M3U8ExtXMedia *media = [subtitleList extXMediaAtIndex:i];
                if ([media.language hasPrefix:@"en"]) {
                    subtitle = media;
                }
                if (media.isDefault) {
                    subtitle = media;
                }
                if ([media.language hasPrefix:lan]) {
                    subtitle = media;
                    break;
                }
            }
            if (subtitle) {
                NSError *error;
                self.subtitlePl = [[M3U8MediaPlaylist alloc] initWithContentOfURL:subtitle.m3u8URL error:&error];
                self.subtitlePl.type = M3U8MediaPlaylistTypeSubtitle;
                if (error) {
                    NSLog(@"Get subtitle playlist failed, error: %@", error);
                }
            }
            
            
        } else if ([string isMediaPlaylist]) {
            self.mediaPlaylist = [[M3U8MediaPlaylist alloc] initWithContent:string baseURL:URL];
            self.mainMediaPl = self.mediaPlaylist;
        }
    }
    return self;
}

- (NSSet *)allAlternativeURLStrings {
    NSMutableSet *allAlternativeURLStrings = [NSMutableSet set];
    M3U8ExtXStreamInfList *xsilist = self.masterPlaylist.xStreamList;
    for (int i = 0; i < xsilist.count; i ++) {
        M3U8ExtXStreamInf *xsinf = [xsilist extXStreamInfAtIndex:0];
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
        
        
        
    } else {
        return;
    }
}

- (NSArray *)segmentNamesForPlaylist:(M3U8MediaPlaylist *)playlist {
    
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
            return nil;
            break;
    }
    NSUInteger count = playlist.segmentList.count;
    
    NSMutableArray *names = [NSMutableArray array];
    for (NSUInteger index = 0; index < count; index ++) {
        NSString *n = [NSString stringWithFormat:@"%@%ld", prefix, (long)index];
        [names addObject:n];
    }
    return names;
    
}

- (void)savePlaylistsToPath:(NSString *)path {
    if (self.masterPlaylist) {
        NSString *masterContext = self.masterPlaylist.originalText;
        if (self.currentXStreamInf) {
            masterContext = [masterContext stringByReplacingOccurrencesOfString:self.currentXStreamInf.URI withString:[self mainMediaPlaylistName]];
        }
        if (self.currentAudio) {
            
        }
        if (self.currentSubtitle) {
            
        }
        
    } else {
        
    }
}

- (NSString *)indexPlaylistName {
    return @"index.m3u8";
}

- (NSString *)audioPlaylistName {
    return @"x_media_audio.m3u8";
}

- (NSString *)videoPlaylistName {
    return @"x_media_video.m3u8";
}

- (NSString *)subtitlePlaylistName {
    return @"x_media_subtitle.m3u8";
}

- (NSString *)mainMediaPlaylistName {
    return @"main_media.m3u8";
}

@end
