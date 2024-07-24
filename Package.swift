// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlyreelFNOL",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FlyreelFNOL",
            targets: ["FlyreelFNOL"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "FlyreelFNOL",
            path: "FlyreelFNOL.xcframework"
        )
    ]
)
