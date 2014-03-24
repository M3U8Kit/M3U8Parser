//
//  M3U8TagsAndAttributes.h
//  M3U8Kit
//
//  Created by Sun Jin on 3/24/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//


// M3U8 Tags & Attributes according to Draft Pantos Http Live Streaming 12 http://tools.ietf.org/html/draft-pantos-http-live-streaming-12


///------------------------------
/// Standard Tags
///------------------------------

#define M3U8_EXTM3U                 @"#EXTM3U"

#define M3U8_EXTINF                 @"#EXTINF:"                 // format:  #EXTINF:<duration>,<title>

/// NEW TAGS
#define M3U8_EXT_X_BYTERANGE        @"#EXT-X-BYTERANGE:"        // format:  #EXT-X-BYTERANGE:<n>[@<o>]
                                                                // The EXT-X-BYTERANGE tag appeared in version 4 of the protocol.  It MUST NOT appear in a Master Playlist.

#define M3U8_EXT_X_TARGETDURATION   @"#EXT-X-TARGETDURATION:"   // format:  #EXT-X-TARGETDURATION:<s>
                                                                // The EXT-X-TARGETDURATION tag MUST NOT appear in a Master Playlist.

#define M3U8_EXT_X_MEDIA_SEQUENCE   @"#EXT-X-MEDIA-SEQUENCE:"   // format:  #EXT-X-MEDIA-SEQUENCE:<number>
                                                                // The EXT-X-MEDIA-SEQUENCE tag MUST NOT appear in a Master Playlist.



#define M3U8_EXT_X_KEY              @"#EXT-X-KEY:"              // format:  #EXT-X-KEY:<attribute-list>
                                                                // The value is an enumerated-string that specifies the encryption method.  This attribute is REQUIRED.
// attribute-list
// 1. METHOD
