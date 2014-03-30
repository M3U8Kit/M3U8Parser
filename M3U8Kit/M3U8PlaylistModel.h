//
//  M3U8Parser.h
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "M3U8MasterPlaylist.h"
#import "M3U8MediaPlaylist.h"

// 用来管理 m3u playlist, 根据 URL 或者 string 生成 master playlist, 从master playlist 生成指定的 media playlist
// 生成 master playlist
// 提取默认的 media playlist，包括 video segments, subtitles playlist, audio playlist
// 取出media playlist 里面的链接等信息

// 把 master playlist 和 media playlist 中的链接替换 合成为本地服务器可用的playlist

/**
 
 需要下载的内容：
 
 --- master playlist 中的内容，如果有的话
 1. master playlist
 2. 默认的 media playlist, 由第一个 #EXT-X-STREAM-INF Tag 指定
 3. 适合当前系统语言的音频playlist, 如果没有，优先下载默认音频(DEFAULT=YES), 如果没有默认音频，下载英文音频(language="en"), 如果没有，下载第一个
 4. 下载字幕playlist, 选择优先级同上
 5. 忽略EXT-X-MEDIA TYPE＝VIDEO 的项目
 6. 下载各 media playlist 对应的分段内容
 
 */

@interface M3U8PlaylistModel : NSObject

// 如果初始化时的字符串是 master playlist, masterPlaylist 将会被初始化，mediaPlaylist为nil
// 如果初始化时的字符串是 media playlist, mediaPlaylist 将会被初始化，masterPlaylist为nil
// M3U8PlaylistModel 默认会按照《需要下载的内容》规则选取默认的playlist，如果需要手动指定获取特定的media playlist, 需调用方法 -specifyVideoURL:;

@property (readonly, nonatomic, strong) M3U8MasterPlaylist *masterPlaylist;
@property (readonly, nonatomic, strong) M3U8MediaPlaylist *mediaPlaylist;

//
- (id)initWithURL:(NSURL *)URL error:(NSError **)error;
- (id)initWithString:(NSString *)string baseURL:(NSURL *)URL;

- (void)specifyVideoURL:(NSString *)url completion:(void (^)(BOOL success))completion;    // 这个url必须是master playlist 中多码率url中的一个; 如果URL内容获取失败

- (NSString *)indexPlaylistName;

- (NSArray *)segmentNamesForPlaylist:(M3U8MediaPlaylist *)playlist;

- (void)savePlaylistsToPath:(NSString *)path;

@end
