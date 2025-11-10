// swift-tools-version:5.3

import Foundation
import PackageDescription

let package = Package(
    name: "M3U8Kit",
    products: [
        .library(name: "M3U8Kit", targets: ["M3U8Kit"]),
    ],
    dependencies : [],
    targets: [
        .target(
            name: "M3U8Kit",
            dependencies: [],
            path: "Source",
            resources: [.copy("PrivacyInfo.xcprivacy")],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath(".")
            ]
        ),
        .testTarget(name: "M3U8ParserTests",
                    dependencies: ["M3U8Kit"],
                    path: "./M3U8KitTests",
                    exclude: []
        ),
    ]
)
