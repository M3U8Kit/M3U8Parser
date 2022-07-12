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
            path: "Source",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath(".")
            ]
        ),
        .testTarget(name: "M3U8ParserTests",
                    dependencies: ["M3U8Parser"],
                    path: "./M3U8KitTests",
                    exclude: []
        ),
    ]
)
