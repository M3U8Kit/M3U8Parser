//
//  StringExample.m
//  M3U8KitTests
//
//  Created by Frank on 2019/3/5.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "StringExample.h"

@implementation StringExample

- (NSString *)m3u8Playlist {
    return
    @"#EXTM3U\n\
    #EXT-X-VERSION:3\n\
    #EXT-X-TARGETDURATION:11\n\
    #EXT-X-MEDIA-SEQUENCE:0\n\
    #EXT-X-MAP:URI=\"https://example.m3u8kit/xMap/init.mp4\",BYTERANGE=7355608@666\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:2.000000 logo=\"someURI/target.png\" tvg-id=\"Rotana Cinema\" tvg-country=\"SA\" tvg-language=\"Arabic\" tvg-logo=\"tvgURI/logo.png\",\n\
    #EXT-X-BYTERANGE:3008@940\n\
    f0.ts?start=0&end=279759&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:2.000000,\n\
    f1.ts?start=279760&end=745071&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:2.000000,\n\
    f230.ts?start=745072&end=1053023&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:1.750000,\n\
    f230.ts?start=1053024&end=1264527&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:2.000000,\n\
    f230.ts?start=1264528&end=1457807&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:2.000000,\n\
    f230.ts?start=1457808&end=1682671&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:2.000000,\n\
    f230.ts?start=1682672&end=1921631&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:4.250000,\n\
    f230.ts?start=1921632&end=2607471&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:6.500000,\n\
    f230.ts?start=2607472&end=3534319&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:1.500000,\n\
    f230.ts?start=3534320&end=3791327&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:6.000000,\n\
    f230.ts?start=3791328&end=4652191&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:6.000000,\n\
    f230.ts?start=4652192&end=5676991&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:6.000000,\n\
    f230.ts?start=5676992&end=6615311&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.000000,\n\
    f230.ts?start=6615312&end=7973055&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.000000,\n\
    f230.ts?start=7973056&end=9405631&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.000000,\n\
    f230.ts?start=9405632&end=10977135&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.416667,\n\
    f230.ts?start=10977136&end=12519311&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.416667,\n\
    f230.ts?start=12519312&end=14119199&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.416667,\n\
    f230.ts?start=14119200&end=15754239&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.416667,\n\
    f230.ts?start=15754240&end=17096383&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.416667,\n\
    f230.ts?start=17096384&end=18835023&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:10.416667,\n\
    f230.ts?start=18835024&end=19755295&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-KEY:METHOD=AES-128,URI=\"https://example.m3u8kit/get_video_key.php?edk=CiA61uBk9j6jp9V5Rs1LFLMDZmfgnepZhtsOyA1VJc8%2FwxCO08TAChiaoOvUBCokYjRhNjFiNTgtMmVhNy00OWYxLgwZGMtZTE0NTIyODc5YWIy&fileId=5285890782612785655&keySource=VodBuildInKMS\",IV=0x00000000000000000000000000000000\n\
    #EXTINF:8.458333,\n\
    f230.ts?start=19755296&end=21154591&type=mpegts&t=5c7e38d0&us=838110&sign=48b2231ae4a5830973c838838d722c7d\n\
    #EXT-X-ENDLIST";
}

