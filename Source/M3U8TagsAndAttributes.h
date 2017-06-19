//
//  M3U8TagsAndAttributes.h
//  M3U8Kit
//
//  Created by Sun Jin on 3/24/14.
//  Copyright (c) 2014 Jin Sun. All rights reserved.
//


// M3U8 Tags & Attributes definded in Draft Pantos Http Live Streaming 12 http://tools.ietf.org/html/draft-pantos-http-live-streaming-12

#define M3U8_URL @"URL"

#define M3U8_BASE_URL @"baseURL"


///------------------------------
/// Standard Tags
///------------------------------

#define M3U8_EXTM3U                         @"#EXTM3U"

/**
 @format  #EXTINF:<duration>,<title>
 */
#define M3U8_EXTINF                         @"#EXTINF:"
#define M3U8_EXTINF_DURATION                @"DURATION"
#define M3U8_EXTINF_TITLE                   @"TITLE"
#define M3U8_EXTINF_URI                     @"URI"


/// NEW TAGS
/**
 @format  #EXT-X-BYTERANGE:<n>[@<o>]
 
 @note The EXT-X-BYTERANGE tag appeared in version 4 of the protocol.  It MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_BYTERANGE                @"#EXT-X-BYTERANGE:"


/**
 @format  #EXT-X-TARGETDURATION:<s>
 
 @note The EXT-X-TARGETDURATION tag MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_TARGETDURATION           @"#EXT-X-TARGETDURATION:"


/**
 @format  #EXT-X-MEDIA-SEQUENCE:<number>
 @note  The EXT-X-MEDIA-SEQUENCE tag MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_MEDIA_SEQUENCE           @"#EXT-X-MEDIA-SEQUENCE:"



/// EXT-X-KEY
/**
 @format  #EXT-X-KEY:<attribute-list>     ps: We may need download the key file at URI.
 */
#define M3U8_EXT_X_KEY                      @"#EXT-X-KEY:"
// EXT-X-KEY Attributes
#define M3U8_EXT_X_KEY_METHOD               @"METHOD"   // The value is an enumerated-string that specifies the encryption method.  This attribute is REQUIRED.
                                                        // The methods defined are: NONE, AES-128, and SAMPLE-AES.
#define M3U8_EXT_X_KEY_URI                  @"URI"  //  The value is a quoted-string containing a URI [RFC3986] that specifies how to obtain the key.  This attribute is REQUIRED unless the METHOD is NONE.
#define M3U8_EXT_X_KEY_IV                   @"IV"   // The value is a hexadecimal-integer that specifies the Initialization Vector to be used with the key.
#define M3U8_EXT_X_KEY_KEYFORMAT            @"KEYFORMAT"    // The value is a quoted-string that specifies how the key is represented in the resource identified by the URI
#define M3U8_EXT_X_KEY_KEYFORMATVERSIONS    @"KEYFORMATVERSIONS" // The value is a quoted-string containing one or more positive integers separated by the "/" character (for example, "1/3").


/**
 @format: #EXT-X-PROGRAM-DATE-TIME:<YYYY-MM-DDThh:mm:ssZ>
 @note The EXT-X-PROGRAM-DATE-TIME tag MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_PROGRAM_DATE_TIME        @"#EXT-X-PROGRAM-DATE-TIME:"


/**
 @format: #EXT-X-ALLOW-CACHE:<YES|NO>      
 @note It MUST NOT occur more than once.
 */
#define M3U8_EXT_X_ALLOW_CACHE              @"#EXT-X-ALLOW-CACHE:"


/**
 @format: #EXT-X-PLAYLIST-TYPE:<EVENT|VOD>
 @note The EXT-X-PLAYLIST-TYPE tag MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_PLAYLIST_TYPE            @"#EXT-X-PLAYLIST-TYPE:"


/**
 @format: #EXT-X-ENDLIST   ps: it MUST NOT occur more than once.
 @note The EXT-X-ENDLIST tag MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_ENDLIST                  @"#EXT-X-ENDLIST"



/// EXT-X-MEDIA
/**
 @format    #EXT-X-MEDIA:<attribute-list> ,  attibute-list: ATTR=<value>,...
 @example   #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="600k",LANGUAGE="eng",NAME="Audio",AUTOSELECT=YES,DEFAULT=YES,URI="/talks/769/audio/600k.m3u8?sponsor=Ripple",BANDWIDTH=614400
 */
