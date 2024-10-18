// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LLGeneral",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "LLGeneral",
            targets: ["LLGeneral"]
        )
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "LLGeneral",
            dependencies: []
        )
    ]
)