- (NSString *)m3u8Master {
    return
    @"#EXTM3U\n\
    #EXT-X-VERSION:4\n\
    #EXT-X-SESSION-KEY:METHOD=SAMPLE-AES,URI=\"skd://AZSkNGRhODQtMjE3My00ZDIdSDFEzN2QtYzE1YTczMTRjZjkw\",KEYFORMAT=\"com.apple.streamingkeydelivery\"\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=915685,PROGRAM-ID=1,CODECS=\"avc1.42c01e,mp4a.40.2\",RESOLUTION=640x360,SUBTITLES=\"subs\",FRAME-RATE=7355608\n\
    http://hls.ted.com/talks/769/video/600k.m3u8?sponsor=Ripple\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=131499,PROGRAM-ID=1,CODECS=\"avc1.42c00c,mp4a.40.2\",RESOLUTION=320x180,SUBTITLES=\"subs\"\n\
    /talks/769/video/64k.m3u8?sponsor=Ripple\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=303297,PROGRAM-ID=1,CODECS=\"avc1.42c015,mp4a.40.2\",RESOLUTION=512x288,SUBTITLES=\"subs\"\n\
    /talks/769/video/180k.m3u8?sponsor=Ripple\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=548342,PROGRAM-ID=1,CODECS=\"avc1.42c015,mp4a.40.2\",RESOLUTION=512x288,SUBTITLES=\"subs\"\n\
    /talks/769/video/320k.m3u8?sponsor=Ripple\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=739016,PROGRAM-ID=1,CODECS=\"avc1.42c015,mp4a.40.2\",RESOLUTION=512x288,SUBTITLES=\"subs\"\n\
    /talks/769/video/450k.m3u8?sponsor=Ripple\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=1354552,PROGRAM-ID=1,CODECS=\"avc1.4d401f,mp4a.40.2\",RESOLUTION=853x480,SUBTITLES=\"subs\"\n\
    /talks/769/video/950k.m3u8?sponsor=Ripple\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=2112869,PROGRAM-ID=1,CODECS=\"avc1.64001f,mp4a.40.2\",RESOLUTION=853x480,SUBTITLES=\"subs\"\n\
    /talks/769/video/1500k.m3u8?sponsor=Ripple\n\
    #EXT-X-STREAM-INF:AUDIO=\"600k\",BANDWIDTH=67880,PROGRAM-ID=1,CODECS=\"mp4a.40.2\",SUBTITLES=\"subs\"\n\
    /talks/769/audio/600k.m3u8?sponsor=Ripple\n\
    \n\
    #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=65531,PROGRAM-ID=1,CODECS=\"avc1.42c00c\",RESOLUTION=320x180,URI=\"64k_iframe.m3u8?sponsor=Ripple\"\n\
    #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=137561,PROGRAM-ID=1,CODECS=\"avc1.42c015\",RESOLUTION=512x288,URI=\"/talks/769/video/180k_iframe.m3u8?sponsor=Ripple\"\n\
    #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=188000,PROGRAM-ID=1,CODECS=\"avc1.42c015\",RESOLUTION=512x288,URI=\"/talks/769/video/320k_iframe.m3u8?sponsor=Ripple\"\n\
    #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=216827,PROGRAM-ID=1,CODECS=\"avc1.42c015\",RESOLUTION=512x288,URI=\"/talks/769/video/450k_iframe.m3u8?sponsor=Ripple\"\n\
    #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=276987,PROGRAM-ID=1,CODECS=\"avc1.42c01e\",RESOLUTION=640x360,URI=\"/talks/769/video/600k_iframe.m3u8?sponsor=Ripple\"\n\
    #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=413600,PROGRAM-ID=1,CODECS=\"avc1.4d401f\",RESOLUTION=853x480,URI=\"http://hls.ted.com/talks/769/video/950k_iframe.m3u8?sponsor=Ripple\"\n\
    #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=495067,PROGRAM-ID=1,CODECS=\"avc1.64001f,m4a.40.2\",RESOLUTION=853x480,URI=\"/talks/769/video/1500k_iframe.m3u8?sponsor=Ripple\"\n\
    \n\
    #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"600k\",LANGUAGE=\"eng\",NAME=\"Audio\",AUTOSELECT=YES,DEFAULT=YES,URI=\"600k.m3u8?sponsor=Ripple\",BANDWIDTH=614400\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"ar\",NAME=\"Arabic\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/ar.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"bs\",NAME=\"Bosnian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/bs.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"bg\",NAME=\"Bulgarian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/bg.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"ca\",NAME=\"Catalan\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/ca.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"zh-cn\",NAME=\"Chinese, Simplified\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"http://hls.ted.com/talks/769/subtitles/zh-cn.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"zh-tw\",NAME=\"Chinese, Traditional\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/zh-tw.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"hr\",NAME=\"Croatian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/hr.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"cs\",NAME=\"Czech\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/cs.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"nl\",NAME=\"Dutch\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/nl.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"en\",NAME=\"English\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/en.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"fr\",NAME=\"French\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/fr.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"de\",NAME=\"German\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/de.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"el\",NAME=\"Greek\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/el.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"he\",NAME=\"Hebrew\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/he.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"hu\",NAME=\"Hungarian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/hu.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"id\",NAME=\"Indonesian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/id.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"it\",NAME=\"Italian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/it.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"ja\",NAME=\"Japanese\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/ja.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"ko\",NAME=\"Korean\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/ko.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"lt\",NAME=\"Lithuanian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/lt.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"mk\",NAME=\"Macedonian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/mk.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"fa\",NAME=\"Persian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/fa.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"pl\",NAME=\"Polish\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/pl.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"pt\",NAME=\"Portuguese\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/pt.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"pt-br\",NAME=\"Portuguese, Brazilian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/pt-br.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"ro\",NAME=\"Romanian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/ro.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"ru\",NAME=\"Russian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/ru.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"sk\",NAME=\"Slovak\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/sk.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"es\",NAME=\"Spanish\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/es.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"tr\",NAME=\"Turkish\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/tr.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"uk\",NAME=\"Ukrainian\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/uk.m3u8?sponsor=Ripple\"\n\
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID=\"subs\",LANGUAGE=\"vi\",NAME=\"Vietnamese\",AUTOSELECT=YES,DEFAULT=NO,FORCED=NO,URI=\"/talks/769/subtitles/vi.m3u8?sponsor=Ripple\"\n\
    \n\
    baseURL=\"http://hls.ted.com\"\n\
    ";
}

@end