#define M3U8_EXT_X_MEDIA                    @"#EXT-X-MEDIA:"
//  EXT-X-MEDIA attributes
#define M3U8_EXT_X_MEDIA_TYPE               @"TYPE" // The value is enumerated-string; valid strings are AUDIO, VIDEO, SUBTITLES and CLOSED-CAPTIONS.
#define M3U8_EXT_X_MEDIA_URI                @"URI"  // The value is a quoted-string containing a URI that identifies the Playlist file.
#define M3U8_EXT_X_MEDIA_GROUP_ID           @"GROUP-ID" // The value is a quoted-string identifying a mutually-exclusive group of renditions.
#define M3U8_EXT_X_MEDIA_LANGUAGE           @"LANGUAGE" // The value is a quoted-string containing an RFC 5646 [RFC5646] language tag that identifies the primary language used in the rendition.
#define M3U8_EXT_X_MEDIA_ASSOC_LANGUAGE     @"ASSOC-LANGUAGE"   // The value is a quoted-string containing an RFC 5646 [RFC5646](http://tools.ietf.org/html/rfc5646) language tag that identifies a language that is associated with the rendition.
#define M3U8_EXT_X_MEDIA_NAME               @"NAME" // The value is a quoted-string containing a human-readable description of the rendition.
#define M3U8_EXT_X_MEDIA_DEFAULT            @"DEFAULT" // The value is an enumerated-string; valid strings are YES and NO.
#define M3U8_EXT_X_MEDIA_AUTOSELECT         @"AUTOSELECT" // The value is an enumerated-string; valid strings are YES and NO.
#define M3U8_EXT_X_MEDIA_FORCED             @"FORCED"   // The value is an enumerated-string; valid strings are YES and NO.
#define M3U8_EXT_X_MEDIA_INSTREAM_ID        @"INSTREAM-ID" // The value is a quoted-string that specifies a rendition within the segments in the Media Playlist.
#define M3U8_EXT_X_MEDIA_CHARACTERISTICS    @"CHARACTERISTICS" // The value is a quoted-string containing one or more Uniform Type Identifiers [UTI] separated by comma (,) characters.
#define M3U8_EXT_X_MEDIA_BANDWIDTH          @"BANDWIDTH"


/// EXT-X-STREAM-INF
/**
 @format    #EXT-X-STREAM-INF:<attribute-list>
            <URI>
 @example   #EXT-X-STREAM-INF:AUDIO="600k",BANDWIDTH=915685,PROGRAM-ID=1,CODECS="avc1.42c01e,mp4a.40.2",RESOLUTION=640x360,SUBTITLES="subs"
            /talks/769/video/600k.m3u8?sponsor=Ripple
 
 @note      The EXT-X-STREAM-INF tag MUST NOT appear in a Media Playlist.
 */
#define M3U8_EXT_X_STREAM_INF               @"#EXT-X-STREAM-INF:"
// EXT-X-STREAM-INF Attributes
#define M3U8_EXT_X_STREAM_INF_BANDWIDTH     @"BANDWIDTH" // The value is a decimal-integer of bits per second.
#define M3U8_EXT_X_STREAM_INF_PROGRAM_ID    @"PROGRAM-ID"   // The value is a decimal-integer that uniquely identifies a particular presentation within the scope of the Playlist file.
#define M3U8_EXT_X_STREAM_INF_CODECS        @"CODECS" // The value is a quoted-string containing a comma-separated list of formats.
#define M3U8_EXT_X_STREAM_INF_RESOLUTION    @"RESOLUTION" // The value is a decimal-resolution describing the approximate encoded horizontal and vertical resolution of video within the presentation.
#define M3U8_EXT_X_STREAM_INF_AUDIO         @"AUDIO" // The value is a quoted-string.
#define M3U8_EXT_X_STREAM_INF_VIDEO         @"VIDEO" // The value is a quoted-string.
#define M3U8_EXT_X_STREAM_INF_SUBTITLES     @"SUBTITLES" // The value is a quoted-string.
#define M3U8_EXT_X_STREAM_INF_CLOSED_CAPTIONS   @"CLOSED-CAPTIONS" // The value can be either a quoted-string or an enumerated-string with the value NONE.
#define M3U8_EXT_X_STREAM_INF_URI           @"URI"  // The value is a enumerated-string containing a URI that identifies the Playlist file.



