// swift-tools-version:5.0

import Foundation
import PackageDescription

let package = Package(
    name: "M3U8Parser",
    products: [
        .library(name: "M3U8Parser", targets: ["M3U8Parser"]),
    ],
    dependencies : [],
    targets: [
        .target(
            name: "M3U8Parser",
            dependencies: [],
            path: ".",
            sources: [
                "Source/NSString+m3u8.m",
                "Source/NSURL+m3u8.m",
                "Source/M3U8PlaylistModel.m",
                "Source/M3U8ExtXMedia.m",
                "Source/M3U8ExtXKey.m",
                "Source/M3U8ExtXMediaList.m",
                "Source/M3U8ExtXStreamInf.m",
                "Source/M3U8ExtXStreamInfList.m",
                "Source/M3U8MasterPlaylist.m",
                "Source/M3U8LineReader.m",
                "Source/M3U8MediaPlaylist.m",
                "Source/M3U8SegmentInfo.m",
                "Source/M3U8SegmentInfoList.m",
                "Source/M3U8ExtXByteRange.m",
                
            ],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("Source")
                
            ]
        ),
        .testTarget(name: "M3U8ParserTests",
                    dependencies: ["M3U8Parser"],
                    path: "./M3U8KitTests",
                    exclude: []
        ),
    ]
)