/**
 @format #EXT-X-DISCONTINUITY
 @note  The EXT-X-DISCONTINUITY tag MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_DISCONTINUITY            @"#EXT-X-DISCONTINUITY"


/**
 @format #EXT-X-DISCONTINUITY-SEQUENCE:<number>  where number is a decimal-integer.
 @note   The discontinuity sequence number MUST NOT decrease.
         A Media Playlist MUST NOT contain more than one EXT-X-DISCONTINUITY-SEQUENCE tag.
 */
#define M3U8_EXT_X_DISCONTINUITY_SEQUENCE   @"#EXT-X-DISCONTINUITY-SEQUENCE:"


/**
 @format #EXT-X-I-FRAMES-ONLY
 @note   The EXT-X-I-FRAMES-ONLY tag MUST NOT appear in a Master Playlist.(v4)
 */
#define M3U8_EXT_X_I_FRAMES_ONLY            @"#EXT-X-I-FRAMES-ONLY"



/// EXT-X-MAP
/**
 @format    #EXT-X-MAP:<attribute-list>
 @note      The EXT-X-MAP tag MUST NOT appear in a Master Playlist.
 */
#define M3U8_EXT_X_MAP                      @"#EXT-X-MAP:"
// EXT-X-MAP attributes
#define M3U8_EXT_X_MAP_URI                  @"URI"  // The value is a quoted-string containing a URI that identifies a resource that contains segment header information.  This attribute is REQUIRED.
#define M3U8_EXT_X_MAP_BYTERANGE            @"BYTERANGE" // The value is a quoted-string specifying a byte range into the resource identified by the URI attribute.



/// EXT-X-I-FRAME-STREAM-INF
/**
 @format    #EXT-X-I-FRAME-STREAM-INF:<attribute-list>
 @example   #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=65531,PROGRAM-ID=1,CODECS="avc1.42c00c",RESOLUTION=320x180,URI="/talks/769/video/64k_iframe.m3u8?sponsor=Ripple"
 
 @note      All attributes defined for the EXT-X-STREAM-INF tag (Section 3.4.10) are also defined for the EXT-X-I-FRAME-STREAM-INF tag, except for the AUDIO, SUBTITLES and CLOSED-CAPTIONS attributes.
            The EXT-X-I-FRAME-STREAM-INF tag MUST NOT appear in a Media Playlist.
 */
#define M3U8_EXT_X_I_FRAME_STREAM_INF       @"#EXT-X-I-FRAME-STREAM-INF:"
// EXT-X-I-FRAME-STREAM-INF Attributes
#define M3U8_EXT_X_I_FRAME_STREAM_INF_URI           @"URI"  // The value is a quoted-string containing a URI that identifies the I-frame Playlist file.
#define M3U8_EXT_X_I_FRAME_STREAM_INF_BANDWIDTH     @"BANDWIDTH" // The value is a decimal-integer of bits per second.
#define M3U8_EXT_X_I_FRAME_STREAM_INF_PROGRAM_ID    @"PROGRAM-ID"   // The value is a decimal-integer that uniquely identifies a particular presentation within the scope of the Playlist file.
#define M3U8_EXT_X_I_FRAME_STREAM_INF_CODECS        @"CODECS" // The value is a quoted-string containing a comma-separated list of formats.
#define M3U8_EXT_X_I_FRAME_STREAM_INF_RESOLUTION    @"RESOLUTION" // The value is a decimal-resolution describing the approximate encoded horizontal and vertical resolution of video within the presentation.
#define M3U8_EXT_X_I_FRAME_STREAM_INF_VIDEO         @"VIDEO" // The value is a quoted-string.




/// EXT-X-START
/**
 @format    #EXT-X-START:<attribute list>
 */
#define M3U8_EXT_X_START                    @"#EXT-X-START:"
// EXT-X-START Attributes
#define M3U8_EXT_X_START_TIME_OFFSET        @"TIME-OFFSET"  // The value of TIME-OFFSET is a decimal-floating-point number of seconds.
#define M3U8_EXT_X_START_PRECISE            @"PRECISE" // The value is an enumerated-string; valid strings are YES and NO.





/**
 @format   #EXT-X-VERSION:<n>   where n is an integer indicating the protocol version.
 */
#define M3U8_EXT_X_VERSION                  @"#EXT-X-VERSION:"

















